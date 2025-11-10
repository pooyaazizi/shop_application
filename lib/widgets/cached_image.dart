import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:shop_application/core/theme/app_colors.dart';

class CachedImage extends StatelessWidget {
  String imageUrl;
  CachedImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        errorWidget: (context, url, error) =>
            Container(
              color: AppColors.redColor.withAlpha(26),
            ),
        placeholder: (context, url) => Container(
          color: AppColors.grayColor.withAlpha(26),
        ),
      ),
    );
  }
}
