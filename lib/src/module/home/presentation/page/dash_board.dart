import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:app_flutter_starter_for_job/src/core/config/DI/config.dart';
import 'package:app_flutter_starter_for_job/src/core/constants/colors/app_color.dart';
import 'package:app_flutter_starter_for_job/src/core/enum/enum.dart';
import 'package:app_flutter_starter_for_job/src/module/cart/presentation/page/cubit/cart_cubit.dart';
import 'package:app_flutter_starter_for_job/src/module/customer/presentation/cubit/customer_cubit.dart';
import 'package:app_flutter_starter_for_job/src/module/history/presentation/page/history.dart';
import 'package:app_flutter_starter_for_job/src/module/home/model/code_model.dart';
import 'package:app_flutter_starter_for_job/src/module/home/presentation/cubit/dashboard/dashboard_cubit.dart';
import 'package:app_flutter_starter_for_job/src/module/home/presentation/cubit/home_cubit.dart';
import 'package:app_flutter_starter_for_job/src/module/home/presentation/page/home_page.dart';
import 'package:app_flutter_starter_for_job/src/module/cart/presentation/page/cart.dart';
import 'package:app_flutter_starter_for_job/src/module/customer/presentation/page/customer.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class DashBoardPage extends StatelessWidget implements AutoRouteWrapper {
  const DashBoardPage({super.key, required this.userInfo});
  final CodeModel userInfo;

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<HomeCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<DashboardCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<CustomerCubit>(),
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
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          final navbarItem = BottomItem.values[index];
          cubit.getNavBarItem(navbarItem);
        },
        children: [
          HomePage(userInfo: userInfo),
          CartPage(userInfo: userInfo,),
          const ProfilePage(),
          const HistoryPage()
        ],
      ),
      bottomNavigationBar: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          return AnimatedBottomNavigationBar(
            icons: const [
              Icons.home,
              Icons.shopping_cart,
              Icons.person,
              Icons.history
            ],
            notchSmoothness: NotchSmoothness.defaultEdge,
            activeIndex: state.index,
            gapLocation: GapLocation.none,
            leftCornerRadius: 0,
            rightCornerRadius: 0,
            activeColor: AppColors.electricPurple,
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
