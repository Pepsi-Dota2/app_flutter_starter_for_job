import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CartSkeletonItem extends StatelessWidget {
  const CartSkeletonItem({super.key});

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
