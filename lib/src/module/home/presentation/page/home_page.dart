import 'package:app_flutter_starter_for_job/src/core/router/router.dart';
import 'package:app_flutter_starter_for_job/src/core/utils/image_parser.dart';
import 'package:app_flutter_starter_for_job/src/module/home/domain/model/carousel_model.dart';
import 'package:app_flutter_starter_for_job/src/module/home/presentation/cubit/home_cubit.dart';
import 'package:app_flutter_starter_for_job/src/module/home/presentation/widgets/carousel.dart';
import 'package:app_flutter_starter_for_job/src/module/home/presentation/widgets/custom_skeleton.dart';
import 'package:app_flutter_starter_for_job/src/module/home/presentation/widgets/product_widget.dart';
import 'package:app_flutter_starter_for_job/src/module/home/presentation/widgets/search_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

@RoutePage()
class HomePage extends StatelessWidget implements AutoRouteWrapper {
  const HomePage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: IconButton(
              icon: const Icon(
                Icons.notifications_outlined,
                size: 26,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return state.when(
            initial: () => CustomSkeleton(),
            loading: () => CustomSkeleton(),
            error: (error) => Center(
              child: Text('Error: $error'),
            ),
            success: (data, categoryData, product, onSelectBank,
                selectPaymentMethod) {
              return SingleChildScrollView(
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
                        SizedBox(
                          height: size.height * 0.12,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: categoryData.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Image.network(
                                          categoryData[index].image,
                                          fit: BoxFit.cover,
                                          width: size.width * 0.22,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Container(
                                              width: size.width * 0.24,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/nike-kyrie-7-fire-ice-sneakerroom-do5360-900-release-date.webp"),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6),
                                        child: Text(
                                          categoryData[index].name,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.black87,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.75,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                          ),
                          itemCount: product.length,
                          itemBuilder: (BuildContext context, int index) {
                            String imageUrl = ImageUrlParser.parseImageUrl(
                                product[index].images[0]);
                            return InkWell(
                              onTap: () {
                                context.router.push(DetailProductRoute(
                                  desc: product[index].description,
                                  title: product[index].title,
                                  location: "laos",
                                  imageUrl: imageUrl,
                                  price: product[index].price.toDouble(),
                                  followerCount: "20",
                                  itemCount: "20",
                                ));
                              },
                              child: ProductWidget(
                                image: imageUrl,
                                title: product[index].title,
                                price: product[index].price.toDouble(),
                                desc: product[index].description,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
