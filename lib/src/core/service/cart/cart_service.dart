// cart_service.dart
import 'dart:convert';
import 'package:app_flutter_starter_for_job/src/module/home/model/pos_stock_item_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartService {
  static const _cartKey = 'local_cart';

  Future<void> addToCart(PosStockItemModel item) async {
    final prefs = await SharedPreferences.getInstance();
    final existing = await getCartItems();
    existing.add(item);
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
