// cart_service.dart
import 'dart:convert';
import 'package:app_flutter_starter_for_job/src/core/widgets/confirm_dialog.dart';
import 'package:app_flutter_starter_for_job/src/module/home/model/pos_stock_item_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartService {
  static const _cartKey = 'local_cart';

  Future<void> addToCart(
      BuildContext context, PosStockItemModel newItem) async {
    final prefs = await SharedPreferences.getInstance();
    final existing = await getCartItems();

    final index = existing.indexWhere((e) => e.code == newItem.code);

    if (index != -1) {
      final existingItem = existing[index];
      final newQty = existingItem.balance_qty + 1;

      if (newQty > newItem.balance_qty) {
        showOutOfStockDialog(context);
        return;
      }

      final updatedItem = existingItem.copyWith(balance_qty: newQty);
      existing[index] = updatedItem;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${updatedItem.name_1} ເພີ່ມໃສ່ກະຕ່າແລ້ວ'),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.blue.shade600,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    } else {
      if (1 > newItem.balance_qty) {
        showOutOfStockDialog(context);
        return;
      }

      final cartItem = newItem.copyWith(balance_qty: 1);
      existing.add(cartItem);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${cartItem.name_1} ເພີ່ມໃສ່ກະຕ່າແລ້ວ'),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.blue.shade600,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }

    final encoded = existing.map((e) => json.encode(e.toJson())).toList();
    await prefs.setStringList(_cartKey, encoded);
  }

  Future<List<PosStockItemModel>> getCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? raw = prefs.getStringList(_cartKey);
    if (raw == null) return [];
    return raw.map((e) => PosStockItemModel.fromJson(json.decode(e))).toList();
  }

  Future<void> clearCart() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_cartKey);
  }

  Future<void> removeItem(PosStockItemModel item) async {
    final prefs = await SharedPreferences.getInstance();
    final existing = await getCartItems();
    existing.removeWhere((e) => e.code == item.code);
    final encoded = existing.map((e) => json.encode(e.toJson())).toList();
    await prefs.setStringList(_cartKey, encoded);
  }
}
