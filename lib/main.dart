import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/bloc/home/home_bloc.dart';
import 'package:shop_application/bloc/category/category_bloc.dart';
import 'package:shop_application/core/di/locator.dart';
import 'package:shop_application/core/theme/app_colors.dart';
import 'package:shop_application/core/theme/app_text_style.dart';
import 'package:shop_application/screens/category_screen.dart';
import 'package:shop_application/screens/cart_screen.dart';
import 'package:shop_application/screens/home_screen.dart';
import 'package:shop_application/screens/profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var selectedNavigationBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: IndexedStack(
          index: selectedNavigationBarIndex,
          children: getScreens(),
        ),
        bottomNavigationBar: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 15,
              sigmaY: 15,
            ),
            child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              selectedLabelStyle: AppTextStyle.sm
                  .copyWith(
                    color: AppColors.greenColor,
                  ),
              unselectedLabelStyle: AppTextStyle.sm
                  .copyWith(
                    color: AppColors.blackColor,
                  ),
              onTap: (int index) {
                setState(() {
                  selectedNavigationBarIndex = index;
                });
              },
              type: BottomNavigationBarType.fixed,
              currentIndex: selectedNavigationBarIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 5,
                    ),
                    child: Image.asset(
                      'assets/images/icon_profile.png',
                    ),
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 5,
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.blueColor,
                            blurRadius: 20,
                            spreadRadius: -7,
                            offset: Offset(0, 13),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/images/icon_profile_active.png',
                      ),
                    ),
                  ),
                  label: 'حساب کاربری',
                ),

                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 5,
                    ),
                    child: Image.asset(
                      'assets/images/icon_shopping_cart.png',
                    ),
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 5,
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.blueColor,
                            blurRadius: 20,
                            spreadRadius: -7,
                            offset: Offset(0, 13),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/images/icon_shopping_cart_active.png',
                      ),
                    ),
                  ),
                  label: 'سبد خرید',
                ),

                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 5,
                    ),
                    child: Image.asset(
                      'assets/images/icon_category.png',
                    ),
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 5,
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.blueColor,
                            blurRadius: 20,
                            spreadRadius: -7,
                            offset: Offset(0, 13),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/images/icon_category_active.png',
                      ),
                    ),
                  ),
                  label: 'دسته بندی',
                ),

                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 5,
                    ),
                    child: Image.asset(
                      'assets/images/icon_home.png',
                    ),
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 5,
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.blueColor,
                            blurRadius: 20,
                            spreadRadius: -7,
                            offset: Offset(0, 13),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/images/icon_home_active.png',
                      ),
                    ),
                  ),
                  label: 'خانه',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> getScreens() {
    return [
      const ProfileScreen(),
      const CartScreen(),
      BlocProvider(
        create: (context) => CategoryBloc(),
        child: CategoryScreen(),
      ),

      BlocProvider(
        create: (context) => HomeBloc(),
        child: HomeScreen(),
      ),
    ];
  }
}
