import 'package:flutter/material.dart';
import 'package:shop_application/core/theme/app_colors.dart';
import 'package:shop_application/core/theme/app_text_style.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 216,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 124,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  SizedBox(width: double.infinity),

                  Image.asset(
                    'assets/images/iphone.png',
                  ),

                  Positioned(
                    top: 0,
                    right: 0,
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: Image.asset(
                        'assets/images/icon_favourite_active.png',
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.redColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(7.5),
                        ),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 6,
                            ),
                        child: Text(
                          '%3',
                          style: AppTextStyle.sm
                              .copyWith(
                                color: AppColors
                                    .whiteColor,
                                fontSize: 10,
                              ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              SizedBox(width: double.infinity),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'آیفون 13 پرومکس',
                  style: AppTextStyle.sm.copyWith(
                    fontSize: 14,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
            ],
          ),

          Container(
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              color: AppColors.blueColor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.blueColor,
                  blurRadius: 25,
                  spreadRadius: -14,
                  offset: Offset(0.0, 14),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Image.asset(
                      'assets/images/icon_right_arrow_cricle.png',
                    ),
                  ),

                  Spacer(),

                  Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    crossAxisAlignment:
                        CrossAxisAlignment.end,
                    children: [
                      Text(
                        '95,000,000',
                        style: AppTextStyle.sm
                            .copyWith(
                              fontSize: 12,
                              color:
                                  AppColors.whiteColor,
                              decoration:
                                  TextDecoration
                                      .lineThrough,
                              decorationThickness: 2,
                              decorationColor:
                                  AppColors.whiteColor,
                            ),
                      ),
                      Text(
                        '93,500,000',
                        style: AppTextStyle.sm
                            .copyWith(
                              fontSize: 16,
                              color:
                                  AppColors.whiteColor,
                            ),
                      ),
                    ],
                  ),

                  SizedBox(width: 5),

                  Text(
                    'تومان',
                    style: AppTextStyle.sm.copyWith(
                      fontSize: 12,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
