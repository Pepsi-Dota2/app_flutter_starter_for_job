import 'package:app_flutter_starter_for_job/src/module/home/presentation/widgets/payment_page.dart';
import 'package:app_flutter_starter_for_job/src/module/home/presentation/widgets/product_detail.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DetailProductPage extends StatelessWidget {
  final String? desc;
  final String? title;
  final String? location;
  final String? imageUrl;
  final double? price;
  final String? followerCount;
  final String? itemCount;

  const DetailProductPage({
    super.key,
    this.desc,
    this.title,
    this.location,
    this.imageUrl,
    this.price,
    this.followerCount,
    this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Detail"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: ProductCardDetail(
          desc: desc ?? "Unknown Product",
          title: title ?? "Unknown Seller",
          location: location ?? "Unknown Location",
          imageUrl: imageUrl ?? "",
          price: price ?? 0.0,
          followerCount: followerCount ?? "0",
          itemCount: itemCount ?? "0",
          onBuyNow: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PaymentMethodSelector()),
            );
          },
        ),
      ),
    );
  }
}
