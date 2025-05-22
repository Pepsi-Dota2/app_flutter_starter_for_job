import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:app_flutter_starter_for_job/src/core/widgets/confirm_dialog.dart';
import 'package:app_flutter_starter_for_job/src/core/widgets/list_loader_skeletion.dart';
import 'package:app_flutter_starter_for_job/src/module/cart/presentation/page/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (_) => CartCubit()..loadCart(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "🛒 Your Cart",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.purple.shade600,
          centerTitle: true,
        ),
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: Text("Initial...")),
              loading: () => ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) => const CartSkeletonItem(),
              ),
              error: (msg) => Center(child: Text(msg)),
              success: (cartItems, quantity) {
                if (cartItems.isEmpty) {
                  return const Center(child: Text("Cart is empty."));
                }
                return Column(
                  children: [
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                            keyboardType: TextInputType.number,
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
                              onPressed: () {},
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
            );
          },
        ),
      ),
    );
  }
}
