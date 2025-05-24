import 'dart:convert';

import 'package:app_flutter_starter_for_job/src/core/constants/api_path/api_path.dart';
import 'package:app_flutter_starter_for_job/src/module/cart/model/check_bill_model.dart';
import 'package:app_flutter_starter_for_job/src/module/customer/model/customer_model.dart';
import 'package:app_flutter_starter_for_job/src/module/history/model/history_model.dart';
import 'package:app_flutter_starter_for_job/src/module/home/model/code_model.dart';
import 'package:app_flutter_starter_for_job/src/module/home/model/pos_stock_item_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.dio, this.userInfo) : super(CartState.initial());
  final Dio dio;
  final HistoryModel docNo = HistoryModel();
  final CodeModel userInfo;
  String? _docNo;
  CustomerModel? selectedCustomer;

  static const _cartKey = 'local_cart';
  Future<void> loadCart() async {
    emit(const CartState.loading());
    try {
      final prefs = await SharedPreferences.getInstance();
      final List<String>? raw = prefs.getStringList(_cartKey);
      final items = raw
              ?.map((e) => PosStockItemModel.fromJson(json.decode(e)))
              .toList() ??
          [];
      emit(CartState.success(items: items));
    } catch (e) {
      emit(CartState.error("Failed to load cart: $e"));
    }
  }

  Future<void> removeFromCart(PosStockItemModel item) async {
    final prefs = await SharedPreferences.getInstance();
    final existing = await getCartItems();
    existing.removeWhere((e) => e.code == item.code);
    final encoded = existing.map((e) => json.encode(e.toJson())).toList();
    await prefs.setStringList(_cartKey, encoded);
    emit(CartState.success(items: existing));
  }

  Future<List<PosStockItemModel>> getCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? raw = prefs.getStringList(_cartKey);
    return raw
            ?.map((e) => PosStockItemModel.fromJson(json.decode(e)))
            .toList() ??
        [];
  }

  Future<void> updateQty(PosStockItemModel item, int newQty) async {
    final prefs = await SharedPreferences.getInstance();
    final existing = await getCartItems();

    final index = existing.indexWhere((e) => e.code == item.code);
    if (index != -1) {
      final updatedItem = existing[index].copyWith(balance_qty: newQty);
      existing[index] = updatedItem;

      final encoded = existing.map((e) => json.encode(e.toJson())).toList();
      await prefs.setStringList(_cartKey, encoded);
      emit(CartState.success(items: existing));
    }
  }

  Future<void> getDocNo() async {
    try {
      final response = await dio.get(ApiPath.getHistory);
      _docNo = response.data['doc_no'];

      if (_docNo == null || _docNo!.isEmpty) {
        throw Exception("Received empty doc_no");
      }

      print("✅ [getDocNo] Received: $_docNo");
      emit(CartState.success(docno: _docNo));
    } catch (e) {
      print("❌ [getDocNo] Failed: $e");
      emit(CartState.error("❌ ດຶງເລກບິນບໍ່ສຳເລັດ"));
    }
  }

  Future<void> selectCustomer(CustomerModel customer) async {
    final currentState = state;
    if (currentState is _Success) {
      emit(CartState.success(
        items: currentState.items,
        quantity: currentState.quantity,
        checkBill: currentState.checkBill,
        docno: _docNo,
        customer: currentState.customer,
        selectedCustomer: selectedCustomer,
        userInfo: currentState.userInfo,
      ));
    }
  }

  Future<void> createCheckBill() async {
    emit(const CartState.loading());
    try {
      if (_docNo == null) {
        print("❌ [createCheckBill] doc_no is null");
        emit(CartState.error("❌ ບໍ່ພົບເລກບິນ"));
        return;
      }

      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getStringList(_cartKey);
      final items = raw
              ?.map((e) => PosStockItemModel.fromJson(json.decode(e)))
              .toList() ??
          [];

      if (items.isEmpty) {
        emit(const CartState.error("🛒 ບໍ່ມີສິນຄ້າໃນກະຕ່າ"));
        return;
      }

      final billList = items.map((item) {
        final qty = item.balance_qty;
        final price = double.tryParse(item.sale_price1) ?? 0.0;
        final averageCost = item.average_cost;

        return {
          "item_code": item.code,
          "item_name": item.name_1,
          "unit_code": item.unit_code,
          "qty": qty,
          "price": price,
          "discount": 0,
          "discount_amount": 0,
          "sum_amount": qty * price,
          "average_cost": averageCost,
          "price_2": price,
          "sum_amount_2": qty * price,
          "item_main_code": item.code,
          "product_type": "ສິນຄ້າ"
        };
      }).toList();

      final totalAmount = billList.fold(0.0, (sum, item) {
        final value = item["sum_amount"];
        return sum + ((value is num) ? value.toDouble() : 0.0);
      });
      final body = {
        "doc_no": _docNo,
        "cust_code": selectedCustomer ?? "CUST001",
        "sale_code": userInfo.code,
        "side_code": "S01",
        "department_code": userInfo.department,
        "wh_code": userInfo.ic_wht,
        "sh_code": userInfo.ic_shelf,
        "total_amount": totalAmount,
        "total_amount_2": totalAmount,
        "bill": billList,
      };

      final response = await dio.post(ApiPath.saveBill, data: body);
      final checkBill = CheckBillModel.fromJson(response.data);

      final htmlContent = await _createOnePayHTML(1, _docNo!);
      emit(CartState.qrReady(html: htmlContent));
    } catch (e) {
      emit(CartState.error("❌ ເລກບິນຊ້ຳ! ກະລຸນາລອງໃໝ່"));
    }
  }

  Future<void> createBillWithDocNo() async {
    try {
      emit(CartState.loading());
      await getDocNo();
      if (_docNo == null || _docNo!.isEmpty) {
        print("❌ [createBillWithDocNo] Failed to get valid doc_no");
        emit(CartState.error("❌ ບໍ່ພົບເລກບິນ"));
        return;
      }

      print("✅ Fetched doc_no: $_docNo");

      // Step 2: Load customer data (if needed)
      await fetchCustomers();

      // Step 3: Proceed to create bill with doc_no
      await createCheckBill();
    } catch (e) {
      print("❌ [createBillWithDocNo] Error: $e");
      emit(CartState.error("❌ ເກີດຂໍ້ຜິດພາດໃນການສ້າງບິນ"));
    }
  }

  Future<void> fetchCustomers() async {
    emit(const CartState.loading());
    
    try {
      final response = await dio.get(ApiPath.posCustomer);
      final List<dynamic> dataList = response.data['list'];
      final customers = dataList.map((e) => CustomerModel.fromJson(e)).toList();
      final currentState = state;
      if (currentState is _Success) {
        emit(CartState.success(
          items: currentState.items,
          customer: customers,
          selectedCustomer: currentState.selectedCustomer,
          userInfo: currentState.userInfo,
        ));
      } else {
        emit(CartState.success(customer: customers, userInfo: userInfo));
      }
    } catch (e) {
      emit(CartState.error("❌ ບໍ່ສາມາດດຶງຂໍ້ມູນລູກຄ້າ: $e"));
    }
  }

  Future<void> clearCart() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_cartKey);
    emit(const CartState.success());
  }

  Future<String> _createOnePayHTML(double totalAmount, String docNo) async {
    return '''
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>OnePay QR</title>
  <script src="https://cdn.pubnub.com/sdk/javascript/pubnub.4.27.3.js"></script>
<script src="/static/js/onepay.js"></script>
<script>
  window.onload = function () {
    const docNo = "$docNo";
    const totalAmount = "$totalAmount";

    const onePay = new OnePay("mch667bdd4aaf07a"); // your merchant ID
    onePay.debug = true;

    // Listen for real payment
    onePay.subscribe({
      uuid: docNo,
      shopcode: "tCpJN9pvOwYD" // use your actual shop code
    }, function (res) {
      console.log("✅ Payment callback received", res);
      document.querySelector(".title").innerText = "ການຊຳລະສຳເລັດ";
      document.querySelector(".note").innerText = "ທ່ານໄດ້ຊຳລະສຳເລັດແລ້ວ ຂອບໃຈ!";
      document.querySelector(".qrcode").style.display = "none";
    });

    // Generate QR
    onePay.getCode({
      amount: totalAmount,
      invoiceid: docNo,
      transactionid: docNo,
      terminalid: "TID001",
      description: "ODIEN POS",
      shopcode: "tCpJN9pvOwYD",
      expiretime: 5 // minutes
    }, function (qrData) {
      const qrUrl = "https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=" + qrData;
      document.getElementById("qrcode").src = qrUrl;
    });
  };
</script>

  <script>
    function pad2(n) {
      return n.toString().padStart(2, '0');
    }

    function buildTLV(tag, value) {
      return pad2(tag) + pad2(value.length) + value;
    }

    function crc16(str) {
      const crcTable = [0x0000, 0x1021, 0x2042, 0x3063, 0x4084, 0x50a5,
        0x60c6, 0x70e7, 0x8108, 0x9129, 0xa14a, 0xb16b,
        0xc18c, 0xd1ad, 0xe1ce, 0xf1ef, 0x1231, 0x0210,
        0x3273, 0x2252, 0x52b5, 0x4294, 0x72f7, 0x62d6,
        0x9339, 0x8318, 0xb37b, 0xa35a, 0xd3bd, 0xc39c,
        0xf3ff, 0xe3de, 0x2462, 0x3443, 0x0420, 0x1401,
        0x64e6, 0x74c7, 0x44a4, 0x5485, 0xa56a, 0xb54b,
        0x8528, 0x9509, 0xe5ee, 0xf5cf, 0xc5ac, 0xd58d,
        0x3653, 0x2672, 0x1611, 0x0630, 0x76d7, 0x66f6,
        0x5695, 0x46b4, 0xb75b, 0xa77a, 0x9719, 0x8738,
        0xf7df, 0xe7fe, 0xd79d, 0xc7bc, 0x48c4, 0x58e5,
        0x6886, 0x78a7, 0x0840, 0x1861, 0x2802, 0x3823,
        0xc9cc, 0xd9ed, 0xe98e, 0xf9af, 0x8948, 0x9969,
        0xa90a, 0xb92b, 0x5af5, 0x4ad4, 0x7ab7, 0x6a96,
        0x1a71, 0x0a50, 0x3a33, 0x2a12, 0xdbfd, 0xcbdc,
        0xfbbf, 0xeb9e, 0x9b79, 0x8b58, 0xbb3b, 0xab1a,
        0x6ca6, 0x7c87, 0x4ce4, 0x5cc5, 0x2c22, 0x3c03,
        0x0c60, 0x1c41, 0xedae, 0xfd8f, 0xcdec, 0xddcd,
        0xad2a, 0xbd0b, 0x8d68, 0x9d49, 0x7e97, 0x6eb6,
        0x5ed5, 0x4ef4, 0x3e13, 0x2e32, 0x1e51, 0x0e70,
        0xff9f, 0xefbe, 0xdfdd, 0xcffc, 0xbf1b, 0xaf3a,
        0x9f59, 0x8f78, 0x9188, 0x81a9, 0xb1ca, 0xa1eb,
        0xd10c, 0xc12d, 0xf14e, 0xe16f, 0x1080, 0x00a1,
        0x30c2, 0x20e3, 0x5004, 0x4025, 0x7046, 0x6067,
        0x83b9, 0x9398, 0xa3fb, 0xb3da, 0xc33d, 0xd31c,
        0xe37f, 0xf35e, 0x02b1, 0x1290, 0x22f3, 0x32d2,
        0x4235, 0x5214, 0x6277, 0x7256, 0xb5ea, 0xa5cb,
        0x95a8, 0x8589, 0xf56e, 0xe54f, 0xd52c, 0xc50d,
        0x34e2, 0x24c3, 0x14a0, 0x0481, 0x7466, 0x6447,
        0x5424, 0x4405, 0xa7db, 0xb7fa, 0x8799, 0x97b8,
        0xe75f, 0xf77e, 0xc71d, 0xd73c, 0x26d3, 0x36f2,
        0x0691, 0x16b0, 0x6657, 0x7676, 0x4615, 0x5634,
        0xd94c, 0xc96d, 0xf90e, 0xe92f, 0x99c8, 0x89e9,
        0xb98a, 0xa9ab, 0x5844, 0x4865, 0x7806, 0x6827,
        0x18c0, 0x08e1, 0x3882, 0x28a3, 0xcb7d, 0xdb5c,
        0xeb3f, 0xfb1e, 0x8bf9, 0x9bd8, 0xabbb, 0xbb9a,
        0x4a75, 0x5a54, 0x6a37, 0x7a16, 0x0af1, 0x1ad0,
        0x2ab3, 0x3a92, 0xfd2e, 0xed0f, 0xdd6c, 0xcd4d,
        0xbdaa, 0xad8b, 0x9de8, 0x8dc9, 0x7c26, 0x6c07,
        0x5c64, 0x4c45, 0x3ca2, 0x2c83, 0x1ce0, 0x0cc1,
        0xef1f, 0xff3e, 0xcf5d, 0xdf7c, 0xaf9b, 0xbfba,
        0x8fd9, 0x9ff8, 0x6e17, 0x7e36, 0x4e55, 0x5e74,
        0x2e93, 0x3eb2, 0x0ed1, 0x1ef0];

      let crc = 0xFFFF;
      for (let c of str) {
        let byte = c.charCodeAt(0);
        let tmp = ((crc >> 8) ^ byte) & 0xFF;
        crc = ((crc << 8) ^ crcTable[tmp]) & 0xFFFF;
      }
      return crc.toString(16).toUpperCase().padStart(4, '0');
    }

    window.onload = function() {
      const uuid = "$docNo";
      const amount = "$totalAmount";

      const payloadFormat = buildTLV("00", "01");
      const pointOfInitiationMethod = buildTLV("01", "12");

      const merchantAccount = buildTLV("33", buildTLV("00", "BCEL") + buildTLV("01", "ONEPAY") + buildTLV("02", "mch667bdd4aaf07a") + buildTLV("05", "CLOSEWHENDONE"));

      const merchantCategoryCode = buildTLV("52", "5732");
      const transactionCurrency = buildTLV("53", "418");
      const txnAmount = buildTLV("54", amount);
      const countryCode = buildTLV("58", "LA");
      const province = buildTLV("60", "VTE");
      const additionalDataField = buildTLV("62", buildTLV("01", uuid) + buildTLV("08", "Odien"));

      const qrData = payloadFormat + pointOfInitiationMethod + merchantAccount + merchantCategoryCode +
                     transactionCurrency + txnAmount + countryCode + province + additionalDataField;

      const checksum = buildTLV("63", crc16(qrData + "6304"));

      const fullQR = qrData + checksum;

      const qrUrl = "https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=" + fullQR;

      document.getElementById("qrcode").src = qrUrl;

      // simulate payment for demo
      // setTimeout(() => {
      //   if (window.FlutterChannel) {
      //     FlutterChannel.postMessage("paid");
      //   }
      // }, 8000);
    };
  </script>
  <style>
    body {
      margin: 20;
      padding: 10;
      font-family: 'Noto Sans Lao', sans-serif;
      background: #f5f5f5;
      display: flex;
      align-items: center;
      justify-content: center;
      min-height: 100vh;
      color: #333;
    }
    .container {
      background: #fff;
      border-radius: 16px;
      box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
      padding: 30px;
      max-width: 360px;
      width: 90%;
      text-align: center;
    }
    .title {
      color: #d10000;
      font-size: 22px;
      font-weight: 700;
      margin-bottom: 20px;
    }
    .qrcode {
      width: 200px;
      height: 200px;
      margin: 0 auto 20px;
      padding: 12px;
      background: #fff;
      border: 3px solid #d10000;
      border-radius: 16px;
    }
    .info {
      font-size: 16px;
      margin: 8px 0;
    }
    .highlight {
      color: #d10000;
      font-weight: bold;
    }
    .note {
      font-size: 14px;
      color: #999;
      margin-top: 20px;
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="title">ສະແກນ QR ເພື່ອຊຳລະ</div>
    <img id="qrcode" class="qrcode" src="" alt="QR Code" />
    <div class="info">ເລກບິນ: <span class="highlight">$docNo</span></div>
    <div class="info">ຈຳນວນເງິນ: <span class="highlight">₭ $totalAmount</span></div>
    <div class="note">
      ກະລຸນາເປີດໜ້ານີ້ຄ້າງໄວ້ ຈົນກວ່າການຊຳລະສຳເລັດ
    </div>
  </div>
</body>

</html>
''';
  }
}
