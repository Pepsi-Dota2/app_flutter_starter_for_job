import 'package:app_flutter_starter_for_job/src/core/config/DI/config.dart';
import 'package:app_flutter_starter_for_job/src/module/home/presentation/cubit/home_cubit.dart';
import 'package:app_flutter_starter_for_job/src/module/home/presentation/widgets/product_detail.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class DetailProductPage extends StatelessWidget {
  final String code;
  final String? averageCost;
  final int? balanceQty;
  final String? name1;
  final String? salePrice1;
  final String? unitCode;
  final String? urlImage;
  const DetailProductPage({
    super.key,
    required this.code,
    this.averageCost,
    this.balanceQty,
    this.name1,
    this.salePrice1,
    this.unitCode,
    this.urlImage,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..getProductDetailByCode(code),
      child: Scaffold(
        appBar: AppBar(title: const Text("Product Detail")),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: Text('Ready')),
              loading: () => const Center(child: CircularProgressIndicator()),
              failure: (msg) => Center(child: Text('❌ $msg')),
              error: (msg) => Center(child: Text('❌ $msg')),
              success: (products, productDetail, currentPage, hasMorePages) {
                if (productDetail != null) {
                  return SingleChildScrollView(
                    child: ProductCardDetail(
                      desc: productDetail.name_1,
                      title: productDetail.code,
                      location: "Warehouse",
                      imageUrl: productDetail.url_image,
                      price: double.tryParse(productDetail.sale_price1) ?? 0.0,
                      followerCount: "0",
                      itemCount: productDetail.balance_qty.toString(),
                      onBuyNow: () {},
                    ),
                  );
                } else {
                  return const Center(
                      child: Text('No product detail available'));
                }
              },
              loadMore: (_, __, ___) =>
                  const Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }
}
