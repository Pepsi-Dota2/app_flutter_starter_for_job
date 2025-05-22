import 'dart:convert';

import 'package:app_flutter_starter_for_job/src/module/home/model/pos_stock_item_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState.initial());

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

  Future<void> clearCart() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_cartKey);
    emit(const CartState.success());
  }
}
