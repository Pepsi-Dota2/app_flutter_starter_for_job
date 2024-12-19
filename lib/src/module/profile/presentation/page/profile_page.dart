import 'package:app_flutter_starter_for_job/src/core/config/DI/config.dart';
import 'package:app_flutter_starter_for_job/src/core/router/router.dart';
import 'package:app_flutter_starter_for_job/src/core/widgets/loding_dialog.dart';
import 'package:app_flutter_starter_for_job/src/module/profile/presentation/cubit/profile_cubit.dart';
import 'package:app_flutter_starter_for_job/src/module/profile/presentation/widget/list_item_widget.dart';
import 'package:app_flutter_starter_for_job/src/module/profile/presentation/widget/profile_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

@RoutePage()
class ProfilePage extends StatelessWidget implements AutoRouteWrapper {
  const ProfilePage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>()..getProfile(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          state.maybeWhen(
            failure: (message) {
              LoadingDialog.hideLoadingDialog(context);
            },
            loading: () {
              LoadingDialog.showLoadingDialog(context);
            },
            logoutSuccess: () {
              LoadingDialog.showLoadingDialog(context);
              Future.delayed(Duration(seconds: 4), () {
                context.router.replace(LoginRoute());
              });
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (user) {
              return SafeArea(
                child: Column(
                  children: [
                    ProfileWidget(user: user),
                    const Gap(20),
                    ListItemWidget(
                      iconData: Icons.logout,
                      name: "Logout",
                      onClick: () {
                        cubit.logout();
                      },
                    ),
                  ],
                ),
              );
            },
            empty: () => const Center(child: Text('Empty')),
            failure: (message) => const Center(child: Text("Profile failure")),
            logoutSuccess: () => const Center(child: Text("Logout Success")),
          );
        },
      ),
    );
  }
}
