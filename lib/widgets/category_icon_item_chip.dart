import 'package:flutter/material.dart';
import 'package:shop_application/core/theme/app_colors.dart';
import 'package:shop_application/core/theme/app_text_style.dart';

class CategoryIconItemChip extends StatelessWidget {
  const CategoryIconItemChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: ShapeDecoration(
                color: AppColors.redColor,
                shadows: const [
                  BoxShadow(
                    color: AppColors.redColor,
                    blurRadius: 25,
                    spreadRadius: -12,
                    offset: Offset(0.0, 12),
                  ),
                ],
                shape: ContinuousRectangleBorder(
                  borderRadius:
                      BorderRadiusGeometry.circular(
                        40,
                      ),
                ),
              ),
            ),

            Icon(
              Icons.ads_click,
              size: 30,
              color: AppColors.whiteColor,
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          'همه',
          style: AppTextStyle.sb.copyWith(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
