import 'package:app_flutter_starter_for_job/src/core/router/router.dart';
import 'package:app_flutter_starter_for_job/src/module/home/model/carousel_model.dart';
import 'package:app_flutter_starter_for_job/src/module/home/model/code_model.dart';
import 'package:app_flutter_starter_for_job/src/module/home/model/pos_stock_item_model.dart';
import 'package:app_flutter_starter_for_job/src/module/home/presentation/cubit/home_cubit.dart';
import 'package:app_flutter_starter_for_job/src/module/home/presentation/widgets/carousel.dart';
import 'package:app_flutter_starter_for_job/src/module/home/presentation/widgets/product_widget.dart';
import 'package:app_flutter_starter_for_job/src/module/home/presentation/widgets/search_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  final dio = Dio();
  final CodeModel userInfo;
  HomePage({super.key, required this.userInfo});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cubit = context.read<HomeCubit>();
    return BlocProvider(
      create: (_) => HomeCubit(dio, userInfo)..getProduct(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Odein Store"),
          backgroundColor: Colors.amber.shade700,
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return state.when(
              initial: () => Center(child: Text('Ready')),
              loading: () => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Skeletonizer(
                  enabled: true,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      return const ProductWidget(
                        image: '',
                        title: '',
                        price: "",
                        desc: 0,
                      );
                    },
                  ),
                ),
              ),
              failure: (msg) => Center(child: Text('❌ $msg')),
              success:(products, currentPage, hasMorePages, totalItems, isLoading) {
                return RefreshIndicator(
                  onRefresh: cubit.getProduct,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: SafeArea(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ModernSearchBar(
                              onSearchTap: () {
                                context.router.push(SearchRoute());
                              },
                            ),
                            const SizedBox(height: 16),
                            CarouselWidget(
                              items: CarouselModel.items,
                            ),
                            const SizedBox(height: 16),
                            const SizedBox(height: 16),
                            GridView.builder(
                              controller: cubit.controller,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.75,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                              ),
                              itemCount: products.length,
                              itemBuilder: (BuildContext context, int index) {
                                if (index >= products.length) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                                final item = products[index];
                                return ProductWidget(
                                  image: item.url_image,
                                  title: item.name_1,
                                  price: item.sale_price1,
                                  desc: item.balance_qty,
                                );
                              },
                            ),
                            if (isLoading && hasMorePages)
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 24),
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            if (hasMorePages)
                              ElevatedButton(
                                onPressed: () {
                                  context.read<HomeCubit>().getProduct();
                                },
                                child:
                                    Text("Load More (Page ${currentPage + 1})"),
                              )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              error: (String message) {
                return Center(
                  child: Text(message),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
