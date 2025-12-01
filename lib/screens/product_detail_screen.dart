import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shop_application/bloc/product/product_detail_bloc.dart';
import 'package:shop_application/bloc/product/product_detail_event.dart';
import 'package:shop_application/bloc/product/product_detail_state.dart';
import 'package:shop_application/core/theme/app_colors.dart';
import 'package:shop_application/core/theme/app_text_style.dart';
import 'package:shop_application/core/utils/string_to_color_extention.dart';
import 'package:shop_application/data/dto/variant_type_dto.dart';
import 'package:shop_application/domain/entities/category_entity.dart';
import 'package:shop_application/domain/entities/product_entity.dart';
import 'package:shop_application/domain/entities/product_image_entity.dart';
import 'package:shop_application/domain/entities/product_property_entity.dart';
import 'package:shop_application/domain/entities/product_variant_entity.dart';
import 'package:shop_application/domain/entities/variant_entity.dart';
import 'package:shop_application/widgets/cached_image.dart';
import 'package:shop_application/widgets/custom_error_widget.dart';

class ProductDetailScreen extends StatefulWidget {
  ProductEntity productEntity;

  ProductDetailScreen({
    super.key,
    required this.productEntity,
  });

  @override
  State<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState
    extends State<ProductDetailScreen> {
  @override
  void initState() {
    super.initState();

    context.read<ProductDetailBloc>().add(
      PrtoductDetailInitializeEvent(
        widget.productEntity.id,
        widget.productEntity.category,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor:
            AppColors.backgroundScreenColor,
        body: SafeArea(
          child:
              BlocBuilder<
                ProductDetailBloc,
                ProductDetailState
              >(
                builder: (context, state) {
                  return _buildByState(state, context);
                },
              ),
        ),
      ),
    );
  }

  Widget _buildByState(
    ProductDetailState state,
    BuildContext context,
  ) {
    switch (state) {
      case ProductDetailInitiatState():
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: const Center(
            child: SpinKitCircle(
              size: 50,
              color: AppColors.blueColor,
            ),
          ),
        );

      case ProductDetailLoadingState():
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: const Center(
            child: SpinKitCircle(
              size: 50,
              color: AppColors.blueColor,
            ),
          ),
        );

      case ProductDetailResponseState():
        final productImageResult =
            state.productImageList;
        final productVariantResult =
            state.productVariantList;
        final productCategoryResult =
            state.productCategory;

        final productPropertyResult =
            state.productPropertyList;
        if (productImageResult.isLeft() &&
            productVariantResult.isLeft() &&
            productCategoryResult.isLeft() &&
            productPropertyResult.isLeft()) {
          return CustomErrorWidget(
            context: context,
            message: 'خطا در دریافت اطلاعات',
          );
        } else if (productImageResult.isLeft()) {
          return CustomErrorWidget(
            context: context,
            message: productImageResult.fold(
              (error) => error,
              (_) => '',
            ),
          );
        } else if (productVariantResult.isLeft()) {
          return CustomErrorWidget(
            context: context,
            message: productVariantResult.fold(
              (error) => error,
              (_) => '',
            ),
          );
        } else if (productCategoryResult.isLeft()) {
          return CustomErrorWidget(
            context: context,
            message: productCategoryResult.fold(
              (error) => error,
              (_) => '',
            ),
          );
        } else if (productPropertyResult.isLeft()) {
          return CustomErrorWidget(
            context: context,
            message: productImageResult.fold(
              (error) => error,
              (_) => '',
            ),
          );
        } else {
          return ProductDetailScreenContent(
            productImageList: productImageResult
                .getOrElse(() => []),
            productVariantList: productVariantResult
                .getOrElse(() => []),
            product: widget.productEntity,
            productCategory: productCategoryResult
                .getOrElse(
                  () => CategoryEntity(
                    '',
                    '',
                    '',
                    '',
                    '',
                    '',
                    '',
                  ),
                ),
            productPropertyList: productPropertyResult
                .getOrElse(() => []),
          );
        }

      default:
        return const SizedBox.shrink();
    }
  }
}

