import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:app_flutter_starter_for_job/src/core/config/DI/config.dart';
import 'package:app_flutter_starter_for_job/src/core/constants/colors/app_color.dart';
import 'package:app_flutter_starter_for_job/src/core/enum/enum.dart';
import 'package:app_flutter_starter_for_job/src/module/home/presentation/cubit/dashboard/dashboard_cubit.dart';
import 'package:app_flutter_starter_for_job/src/module/home/presentation/cubit/home_cubit.dart';
import 'package:app_flutter_starter_for_job/src/module/home/presentation/page/home_page.dart';
import 'package:app_flutter_starter_for_job/src/module/profile/presentation/page/profile_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class DashBoardPage extends StatelessWidget implements AutoRouteWrapper {
  const DashBoardPage({super.key});

    @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<HomeCubit>()..getPhotos(),
        ),
        BlocProvider(
          create: (context) => getIt<DashboardCubit>(),
        ),
      ],
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DashboardCubit>();
    final PageController pageController = PageController();
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          final navbarItem = BottomItem.values[index];
          cubit.getNavBarItem(navbarItem);
        },
        children: const [
          HomePage(),
          ProfilePage()
        ],
      ),
      bottomNavigationBar: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          return AnimatedBottomNavigationBar(
            icons: const [
              Icons.home,
              Icons.person
            ],
            activeIndex: state.index,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.softEdge,
            leftCornerRadius: 32,
            rightCornerRadius: 32,
            activeColor: AppColors.tealGreen,
            inactiveColor: AppColors.grey,
            onTap: (index) {
              final navbarItem = BottomItem.values[index];
              cubit.getNavBarItem(navbarItem);
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
          );
        },
      ),
    );
  }
}