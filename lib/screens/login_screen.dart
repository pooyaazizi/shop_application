import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shop_application/bloc/authentication/auth_bloc.dart';
import 'package:shop_application/bloc/authentication/auth_event.dart';
import 'package:shop_application/bloc/authentication/auth_state.dart';
import 'package:shop_application/core/theme/app_colors.dart';
import 'package:shop_application/core/theme/app_text_style.dart';

class LoginScreen extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.blueColor,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/icon_application.png',
                      width: 150,
                      height: 150,
                    ),
                    const SizedBox(height: 25),
                    Text(
                      'اپل شاپ',
                      style: AppTextStyle.sb.copyWith(
                        color: AppColors.whiteColor,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),

                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller:
                            _usernameController,
                        decoration: InputDecoration(
                          labelText: 'نام کاربری',
                          labelStyle: AppTextStyle.sb
                              .copyWith(
                                color: AppColors
                                    .blackColor,
                              ),

                          enabledBorder:
                              const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                  color: AppColors
                                      .blackColor,
                                ),
                                borderRadius:
                                    BorderRadius.all(
                                      Radius.circular(
                                        15,
                                      ),
                                    ),
                              ),

                          focusedBorder:
                              const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 3,
                                  color: AppColors
                                      .blueColor,
                                ),
                                borderRadius:
                                    BorderRadius.all(
                                      Radius.circular(
                                        15,
                                      ),
                                    ),
                              ),
                        ),
                      ),

                      const SizedBox(height: 20),
                      TextField(
                        controller:
                            _passwordController,
                        decoration: InputDecoration(
                          labelText: 'رمز عبور',
                          labelStyle: AppTextStyle.sb
                              .copyWith(
                                color: AppColors
                                    .blackColor,
                              ),

                          enabledBorder:
                              const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                  color: AppColors
                                      .blackColor,
                                ),
                                borderRadius:
                                    BorderRadius.all(
                                      Radius.circular(
                                        15,
                                      ),
                                    ),
                              ),

                          focusedBorder:
                              const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 3,
                                  color: AppColors
                                      .blueColor,
                                ),
                                borderRadius:
                                    BorderRadius.all(
                                      Radius.circular(
                                        15,
                                      ),
                                    ),
                              ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          return _buildLoginState(
                            state,
                            context,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginState(
    AuthState state,
    BuildContext context,
  ) {
    switch (state) {
      case AuthInitiate():
        return ElevatedButton(
          onPressed: () {
            context.read<AuthBloc>().add(
              AuthLoginRequest(
                _usernameController.text,
                _passwordController.text,
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            backgroundColor: AppColors.blueColor,
            minimumSize: const Size(160, 45),
          ),

          child: Text(
            'ورود به حساب کاربری',
            style: AppTextStyle.sb.copyWith(
              fontSize: 16,
              color: AppColors.whiteColor,
            ),
          ),
        );

      case AuthLoadingState():
        return const Center(
          child: SpinKitCircle(
            color: AppColors.blueColor,
            size: 50.0,
          ),
        );

      case AuthResponseState():
        return state.response.fold(
          (errorMessage) {
            return Text(errorMessage);
          },
          (successMessage) {
            return Text(successMessage);
          },
        );

      default:
        return const Text('خطای نامشخص');
    }
  }
}
