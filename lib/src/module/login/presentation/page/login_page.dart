import 'package:app_flutter_starter_for_job/src/core/config/DI/config.dart';
import 'package:app_flutter_starter_for_job/src/core/router/router.dart';
import 'package:app_flutter_starter_for_job/src/module/login/presentation/cubit/login_cubit.dart';
import 'package:app_flutter_starter_for_job/src/core/widgets/loding_dialog.dart';
import 'package:app_flutter_starter_for_job/src/module/login/presentation/widgets/password_input.dart';
import 'package:app_flutter_starter_for_job/src/module/login/presentation/widgets/radius_button.dart';
import 'package:app_flutter_starter_for_job/src/module/login/presentation/widgets/text_input.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class LoginPage extends StatelessWidget implements AutoRouteWrapper {
  LoginPage({super.key});
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: this,
    );
  }

  final usernameController = TextEditingController();
  final pwdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: () {
            LoadingDialog.showLoadingDialog(context);
          },
          success: (user) {
            LoadingDialog.hideLoadingDialog(context);
            context.router.replace(DashBoardRoute(userInfo: user));
          },
          failure: (message) {
            LoadingDialog.hideLoadingDialog(context);
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text("Username or password incorrect"),
                  backgroundColor: Colors.red,
                ),
              );
            });
          },
          orElse: () => LoadingDialog.showLoadingDialog(context),
        );
      },
      builder: (context, state) {
        return Scaffold(
          body: SizedBox(
            width: size.width,
            height: size.height,
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextInput(
                        controller: usernameController,
                        hintText: "user name",
                        header: "user name"),
                    const SizedBox(height: 12),
                    PasswordInput(
                        controller: pwdController,
                        hintText: "***********",
                        header: "Password"),
                    const SizedBox(height: 30),
                    RadiusButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate() != false) {
                          final username = usernameController.text.trim();
                          final password = pwdController.text.trim();
                          context
                              .read<LoginCubit>()
                              .loginUser(username, password);
                        }
                      },
                      title: "Sign In",
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
