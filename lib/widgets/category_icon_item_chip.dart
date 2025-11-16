import 'package:flutter/material.dart';
import 'package:shop_application/core/theme/app_text_style.dart';
import 'package:shop_application/domain/entities/category_entity.dart';
import 'package:shop_application/widgets/cached_image.dart';

class CategoryIconItemChip extends StatelessWidget {
  CategoryEntity category;

  CategoryIconItemChip({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    String categoryColor = 'ff${category.color}';
    int hexColor = int.parse(categoryColor, radix: 16);
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: ShapeDecoration(
                color: Color(hexColor),
                shadows: [
                  BoxShadow(
                    color: Color(hexColor),
                    blurRadius: 25,
                    spreadRadius: -12,
                    offset: const Offset(0.0, 12),
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

            SizedBox(
              width: 24,
              height: 24,
              child: CachedImage(
                imageUrl: category.icon,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          category.title,
          style: AppTextStyle.sb.copyWith(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
