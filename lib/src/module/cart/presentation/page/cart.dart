import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:app_flutter_starter_for_job/src/core/widgets/confirm_dialog.dart';
import 'package:app_flutter_starter_for_job/src/module/cart/presentation/page/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                itemBuilder: (context, index) => const _CartSkeletonItem(),
              ),
              error: (msg) => Center(child: Text(msg)),
              loaded: (cartItems) {
                if (cartItems.isEmpty) {
                  return const Center(child: Text("Cart is empty."));
                }
                return ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    return ListTile(
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
                      subtitle: Text('Price: ${item.sale_price1}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () async {
                          await showCustomOkCancelDialog(
                            context: context,
                            style: AdaptiveStyle.iOS,
                            title: 'Cart Dialog',
                            message: 'Do you want to remove?',
                            okLabel: 'yes',
                            cancelLabel: 'cancel',
                            onResult: (result) {
                              if (result == OkCancelResult.ok) {
                                context.read<CartCubit>().removeFromCart(item);
                              } else {}
                            },
                          );
                        },
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _CartSkeletonItem extends StatelessWidget {
  const _CartSkeletonItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: const ListTile(
        leading: CircleAvatar(backgroundColor: Colors.white, radius: 24),
        title: SizedBox(
            height: 16,
            width: double.infinity,
            child:
                DecoratedBox(decoration: BoxDecoration(color: Colors.white))),
        subtitle: SizedBox(
            height: 14,
            width: double.infinity,
            child:
                DecoratedBox(decoration: BoxDecoration(color: Colors.white))),
      ),
    );
  }
}
