import 'package:app_flutter_starter_for_job/src/core/config/DI/config.dart';
import 'package:app_flutter_starter_for_job/src/core/router/router.dart';
import 'package:app_flutter_starter_for_job/src/core/widgets/loding_dialog.dart';
import 'package:app_flutter_starter_for_job/src/module/login/presentation/cubit/login_cubit.dart';
import 'package:app_flutter_starter_for_job/src/module/login/presentation/widgets/password_input.dart';
import 'package:app_flutter_starter_for_job/src/module/login/presentation/widgets/radius_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/text_input.dart';

@RoutePage()
class RegisterPage extends StatefulWidget implements AutoRouteWrapper {
  const RegisterPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: this,
    );
  }

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final pwdController = TextEditingController();
  final confirmPwdController = TextEditingController();
  final phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    pwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
          state.maybeWhen(
            orElse: () => LoadingDialog.showLoadingDialog(context),
            success: (user) {
              LoadingDialog.hideLoadingDialog(context);
              context.router.replace(DashBoardRoute());
            },
            failure: (failure) {
              LoadingDialog.hideLoadingDialog(context);
            }
          );
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
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
                        hintText: "Username",
                        header: "Username",
                      ),
                      const SizedBox(height: 12),
                      TextInput(
                        controller: emailController,
                        hintText: "example@gmail.com",
                        header: "Email",
                      ),
                      const SizedBox(height: 12),
                      PasswordInput(
                        controller: pwdController,
                        hintText: "***********",
                        header: "Password",
                      ),
                      const SizedBox(height: 12),
                      PasswordInput(
                        controller: confirmPwdController,
                        hintText: "***********",
                        header: "Confirm Password",
                      ),
                      const SizedBox(height: 12),
                      TextInput(
                        controller: phoneController,
                        hintText: "Phone number",
                        header: "Phone number",
                      ),
                      const SizedBox(height: 30),
                      RadiusButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final email = emailController.text.trim();
                            final password = pwdController.text.trim();

                            context.read<LoginCubit>().userRegister(
                                  email: email,
                                  password: password,
                                );
                          }
                        },
                        title: "Sign Up",
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account?"),
                          TextButton(
                              onPressed: () {
                                context.router.replace(LoginRoute());
                              },
                              child: const Text("Sign In"))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
