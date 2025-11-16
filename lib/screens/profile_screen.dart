import 'package:flutter/material.dart';
import 'package:shop_application/core/theme/app_colors.dart';
import 'package:shop_application/core/theme/app_text_style.dart';
import 'package:shop_application/widgets/category_icon_item_chip.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundScreenColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 44,
                left: 44,
                top: 20,
              ),
              child: Container(
                height: 46,
                decoration: const BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 16),
                    Image.asset(
                      'assets/images/icon_apple_blue.png',
                    ),

                    Expanded(
                      child: Text(
                        'حساب کاربری',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.sb
                            .copyWith(
                              fontSize: 16,
                              color:
                                  AppColors.blueColor,
                            ),
                      ),
                    ),

                    const SizedBox(width: 38),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'پویا عزیزی',
              style: AppTextStyle.sb.copyWith(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              '09100292960',
              style: AppTextStyle.sm.copyWith(
                fontSize: 12,
                color: AppColors.grayColor,
              ),
            ),

            const Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: EdgeInsetsGeometry.only(
                  top: 20,
                  right: 44,
                  left: 44,
                ),
                child: Wrap(
                  spacing: 33,
                  runSpacing: 20,
                  children: [
                    // CategoryIconItemChip(),
                    // CategoryIconItemChip(),
                    // CategoryIconItemChip(),
                    // CategoryIconItemChip(),
                    // CategoryIconItemChip(),
                    // CategoryIconItemChip(),
                    // CategoryIconItemChip(),
                    // CategoryIconItemChip(),
                    // CategoryIconItemChip(),
                    // CategoryIconItemChip(),
                  ],
                ),
              ),
            ),

            const Spacer(),
            Text(
              'اپل شاپ',
              style: AppTextStyle.sm.copyWith(
                color: AppColors.grayColor,
                fontSize: 10,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'V-1.0.00',
              style: AppTextStyle.sm.copyWith(
                color: AppColors.grayColor,
                fontSize: 10,
              ),
            ),

            const SizedBox(height: 5),
            Text(
              'instagram.com/Pooya-azizi5',
              style: AppTextStyle.sm.copyWith(
                color: AppColors.grayColor,
                fontSize: 10,
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
