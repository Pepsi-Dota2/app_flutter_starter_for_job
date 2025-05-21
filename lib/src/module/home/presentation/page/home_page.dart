import 'package:app_flutter_starter_for_job/src/core/router/router.dart';
import 'package:app_flutter_starter_for_job/src/core/service/cart/cart_service.dart';
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
class HomePage extends StatefulWidget {
  final CodeModel userInfo;

  const HomePage({super.key, required this.userInfo});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ScrollController _scrollController;
  late final HomeCubit _cubit;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  bool _isLoadingMore = false;

  void _scrollListener() {
    if (!_isLoadingMore &&
        _scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200) {
      _isLoadingMore = true;
      _cubit.loadMoreData().then((_) {
        _isLoadingMore = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dio = Dio();

    return BlocProvider(
      create: (context) {
        _cubit = HomeCubit(dio, widget.userInfo)..getProduct();
        return _cubit;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Odein Service",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.purple.shade600,
          centerTitle: true,
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: Text('Ready')),
              loading: () => _buildLoadingSkeleton(),
              failure: (msg) => Center(child: Text('❌ $msg')),
              success: (products, currentPage, _, hasMorePages) {
                return RefreshIndicator(
                  onRefresh: _cubit.onRefresh,
                  child: _buildContent(products, hasMorePages),
                );
              },
              error: (String message) {
                return Center(child: Text(message));
              },
              loadMore: (products, currentPage, hasMorePages) {
                return RefreshIndicator(
                  onRefresh: _cubit.onRefresh,
                  child: _buildContent(products, hasMorePages,
                      isLoadingMore: true),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildLoadingSkeleton() {
    return Skeletonizer(
      enabled: true,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Skeleton.leaf(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                Skeleton.leaf(
                  child: Container(
                    height: 180,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                Skeletonizer(
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
                        price: '',
                        desc: 0,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(List<PosStockItemModel> products, bool hasMorePages,
      {bool isLoadingMore = false}) {
    return SingleChildScrollView(
      controller: _scrollController,
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
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = products[index];
                  return InkWell(
                    onTap: () {
                      context.router.push(DetailProductRoute(code: item.code));
                    },
                    child: ProductWidget(
                      image: item.url_image,
                      title: item.name_1,
                      price: item.sale_price1,
                      desc: item.balance_qty,
                      onClick: () async {
                        final cartService = CartService();
                        await cartService.addToCart(item);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('✅ Added to cart: ${item.name_1}')),
                        );
                      },
                    ),
                  );
                },
              ),
              if (hasMorePages || isLoadingMore)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
