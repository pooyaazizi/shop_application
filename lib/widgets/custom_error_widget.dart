import 'package:flutter/material.dart';
import 'package:shop_application/core/theme/app_colors.dart';
import 'package:shop_application/core/theme/app_text_style.dart';

class CustomErrorWidget extends StatelessWidget {
  final BuildContext context;
  final String message;
  CustomErrorWidget({
    super.key,
    required this.context,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,

      margin: EdgeInsets.all(44),

      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.asset(
              'assets/images/icon_error.webp',
              fit: BoxFit.fitWidth,
            ),
          ),

          SizedBox(height: 24),

          Text(
            message,
            textAlign: TextAlign.center,
            style: AppTextStyle.sb.copyWith(
              fontSize: 16,
              color: AppColors.redColor,
            ),
          ),

          SizedBox(height: 24),
        ],
      ),
    );
  }
}
