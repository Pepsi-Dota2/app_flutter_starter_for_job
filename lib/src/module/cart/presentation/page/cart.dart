import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:app_flutter_starter_for_job/src/core/widgets/confirm_dialog.dart';
import 'package:app_flutter_starter_for_job/src/core/widgets/list_loader_skeletion.dart';
import 'package:app_flutter_starter_for_job/src/module/cart/presentation/page/cubit/cart_cubit.dart';
import 'package:app_flutter_starter_for_job/src/module/cart/presentation/page/payment_Screen.dart';
import 'package:app_flutter_starter_for_job/src/module/customer/model/customer_model.dart';
import 'package:app_flutter_starter_for_job/src/module/home/model/code_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CartPage extends StatefulWidget {
  final CodeModel userInfo;
  const CartPage({super.key, required this.userInfo});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final dio = Dio();
    return BlocProvider(
      create: (_) => CartCubit(dio, widget.userInfo)
        ..loadCart()
        ..fetchCustomers(),
      child: BlocListener<CartCubit, CartState>(
        listener: (context, state) {
          state.mapOrNull(qrReady: (qr) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PaymentScreen(htmlContent: qr.html),
              ),
            ).then((_) {
              context.read<CartCubit>().loadCart();
            });
          });
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "🛒 Your Cart",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            backgroundColor: Colors.purple.shade600,
            centerTitle: true,
          ),
          body: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              final cubit = context.read<CartCubit>();
              return state.when(
                initial: () => const Center(child: Text("Initial...")),
                loading: () => ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) => const CartSkeletonItem(),
                ),
                error: (msg) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text('ແຈ້ງເຕືອນ'),
                        content: Text(msg),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('ຕົກລົງ'),
                          ),
                        ],
                      ),
                    );
                  });
                  return Center(child: const Text('📦 ບໍ່ສາມາດສ້າງບິນໄດ້'));
                },
                success: (cartItems, quantity, checkBill, docNo, customer,
                    saleMan, selectedCustomer) {
                  if (cartItems.isEmpty) {
                    return const Center(child: Text("Cart is empty."));
                  }
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton<CustomerModel>(
                          hint: const Text("ເລືອກລູກຄ້າ"),
                          value: selectedCustomer,
                          isExpanded: true,
                          items: customer.map((c) {
                            return DropdownMenuItem<CustomerModel>(
                              value: c,
                              child: Text(c.cust_name),
                            );
                          }).toList(),
                          onChanged: (CustomerModel? newCustomer) {
                            if (newCustomer != null) {
                              print( "✅ Selected customer: ${newCustomer.cust_name}");
                              cubit.selectCustomer(newCustomer); 
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: ListView.builder(
                          itemCount: cartItems.length,
                          itemBuilder: (context, index) {
                            final item = cartItems[index];
                            final qtyController = TextEditingController(
                                text: item.balance_qty.toString());
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                    width: 1,
                                  ),
                                ),
                                child: ListTile(
                                  contentPadding: const EdgeInsets.all(12),
                                  leading: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      image: DecorationImage(
                                        image: NetworkImage(item.url_image),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                  title: Text(item.name_1),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Price: ${item.sale_price1}'),
                                      const SizedBox(height: 4),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Qty: ",
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          const SizedBox(width: 8),
                                          SizedBox(
                                            width: size.width * 0.16,
                                            height: 30,
                                            child: TextField(
                                              controller: qtyController,
                                              keyboardType:
                                                  TextInputType.number,
                                              textAlign: TextAlign.center,
                                              textAlignVertical:
                                                  TextAlignVertical.center,
                                              style:
                                                  const TextStyle(fontSize: 14),
                                              decoration: const InputDecoration(
                                                isDense: true,
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 8),
                                                border: OutlineInputBorder(),
                                              ),
                                              onSubmitted: (value) {
                                                final newQty =
                                                    int.tryParse(value);
                                                if (newQty != null &&
                                                    newQty > 0) {
                                                  context
                                                      .read<CartCubit>()
                                                      .updateQty(item, newQty);
                                                }
                                              },
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () async {
                                      await showCustomOkCancelDialog(
                                        context: context,
                                        style: AdaptiveStyle.iOS,
                                        message: 'Do you want to remove?',
                                        okLabel: 'yes',
                                        cancelLabel: 'cancel',
                                        onResult: (result) {
                                          if (result == OkCancelResult.ok) {
                                            context
                                                .read<CartCubit>()
                                                .removeFromCart(item);
                                          }
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.white,
                        child: Column(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Total: ',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        '฿${cartItems.fold(0.0, (total, item) => total + (double.parse(item.sale_price1) * item.balance_qty))}',
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: size.width * 1.0,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  backgroundColor: Colors.purple.shade600,
                                ),
                                onPressed: () {
                                  cubit.createBillWithDocNo();
                                },
                                child: const Text("Submit",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                qrReady: (_) {
                  return const SizedBox();
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
