import 'package:flutter/material.dart';
import 'package:shop_application/core/di/locator.dart';
import 'package:shop_application/core/theme/app_colors.dart';
import 'package:shop_application/core/theme/app_text_style.dart';
import 'package:shop_application/core/utils/auth_manager.dart';
import 'package:shop_application/data/repository/authentication_repository.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() =>
      _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,
            crossAxisAlignment:
                CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final IAuthenticationRepository
                  auth = locator.get();
                  var either = await auth.login(
                    'Pooyaazizi5',
                    '12345678',
                  );

                  either.fold(
                    (errorMessage) {
                      // print(errorMessage);
                    },
                    (successMessage) {
                      //    print(successMessage);
                    },
                  );

                  if (AuthManager.isLogedin()) {
                    /*          print(
                      'ورود و ذخیر توکن با موفقیت انجام شده است.',
                    ); */
                  } else {
                    /*  print(
                      'متاسفانه ذخیره توکن به درستی انجام نشده است',
                    ); */
                  }
                },
                child: Text(
                  'Login',
                  style: AppTextStyle.sm.copyWith(
                    fontSize: 16,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  AuthManager.logout();
                  if (!AuthManager.isLogedin()) {
                    /*   print(
                      'خروج و حذف توکن با موفقیت انجام شده است.',
                    ); */
                  }
                },
                child: Text(
                  'Logout',
                  style: AppTextStyle.sm.copyWith(
                    fontSize: 16,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),

              ValueListenableBuilder(
                valueListenable:
                    AuthManager.authChangeNotifier,
                builder: ((context, value, child) {
                  if (value == null || value.isEmpty) {
                    return Text(
                      'شما وارد نشده اید',
                      style: AppTextStyle.sm.copyWith(
                        fontSize: 20,
                      ),
                    );
                  } else {
                    return Text(
                      'شما وارد شده اید',
                      style: AppTextStyle.sm.copyWith(
                        fontSize: 20,
                      ),
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
