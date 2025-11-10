import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:shop_application/core/theme/app_colors.dart';
import 'package:shop_application/core/theme/app_text_style.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundScreenColor,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            CustomScrollView(
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
                              'سبد خرید',
                              textAlign:
                                  TextAlign.center,
                              style: AppTextStyle.sb
                                  .copyWith(
                                    fontSize: 16,
                                    color: AppColors
                                        .blueColor,
                                  ),
                            ),
                          ),

                          const SizedBox(width: 38),
                        ],
                      ),
                    ),
                  ),
                ),

                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return CartItem();
                    },
                    childCount: 5,
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(bottom: 93),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(
                bottom: 20,
                left: 44,
                right: 44,
              ),
              child: SizedBox(
                width: MediaQuery.of(
                  context,
                ).size.width,
                height: 53,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        AppColors.greenColor,

                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    'ادامه فرآیند خرید',
                    style: AppTextStyle.sb.copyWith(
                      fontSize: 16,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 249.0,
      margin: EdgeInsets.only(
        left: 44,
        top: 20,
        right: 44,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.grayColor,
            blurRadius: 20,
            spreadRadius: -18,
            offset: Offset(0, 10),
          ),
        ],

        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        color: AppColors.whiteColor,
      ),
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 8,
                      left: 20,
                      top: 17,
                    ),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.start,
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [
                          Text(
                            'آیفون 13 پرو مکس دو سیم کارت',
                            overflow:
                                TextOverflow.ellipsis,
                            style: AppTextStyle.sb
                                .copyWith(
                                  fontSize: 16,
                                  color: AppColors
                                      .blackColor,
                                ),
                          ),

                          SizedBox(height: 10),

                          Text(
                            'گارانتی 18 ماه مدیا پردازش',
                            overflow:
                                TextOverflow.ellipsis,
                            style: AppTextStyle.sm
                                .copyWith(
                                  fontSize: 10,
                                  color: AppColors
                                      .grayColor,
                                ),
                          ),

                          SizedBox(height: 10),

                          Wrap(
                            crossAxisAlignment:
                                WrapCrossAlignment
                                    .center,
                            alignment: WrapAlignment
                                .spaceEvenly,
                            runAlignment:
                                WrapAlignment.center,
                            children: [
                              Text(
                                '38,500,000',
                                overflow: TextOverflow
                                    .ellipsis,
                                style: AppTextStyle.sm
                                    .copyWith(
                                      fontSize: 12,
                                      color: AppColors
                                          .grayColor,
                                    ),
                              ),
                              SizedBox(width: 5),

                              Text(
                                'تومان',
                                overflow: TextOverflow
                                    .ellipsis,
                                style: AppTextStyle.sm
                                    .copyWith(
                                      fontSize: 10,
                                      color: AppColors
                                          .grayColor,
                                    ),
                              ),

                              SizedBox(width: 5),
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors
                                      .redColor,
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
                                        horizontal: 6,
                                        vertical: 1,
                                      ),
                                  child: Text(
                                    '%4',
                                    style: AppTextStyle
                                        .sb
                                        .copyWith(
                                          fontSize: 10,
                                          color: AppColors
                                              .whiteColor,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Wrap(
                            runSpacing: 10,
                            spacing: 10,
                            children: [
                              OptionChip(),
                              OptionChip(),
                              OptionChip(),
                              OptionChip(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: 80,
                    child: Center(
                      child: Image.asset(
                        'assets/images/iphone.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            child: DottedLine(
              lineThickness: 2,
              dashColor: AppColors.grayLigthColor,
              lineLength: double.infinity,
              dashLength: 6,
              dashGapLength: 2,
              dashRadius: 10,
            ),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              children: [
                Text(
                  '38,000,000',
                  style: AppTextStyle.sm.copyWith(
                    fontSize: 16,
                    color: AppColors.blackColor,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  'تومان',
                  style: AppTextStyle.sm.copyWith(
                    fontSize: 12,
                    color: AppColors.blackColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class OptionChip extends StatelessWidget {
  const OptionChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: BoxBorder.all(
          width: 1,
          color: AppColors.grayChipBorder,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 5,
              bottom: 5,
              right: 10,
              left: 10,
            ),
            child: Text(
              '1 ترابایت',
              style: AppTextStyle.sm.copyWith(
                fontSize: 10,
                color: AppColors.grayColor,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
              top: 5,
              bottom: 5,
              left: 10,
              right: 10,
            ),
            child: Image.asset(
              'assets/images/icon_options.png',
            ),
          ),
        ],
      ),
    );
  }
}
