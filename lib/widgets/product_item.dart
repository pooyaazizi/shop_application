import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/bloc/product/product_detail_bloc.dart';
import 'package:shop_application/core/theme/app_colors.dart';
import 'package:shop_application/core/theme/app_text_style.dart';
import 'package:shop_application/core/utils/number_extension.dart';
import 'package:shop_application/domain/entities/product_entity.dart';
import 'package:shop_application/screens/product_detail_screen.dart';
import 'package:shop_application/widgets/cached_image.dart';

class ProductItem extends StatelessWidget {
  ProductEntity product;
  ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => ProductDetailBloc(),
              child: ProductDetailScreen(
                productEntity: product,
              ),
            ),
          ),
        );
      },
      child: Container(
        width: 160,
        height: 217,
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
                  alignment:
                      AlignmentDirectional.center,
                  children: [
                    const SizedBox(
                      width: double.infinity,
                    ),

                    CachedImage(
                      imageUrl: product.thumbnail,
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

                    Visibility(
                      visible:
                          product.discountPercent >
                          0.01,
                      child: Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          decoration:
                              const BoxDecoration(
                                color:
                                    AppColors.redColor,
                                borderRadius:
                                    BorderRadius.all(
                                      Radius.circular(
                                        7.5,
                                      ),
                                    ),
                              ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(
                                  vertical: 2,
                                  horizontal: 6,
                                ),
                            child: Text(
                              product.discountPercent
                                  .toPercent(),
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
                    ),
                  ],
                ),
              ),
            ),

            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                const SizedBox(width: double.infinity),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    product.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
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
              decoration: const BoxDecoration(
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
                  horizontal: 9,
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

                    const Spacer(),

                    Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      crossAxisAlignment:
                          CrossAxisAlignment.end,
                      children: [
                        Text(
                          product.price.toSeparated(),
                          style: AppTextStyle.sm
                              .copyWith(
                                fontSize: 12,
                                color: AppColors
                                    .whiteColor,
                                decoration:
                                    TextDecoration
                                        .lineThrough,
                                decorationThickness: 2,
                                decorationColor:
                                    AppColors
                                        .whiteColor,
                              ),
                        ),
                        Text(
                          product.realPrice
                              .toSeparated(),

                          style: AppTextStyle.sm
                              .copyWith(
                                fontSize: 16,
                                color: AppColors
                                    .whiteColor,
                              ),
                        ),
                      ],
                    ),

                    const SizedBox(width: 5),

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
      ),
    );
  }
}