class ProductDetailScreenContent
    extends StatelessWidget {
  List<ProductImageEntity> productImageList;
  List<ProductVariantEntity> productVariantList;
  ProductEntity product;
  CategoryEntity productCategory;
  List<ProductPropertyEntity> productPropertyList;

  ProductDetailScreenContent({
    super.key,
    required this.productImageList,
    required this.productVariantList,
    required this.product,
    required this.productCategory,
    required this.productPropertyList,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<ProductDetailBloc>().add(
          PrtoductDetailInitializeEvent(
            product.id,
            product.category,
          ),
        );
      },
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
                      'assets/images/icon_back_rigth_arrow_circle.png',
                    ),

                    Expanded(
                      child: Text(
                        productCategory.title,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.sb
                            .copyWith(
                              fontSize: 16,
                              color:
                                  AppColors.blueColor,
                            ),
                      ),
                    ),

                    Image.asset(
                      'assets/images/icon_apple_blue.png',
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
                  product.name,
                  style: AppTextStyle.sb.copyWith(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),

          ProductGalleryWidget(
            productImageList: productImageList,
            thumbnail: product.thumbnail,
          ),

          VariantContainerGenerator(
            productVariants: productVariantList,
          ),

          ProductPropertiesWidget(
            productPropertyList: productPropertyList,
          ),

          ProductDescription(product: product),

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
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,

                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
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
                      const SizedBox(width: 10),

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
                        padding: const EdgeInsets.only(
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
                        padding: const EdgeInsets.only(
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
                  AddToBasketButton(),
                  PriceTagButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductPropertiesWidget extends StatefulWidget {
  List<ProductPropertyEntity> productPropertyList;
  ProductPropertiesWidget({
    super.key,
    required this.productPropertyList,
  });

  @override
  State<ProductPropertiesWidget> createState() =>
      _ProductPropertiesWidgetState();
}

class _ProductPropertiesWidgetState
    extends State<ProductPropertiesWidget> {
  var isProductPropertiesVisible = false;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Padding(
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
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  mainAxisSize: MainAxisSize.max,

                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
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
                              color:
                                  AppColors.blackColor,
                            ),
                      ),
                    ),

                    const Spacer(),

                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                        bottom: 15,
                        left: 10,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isProductPropertiesVisible =
                                !isProductPropertiesVisible;
                          });
                        },
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
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                        top: 13,
                        bottom: 13,
                        left: 10,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isProductPropertiesVisible =
                                !isProductPropertiesVisible;
                          });
                        },
                        child: Image.asset(
                          'assets/images/icon_left_product_list.png',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Visibility(
            visible: isProductPropertiesVisible,
            child: Container(
              padding: EdgeInsets.only(
                top: 15,
                bottom: 15,
                right: 10,
                left: 10,
              ),
              margin: EdgeInsets.only(
                top: 20,
                right: 44,
                left: 44,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: AppColors.grayColor,
                ),
                color: AppColors.whiteColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  SizedBox(width: double.infinity),
                  if (widget
                      .productPropertyList
                      .isNotEmpty) ...{
                    ...List.generate(
                      widget
                          .productPropertyList
                          .length,
                      (index) {
                        return RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    '${widget.productPropertyList[index].title}: ',
                                style: AppTextStyle.sb
                                    .copyWith(
                                      fontSize: 12,
                                      color: AppColors
                                          .blackColor,
                                    ),
                              ),
                              TextSpan(
                                text: widget
                                    .productPropertyList[index]
                                    .value,
                                style: AppTextStyle.sm
                                    .copyWith(
                                      fontSize: 12,

                                      color: AppColors
                                          .blackColor,
                                    ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  } else ...{
                    Center(
                      child: Text(
                        'محصول مشخصات فنی ندارد.',
                        style: AppTextStyle.sm
                            .copyWith(
                              fontSize: 12,

                              color:
                                  AppColors.blackColor,
                            ),
                      ),
                    ),

                    Center(
                      child: Text(
                        'محصول مشخصات فنی ندارد.',
                        style: AppTextStyle.sm
                            .copyWith(
                              fontSize: 12,

                              color:
                                  AppColors.blackColor,
                            ),
                      ),
                    ),
                  },
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDescription extends StatefulWidget {
  ProductEntity product;
  ProductDescription({
    super.key,
    required this.product,
  });

  @override
  State<ProductDescription> createState() =>
      _ProductDescriptionState();
}

class _ProductDescriptionState
    extends State<ProductDescription> {
  var isProductDescriptionVisible = false;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Padding(
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
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  mainAxisSize: MainAxisSize.max,

                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
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
                              color:
                                  AppColors.blackColor,
                            ),
                      ),
                    ),

                    const Spacer(),

                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                        bottom: 15,
                        left: 10,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isProductDescriptionVisible =
                                !isProductDescriptionVisible;
                          });
                        },
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
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                        top: 13,
                        bottom: 13,
                        left: 10,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isProductDescriptionVisible =
                                !isProductDescriptionVisible;
                          });
                        },
                        child: Image.asset(
                          'assets/images/icon_left_product_list.png',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Visibility(
            visible: isProductDescriptionVisible,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20,
                right: 44,
                left: 44,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 10,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: AppColors.grayColor,
                  ),
                  color: AppColors.whiteColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    widget.product.description,
                    style: AppTextStyle.sb.copyWith(
                      fontSize: 12,
                      color: AppColors.blackColor,
                      height: 1.8,
                    ),
                    textAlign: TextAlign.justify,
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

class VariantContainerGenerator
    extends StatelessWidget {
  List<ProductVariantEntity> productVariants;
  VariantContainerGenerator({
    super.key,
    required this.productVariants,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          for (var productVariant
              in productVariants) ...{
            if (productVariant
                .variantList
                .isNotEmpty) ...{
              VariantGeneratorChild(
                productVariant: productVariant,
              ),
            },
          },
        ],
      ),
    );
  }
}

