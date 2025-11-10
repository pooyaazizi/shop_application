import 'package:flutter/material.dart';
import 'package:shop_application/core/theme/app_colors.dart';
import 'package:shop_application/core/theme/app_text_style.dart';
import 'package:shop_application/widgets/banner_slider.dart';
import 'package:shop_application/widgets/category_icon_item_chip.dart';
import 'package:shop_application/widgets/product_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                          'جستجوی محصولات',
                          textAlign: TextAlign.end,
                          style: AppTextStyle.sb
                              .copyWith(
                                fontSize: 16,
                                color: AppColors
                                    .grayColor,
                              ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      Image.asset(
                        'assets/images/icon_search.png',
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                ),
              ),
            ),

            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 32),
                child: BannerSlider(),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 44,
                  top: 32,
                ),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.end,
                  children: [
                    Text(
                      'دسته بندی',
                      style: AppTextStyle.sb.copyWith(
                        color: AppColors.grayColor,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 44,
                ),
                child: SizedBox(
                  height: 103,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.only(
                          top: 20,
                          left: 20,
                        ),
                        child: CategoryIconItemChip(),
                      );
                    },
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
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/icon_left_product_list.png',
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'مشاهده همه',
                      style: AppTextStyle.sb.copyWith(
                        color: AppColors.blueColor,
                        fontSize: 12,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'پر فروش ترین ها',
                      style: AppTextStyle.sb.copyWith(
                        color: AppColors.grayColor,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: SizedBox(
                height: 220,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 44,
                  ),
                  child: ListView.builder(
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                        ),
                        child: ProductItem(),
                      );
                    },
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
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/icon_left_product_list.png',
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'مشاهده همه',
                      style: AppTextStyle.sb.copyWith(
                        color: AppColors.blueColor,
                        fontSize: 12,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'پر بازدید ترین ها',
                      style: AppTextStyle.sb.copyWith(
                        color: AppColors.grayColor,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 25,
                ),
                child: SizedBox(
                  height: 240,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 44,
                    ),
                    child: ListView.builder(
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            top: 20,
                          ),
                          child: ProductItem(),
                        );
                      },
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
