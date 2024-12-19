import 'package:app_flutter_starter_for_job/src/core/config/DI/config.dart';
import 'package:app_flutter_starter_for_job/src/module/profile/presentation/cubit/profile_cubit.dart';
import 'package:app_flutter_starter_for_job/src/module/profile/presentation/widget/profile_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return state.when(
            initial: () => Center(child: CircularProgressIndicator()),
            loading: () => Center(child: CircularProgressIndicator()),
            success: (user) {
              return SafeArea(
                child: Column(
                  children: [
                    ProfileWidget(
                      user: user,
                    )
                  ],
                ),
              );
            },
            empty: () => Center(child: Text('Empty')),
            failure: (message) => Center(child: Text("Profile failure")),

          );
        },
      ),
    );
  }
}