class VariantGeneratorChild extends StatelessWidget {
  ProductVariantEntity productVariant;
  VariantGeneratorChild({
    super.key,
    required this.productVariant,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 44,
        right: 44,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productVariant.variantType.title,
            style: AppTextStyle.sb.copyWith(
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 10),

          if (productVariant.variantType.type ==
              VariantTypeEnum.COLOR) ...{
            ColorVariantList(
              variantList: productVariant.variantList,
            ),
          },

          if (productVariant.variantType.type ==
              VariantTypeEnum.STORAGE) ...{
            StorageVariantList(
              variantList: productVariant.variantList,
            ),
          },
        ],
      ),
    );
  }
}

class ColorVariantList extends StatefulWidget {
  List<VariantEntity> variantList;

  ColorVariantList({
    super.key,
    required this.variantList,
  });

  @override
  State<ColorVariantList> createState() =>
      _ColorVariantListState();
}

class _ColorVariantListState
    extends State<ColorVariantList> {
  int selectedColorItem = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.variantList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedColorItem = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
                border: selectedColorItem == index
                    ? Border.all(
                        width: 1.5,
                        color: AppColors.blueColor,
                        strokeAlign: BorderSide
                            .strokeAlignOutside,
                      )
                    : Border.all(
                        style: BorderStyle.none,
                      ),
              ),
              child: Center(
                child: Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    color: widget
                        .variantList[index]
                        .value
                        .toColor(),
                    borderRadius:
                        const BorderRadius.all(
                          Radius.circular(8),
                        ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class StorageVariantList extends StatefulWidget {
  List<VariantEntity> variantList;
  StorageVariantList({
    super.key,
    required this.variantList,
  });

  @override
  State<StorageVariantList> createState() =>
      _StorageVariantListState();
}

class _StorageVariantListState
    extends State<StorageVariantList> {
  int selectedStorageItem = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.variantList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedStorageItem = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              width: 74,
              height: 26,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,

                border: selectedStorageItem == index
                    ? BoxBorder.all(
                        width: 1.5,
                        color: AppColors.blueColor,
                      )
                    : BoxBorder.all(
                        width: 0.5,
                        color: AppColors.grayColor,
                      ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Center(
                child: Text(
                  widget.variantList[index].value,
                  style: AppTextStyle.sb.copyWith(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductGalleryWidget extends StatefulWidget {
  List<ProductImageEntity> productImageList;
  int selectedItem = 0;
  String thumbnail;
  ProductGalleryWidget({
    super.key,
    required this.productImageList,
    required this.thumbnail,
  });

  @override
  State<ProductGalleryWidget> createState() =>
      _ProductGalleryWidgetState();
}

class _ProductGalleryWidgetState
    extends State<ProductGalleryWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 44,
        ),
        child: Card(
          elevation: 6,
          shadowColor: AppColors.grayLigthColor,

          color: AppColors.whiteColor,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Stack(
                  alignment:
                      AlignmentDirectional.topCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(
                        18.0,
                      ),
                      child: SizedBox(
                        width: 150,
                        height: 150,
                        child: Center(
                          child: CachedImage(
                            imageUrl:
                                (widget
                                    .productImageList
                                    .isEmpty)
                                ? widget.thumbnail
                                : widget
                                      .productImageList[widget
                                          .selectedItem]
                                      .imageUrl,
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      top: 10,
                      left: 10,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '4.6',
                            style: AppTextStyle.sm
                                .copyWith(
                                  fontSize: 12,
                                ),
                          ),
                          const SizedBox(width: 2),

                          Image.asset(
                            'assets/images/icon_star.png',
                          ),
                        ],
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

              if (widget
                  .productImageList
                  .isNotEmpty) ...{
                Padding(
                  padding: const EdgeInsets.only(
                    right: 30,
                    left: 30,
                    bottom: 30,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment:
                        MainAxisAlignment.center,

                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 70,
                          child: Align(
                            alignment:
                                Alignment.center,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection:
                                  Axis.horizontal,
                              itemCount: widget
                                  .productImageList
                                  .length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      widget.selectedItem =
                                          index;
                                    });
                                  },
                                  child: ProductImageGallery(
                                    productImage: widget
                                        .productImageList[index],
                                    productIndex:
                                        index,
                                    selectedItem: widget
                                        .selectedItem,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              },
            ],
          ),
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
            borderRadius: const BorderRadius.all(
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
                  borderRadius: const BorderRadius.all(
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
  ProductImageEntity productImage;
  int productIndex;
  int selectedItem;
  ProductImageGallery({
    super.key,
    required this.productImage,
    required this.productIndex,
    required this.selectedItem,
  });

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
          border: productIndex == selectedItem
              ? Border.all(
                  width: 2,
                  color: AppColors.blueColor,
                )
              : BoxBorder.all(
                  width: 1,
                  color: AppColors.grayColor,
                ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Center(
            child: CachedImage(
              imageUrl: productImage.imageUrl,
            ),
          ),
        ),
      ),
    );
  }
}
