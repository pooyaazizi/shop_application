import 'package:flutter/material.dart';
import 'package:shop_application/core/theme/app_colors.dart';
import 'package:shop_application/core/theme/app_text_style.dart';
import 'package:shop_application/domain/entities/product_entity.dart';
import 'package:shop_application/widgets/product_item.dart';

class ProductListScreen extends StatelessWidget {
  List<ProductEntity> productList;
  ProductListScreen({
    super.key,
    required this.productList,
  });

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
                          'پرفروش ترین ها',
                          textAlign: TextAlign.center,
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

            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: 44,
                vertical: 32,
              ),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate((
                  context,
                  index,
                ) {
                  return ProductItem(
                    product: productList[index],
                  );
                }),
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 2 / 2.9,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
