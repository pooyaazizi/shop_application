import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shop_application/core/theme/app_colors.dart';
import 'package:shop_application/core/theme/app_text_style.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundScreenColor,

      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
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
                          'آیفون',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.sb
                              .copyWith(
                                fontSize: 16,
                                color: AppColors
                                    .blueColor,
                              ),
                        ),
                      ),

                      Image.asset(
                        'assets/images/icon_back_rigth_arrow_circle.png',
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 44,
                  left: 44,
                  top: 32,
                  bottom: 20,
                ),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    'آیفون SE 2022',
                    style: AppTextStyle.sb.copyWith(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 44,
                ),
                child: Card(
                  elevation: 6,
                  shadowColor:
                      AppColors.grayLigthColor,

                  color: AppColors.whiteColor,
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Stack(
                          alignment:
                              AlignmentDirectional
                                  .topCenter,
                          children: [
                            Positioned(
                              top: 10,
                              left: 10,
                              child: Row(
                                mainAxisSize:
                                    MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    'assets/images/icon_star.png',
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    '4.6',
                                    style: AppTextStyle
                                        .sm
                                        .copyWith(
                                          fontSize: 12,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.all(
                                    18.0,
                                  ),
                              child: Image.asset(
                                'assets/images/iphone.png',
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: Image.asset(
                                'assets/images/icon_favourite_active.png',
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                          right: 30,
                          left: 30,
                          bottom: 30,
                        ),
                        child: Row(
                          mainAxisSize:
                              MainAxisSize.max,
                          mainAxisAlignment:
                              MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 70,
                                child: ListView.builder(
                                  scrollDirection:
                                      Axis.horizontal,
                                  itemCount: 6,
                                  itemBuilder:
                                      (
                                        context,
                                        index,
                                      ) {
                                        return ProductImageGallery();
                                      },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 44,
                  right: 44,
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.end,
                  children: [
                    Text(
                      'انتخاب رنگ',
                      style: AppTextStyle.sb.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.end,
                      children: [
                        Container(
                          margin:
                              const EdgeInsets.only(
                                left: 10,
                              ),
                          width: 26,
                          height: 26,
                          decoration:
                              const BoxDecoration(
                                color: AppColors
                                    .whiteColor,
                                borderRadius:
                                    BorderRadius.all(
                                      Radius.circular(
                                        8,
                                      ),
                                    ),
                              ),
                        ),

                        Container(
                          margin:
                              const EdgeInsets.only(
                                left: 10,
                              ),
                          width: 26,
                          height: 26,
                          decoration:
                              const BoxDecoration(
                                color:
                                    AppColors.redColor,
                                borderRadius:
                                    BorderRadius.all(
                                      Radius.circular(
                                        8,
                                      ),
                                    ),
                              ),
                        ),

                        Container(
                          margin:
                              const EdgeInsets.only(
                                left: 10,
                              ),
                          width: 26,
                          height: 26,
                          decoration:
                              const BoxDecoration(
                                color: AppColors
                                    .blackColor,
                                borderRadius:
                                    BorderRadius.all(
                                      Radius.circular(
                                        8,
                                      ),
                                    ),
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 44,
                  right: 44,
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.end,
                  children: [
                    Text(
                      'انتخاب حافظه داخلی',
                      style: AppTextStyle.sb.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.end,
                      children: [
                        Container(
                          margin:
                              const EdgeInsets.only(
                                left: 10,
                              ),
                          width: 74,
                          height: 26,
                          decoration: BoxDecoration(
                            color:
                                AppColors.whiteColor,
                            border: BoxBorder.all(
                              width: 0.5,
                              color:
                                  AppColors.grayColor,
                            ),
                            borderRadius:
                                const BorderRadius.all(
                                  Radius.circular(8),
                                ),
                          ),
                          child: Center(
                            child: Text(
                              '512',
                              style: AppTextStyle.sb
                                  .copyWith(
                                    fontSize: 12,
                                  ),
                            ),
                          ),
                        ),

                        Container(
                          margin:
                              const EdgeInsets.only(
                                left: 10,
                              ),
                          width: 74,
                          height: 26,
                          decoration: BoxDecoration(
                            color:
                                AppColors.whiteColor,
                            border: BoxBorder.all(
                              width: 0.5,
                              color:
                                  AppColors.grayColor,
                            ),
                            borderRadius:
                                const BorderRadius.all(
                                  Radius.circular(8),
                                ),
                          ),
                          child: Center(
                            child: Text(
                              '256',
                              style: AppTextStyle.sb
                                  .copyWith(
                                    fontSize: 12,
                                  ),
                            ),
                          ),
                        ),

                        Container(
                          margin:
                              const EdgeInsets.only(
                                left: 10,
                              ),
                          width: 74,
                          height: 26,
                          decoration: BoxDecoration(
                            color:
                                AppColors.whiteColor,
                            border: BoxBorder.all(
                              width: 2,
                              color:
                                  AppColors.blueColor,
                            ),
                            borderRadius:
                                const BorderRadius.all(
                                  Radius.circular(8),
                                ),
                          ),
                          child: Center(
                            child: Text(
                              '128',
                              style: AppTextStyle.sb
                                  .copyWith(
                                    fontSize: 12,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  right: 44,
                  left: 44,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: AppColors.grayColor,
                    ),
                    color: AppColors.whiteColor,
                    borderRadius:
                        const BorderRadius.all(
                          Radius.circular(15),
                        ),
                  ),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,

                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(
                                top: 15,
                                bottom: 15,
                                right: 10,
                              ),
                          child: Text(
                            'مشخصات فنی:',
                            textAlign: TextAlign.end,
                            style: AppTextStyle.sm
                                .copyWith(
                                  fontSize: 12,
                                  color: AppColors
                                      .blackColor,
                                ),
                          ),
                        ),

                        const Spacer(),

                        Padding(
                          padding:
                              const EdgeInsets.only(
                                top: 15,
                                bottom: 15,
                                left: 10,
                              ),
                          child: Text(
                            'مشاهده',
                            style: AppTextStyle.sb
                                .copyWith(
                                  fontSize: 12,
                                  color: AppColors
                                      .blueColor,
                                ),
                            textAlign: TextAlign.start,
                          ),
                        ),

                        Padding(
                          padding:
                              const EdgeInsets.only(
                                top: 13,
                                bottom: 13,
                                left: 10,
                              ),
                          child: Image.asset(
                            'assets/images/icon_left_product_list.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  right: 44,
                  left: 44,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: AppColors.grayColor,
                    ),
                    color: AppColors.whiteColor,
                    borderRadius:
                        const BorderRadius.all(
                          Radius.circular(15),
                        ),
                  ),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,

                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(
                                top: 15,
                                bottom: 15,
                                right: 10,
                              ),
                          child: Text(
                            'توضیحات محصول:',
                            textAlign: TextAlign.end,
                            style: AppTextStyle.sm
                                .copyWith(
                                  fontSize: 12,
                                  color: AppColors
                                      .blackColor,
                                ),
                          ),
                        ),

                        const Spacer(),

                        Padding(
                          padding:
                              const EdgeInsets.only(
                                top: 15,
                                bottom: 15,
                                left: 10,
                              ),
                          child: Text(
                            'مشاهده',
                            style: AppTextStyle.sb
                                .copyWith(
                                  fontSize: 12,
                                  color: AppColors
                                      .blueColor,
                                ),
                            textAlign: TextAlign.start,
                          ),
                        ),

                        Padding(
                          padding:
                              const EdgeInsets.only(
                                top: 13,
                                bottom: 13,
                                left: 10,
                              ),
                          child: Image.asset(
                            'assets/images/icon_left_product_list.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  right: 44,
                  left: 44,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: AppColors.grayColor,
                    ),
                    color: AppColors.whiteColor,
                    borderRadius:
                        const BorderRadius.all(
                          Radius.circular(15),
                        ),
                  ),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,

                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(
                                top: 15,
                                bottom: 15,
                                right: 10,
                              ),
                          child: Text(
                            'نظرات کاربران:',
                            textAlign: TextAlign.end,
                            style: AppTextStyle.sm
                                .copyWith(
                                  fontSize: 12,
                                  color: AppColors
                                      .blackColor,
                                ),
                          ),
                        ),
                        SizedBox(width: 10),

                        Expanded(
                          child: Stack(
                            children: [
                              Container(
                                width: 26,
                                height: 26,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors
                                        .whiteColor,
                                  ),
                                  borderRadius:
                                      const BorderRadius.all(
                                        Radius.circular(
                                          10,
                                        ),
                                      ),
                                ),
                                clipBehavior:
                                    Clip.antiAlias,
                                child: Image.asset(
                                  'assets/images/user1.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),

                              Positioned(
                                right: 18,
                                child: Container(
                                  width: 26,
                                  height: 26,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: AppColors
                                          .whiteColor,
                                    ),

                                    borderRadius:
                                        const BorderRadius.all(
                                          Radius.circular(
                                            10,
                                          ),
                                        ),
                                  ),
                                  clipBehavior:
                                      Clip.antiAlias,
                                  child: Image.asset(
                                    'assets/images/user2.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              Positioned(
                                right: 36,
                                child: Container(
                                  width: 26,
                                  height: 26,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: AppColors
                                          .whiteColor,
                                    ),

                                    borderRadius:
                                        const BorderRadius.all(
                                          Radius.circular(
                                            10,
                                          ),
                                        ),
                                  ),
                                  clipBehavior:
                                      Clip.antiAlias,
                                  child: Image.asset(
                                    'assets/images/user3.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              Positioned(
                                right: 54,
                                child: Container(
                                  width: 26,
                                  height: 26,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: AppColors
                                          .whiteColor,
                                    ),

                                    borderRadius:
                                        const BorderRadius.all(
                                          Radius.circular(
                                            10,
                                          ),
                                        ),
                                  ),
                                  clipBehavior: Clip
                                      .antiAliasWithSaveLayer,
                                  child: Image.asset(
                                    'assets/images/user4.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              Positioned(
                                right: 72,
                                child: Container(
                                  width: 26,
                                  height: 26,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: AppColors
                                          .whiteColor,
                                    ),

                                    borderRadius:
                                        const BorderRadius.all(
                                          Radius.circular(
                                            10,
                                          ),
                                        ),
                                    color: AppColors
                                        .grayColor,
                                  ),
                                  clipBehavior:
                                      Clip.antiAlias,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.all(
                                          2,
                                        ),
                                    child: Center(
                                      child: Text(
                                        '10+',
                                        style: AppTextStyle
                                            .sb
                                            .copyWith(
                                              color: AppColors
                                                  .whiteColor,
                                              fontSize:
                                                  10,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding:
                              const EdgeInsets.only(
                                top: 15,
                                bottom: 15,
                                left: 10,
                                right: 10,
                              ),
                          child: Text(
                            'مشاهده',
                            style: AppTextStyle.sb
                                .copyWith(
                                  fontSize: 12,
                                  color: AppColors
                                      .blueColor,
                                ),
                            textAlign: TextAlign.start,
                          ),
                        ),

                        Padding(
                          padding:
                              const EdgeInsets.only(
                                top: 13,
                                bottom: 13,
                                left: 10,
                              ),
                          child: Image.asset(
                            'assets/images/icon_left_product_list.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            SliverPadding(
              padding: EdgeInsetsGeometry.only(
                top: 38,
                bottom: 32,
                right: 44,
                left: 44,
              ),
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    PriceTagButton(),
                    AddToBasketButton(),
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

class PriceTagButton extends StatelessWidget {
  const PriceTagButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 63,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            width: 140,
            height: 58,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              color: AppColors.greenColor,
            ),
          ),

          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 25,
                sigmaY: 25,
              ),
              child: Container(
                width: 160,
                height: 53,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  color: AppColors.whiteColor
                      .withValues(alpha: 0.1),
                ),

                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(
                          10.0,
                        ),
                        child: Container(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(
                                  top: 2,
                                  bottom: 2,
                                  left: 5,
                                  right: 5,
                                ),
                            child: Text(
                              '%5',
                              style: AppTextStyle.sb
                                  .copyWith(
                                    fontSize: 10,
                                    color: AppColors
                                        .whiteColor,
                                  ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.redColor,
                            borderRadius:
                                BorderRadius.all(
                                  Radius.circular(7.5),
                                ),
                          ),
                        ),
                      ),

                      Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment:
                            CrossAxisAlignment.end,
                        children: [
                          Text(
                            '17,800,000',
                            style: AppTextStyle.sm
                                .copyWith(
                                  color: AppColors
                                      .whiteColor,
                                  fontSize: 12,
                                  decoration:
                                      TextDecoration
                                          .lineThrough,
                                  decorationColor:
                                      AppColors
                                          .whiteColor,
                                  decorationThickness:
                                      1,
                                ),
                          ),

                          Text(
                            '16,989,000',
                            style: AppTextStyle.sb
                                .copyWith(
                                  color: AppColors
                                      .whiteColor,
                                  fontSize: 16,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'تومان',
                        style: AppTextStyle.sb
                            .copyWith(
                              fontSize: 12,
                              color:
                                  AppColors.whiteColor,
                            ),
                      ),

                      const SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddToBasketButton extends StatelessWidget {
  const AddToBasketButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 63,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            width: 140,
            height: 58,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              color: AppColors.blueColor,
            ),
          ),

          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 25,
                sigmaY: 25,
              ),
              child: Container(
                width: 160,
                height: 53,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  color: AppColors.whiteColor
                      .withValues(alpha: 0.1),
                ),

                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.center,
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: [
                      Text(
                        'افزودن به سبد خرید',
                        style: AppTextStyle.sb
                            .copyWith(
                              fontSize: 16,
                              color:
                                  AppColors.whiteColor,
                            ),
                      ),

                      const SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductImageGallery extends StatelessWidget {
  const ProductImageGallery({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          border: BoxBorder.all(
            width: 1,
            color: AppColors.grayColor,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Image.asset(
            'assets/images/iphone.png',
          ),
        ),
      ),
    );
  }
}
