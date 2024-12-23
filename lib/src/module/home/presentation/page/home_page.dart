import 'package:app_flutter_starter_for_job/src/core/config/DI/config.dart';
import 'package:app_flutter_starter_for_job/src/core/utils/image_parser.dart';
import 'package:app_flutter_starter_for_job/src/module/home/presentation/cubit/home_cubit.dart';
import 'package:app_flutter_starter_for_job/src/module/home/presentation/widgets/custom_skeleton.dart';
import 'package:app_flutter_starter_for_job/src/module/home/presentation/widgets/product_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

@RoutePage()
class HomePage extends StatelessWidget implements AutoRouteWrapper {
  const HomePage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()
        ..getCategories()
        // ..getPhotos()
        ..getAllProduct(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return state.when(
            initial: () => CustomSkeleton(),
            loading: () => CustomSkeleton(),
            error: (error) => Center(
              child: Text('Error: $error'),
            ),
            success: (data, categoryData, product) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SafeArea(
                  child: Column(
                    children: [
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                            decoration: BoxDecoration(
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
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6),
                                          child: Text(
                                            categoryData[index].name,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.black87,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.75,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                          ),
                          itemCount: product.length,
                          itemBuilder: (BuildContext context, int index) {
                             String imageUrl = ImageUrlParser.parseImageUrl(product[index].images[0]);
                            return ProductWidget(
                              image: imageUrl,
                              title: product[index].title,
                              price: product[index].price.toDouble(),
                              desc: product[index].description,
                            );
                          },
                        ),
                      ),

                      // Expanded(
                      //   child: ListView.builder(
                      //     itemCount: 10,
                      //     itemBuilder: (BuildContext context, int index) {
                      //       return Card(
                      //         margin: const EdgeInsets.symmetric(vertical: 8),
                      //         child: ListTile(
                      //           leading: Image.network(
                      //             data[index].url.toString(),
                      //             width: 50,
                      //             height: 50,
                      //             fit: BoxFit.cover,
                      //             errorBuilder: (context, error, stackTrace) {
                      //               return Container(
                      //                 width: 50,
                      //                 height: 50,
                      //                 color: Colors.white,
                      //               );
                      //             },
                      //           ),
                      //           title: Text(data[index].title),
                      //           subtitle: Text('ID: ${data[index].albumId}'),
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                    ],
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
