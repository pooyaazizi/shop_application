import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shop_application/bloc/category_product/category_product_bloc.dart';
import 'package:shop_application/bloc/category_product/category_product_event.dart';
import 'package:shop_application/bloc/category_product/category_product_state.dart';
import 'package:shop_application/core/theme/app_colors.dart';
import 'package:shop_application/core/theme/app_text_style.dart';
import 'package:shop_application/domain/entities/category_entity.dart';
import 'package:shop_application/domain/entities/product_entity.dart';
import 'package:shop_application/widgets/custom_error_widget.dart';
import 'package:shop_application/widgets/product_item.dart';

class ProductListScreen extends StatefulWidget {
  CategoryEntity category;
  ProductListScreen({
    super.key,
    required this.category,
  });

  @override
  State<ProductListScreen> createState() =>
      _ProductListScreenState();
}

class _ProductListScreenState
    extends State<ProductListScreen> {
  @override
  void initState() {
    BlocProvider.of<CategoryProductBloc>(context).add(
      CategoryProductInitializeEvent(
        widget.category.id,
      ),
    );
    super.initState();
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
                CategoryProductBloc,
                CategoryProductState
              >(
                builder: (context, state) {
                  return _buildByState(
                    state,
                    context,
                    widget.category,
                  );
                },
              ),
        ),
      ),
    );
  }
}

Widget _buildByState(
  CategoryProductState state,
  BuildContext context,
  CategoryEntity category,
) {
  switch (state) {
    case CategoryProductInitializeState():
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

    case CategoryProductLoadingState():
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

    case CategoryProductResponseState():
      final productListResult = state.productList;
      if (productListResult.isLeft()) {
        return CustomErrorWidget(
          context: context,
          message: productListResult.fold(
            (errorMessage) => errorMessage,
            (_) => '',
          ),
        );
      } else {
        return ProductListContent(
          productList: productListResult.getOrElse(
            () => [],
          ),
          category: category,
        );
      }

    default:
      return const SizedBox.shrink();
  }
}

class ProductListContent extends StatelessWidget {
  CategoryEntity category;
  List<ProductEntity> productList;
  ProductListContent({
    super.key,
    required this.category,
    required this.productList,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<CategoryProductBloc>(
          context,
        ).add(
          CategoryProductInitializeEvent(category.id),
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
                      'assets/images/icon_apple_blue.png',
                    ),

                    Expanded(
                      child: Text(
                        category.title,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.sb
                            .copyWith(
                              fontSize: 16,
                              color:
                                  AppColors.blueColor,
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
              }, childCount: productList.length),
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
    );
  }
}
