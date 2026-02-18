import 'package:flutter/material.dart';
import 'package:shop_application/core/theme/app_colors.dart';
import 'package:shop_application/domain/entities/banner_entity.dart';
import 'package:shop_application/widgets/cached_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerSlider extends StatelessWidget {
  final List<BannerEntity>? bannerEntityList;
  const BannerSlider({
    super.key,
    required this.bannerEntityList,
  });

  @override
  Widget build(BuildContext context) {
    var controller = PageController(
      viewportFraction: 0.85,
    );
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        SizedBox(
          height: 171,
          child: PageView.builder(
            controller: controller,
            itemCount: bannerEntityList?.length ?? 0,
            itemBuilder: (contest, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  right: 12,
                  left: 12,
                ),
                child: Container(
                  height: 171,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: AppColors.redColor,
                    borderRadius:
                        BorderRadius.circular(16),
                  ),
                  child: CachedImage(
                    imageUrl:
                        bannerEntityList?[index]
                            .thumbnail ??
                        '',
                  ),
                ),
              );
            },
          ),
        ),

        Positioned(
          bottom: 8,
          child: SmoothPageIndicator(
            controller: controller,
            count: bannerEntityList?.length ?? 0,
            effect: const ExpandingDotsEffect(
              expansionFactor: 5,
              dotWidth: 5,
              dotHeight: 5,
              dotColor: AppColors.whiteColor,
              activeDotColor: AppColors.blueColor,
            ),
          ),
        ),
      ],
    );
  }
}
