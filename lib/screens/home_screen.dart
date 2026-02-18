// ignore_for_file: unused_element_parameter

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shop_application/bloc/home/home_bloc.dart';
import 'package:shop_application/bloc/home/home_event.dart';
import 'package:shop_application/bloc/home/home_state.dart';
import 'package:shop_application/core/theme/app_colors.dart';
import 'package:shop_application/core/theme/app_text_style.dart';
import 'package:shop_application/domain/entities/banner_entity.dart';
import 'package:shop_application/domain/entities/category_entity.dart';
import 'package:shop_application/domain/entities/product_entity.dart';
import 'package:shop_application/widgets/banner_slider.dart';
import 'package:shop_application/widgets/category_icon_item_chip.dart';
import 'package:shop_application/widgets/custom_error_widget.dart';
import 'package:shop_application/widgets/product_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(
      HomeInitializeEvent(),
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
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return _buildByState(state);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildByState(HomeState state) {
    switch (state) {
      case HomeInitiateState():
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

      case HomeLoadingState():
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

      case HomeRequestSuccessState():
        final bannerResult = state.bannerList;
        final categoryResult = state.categoryList;
        final productResult = state.productList;
        final bestSellerProductResult =
            state.bestSellerProductList;
        final hotestProductResult =
            state.hotestProductList;

        if (bannerResult.isLeft() &&
            categoryResult.isLeft() &&
            productResult.isLeft()) {
          return CustomErrorWidget(
            context: context,
            message: 'خطا در دریافت اطلاعات',
          );
        } else if (bannerResult.isLeft()) {
          return CustomErrorWidget(
            context: context,
            message: bannerResult.fold(
              (error) => error,
              (_) => '',
            ),
          );
        } else if (categoryResult.isLeft()) {
          return CustomErrorWidget(
            context: context,
            message: bannerResult.fold(
              (error) => error,
              (_) => '',
            ),
          );
        } else if (productResult.isLeft()) {
          return CustomErrorWidget(
            context: context,
            message: bannerResult.fold(
              (error) => error,
              (_) => '',
            ),
          );
        } else if (bestSellerProductResult.isLeft()) {
          return CustomErrorWidget(
            context: context,
            message: bannerResult.fold(
              (error) => error,
              (_) => '',
            ),
          );
        } else if (hotestProductResult.isLeft()) {
          return CustomErrorWidget(
            context: context,
            message: bannerResult.fold(
              (error) => error,
              (_) => '',
            ),
          );
        } else {
          return HomeScreenContent(
            bannerList: bannerResult.getOrElse(
              () => [],
            ),

            categoryList: categoryResult.getOrElse(
              () => [],
            ),
            productList: productResult.getOrElse(
              () => [],
            ),

            bestSellerProductList:
                bestSellerProductResult.getOrElse(
                  () => [],
                ),

            hotestProductList: hotestProductResult
                .getOrElse(() => []),
          );
        }

      default:
        {
          return const SizedBox.shrink();
        }
    }
  }
}

class HomeScreenContent extends StatelessWidget {
  final List<BannerEntity> bannerList;
  final List<CategoryEntity> categoryList;
  final List<ProductEntity> productList;
  final List<ProductEntity> bestSellerProductList;
  final List<ProductEntity> hotestProductList;

  const HomeScreenContent({
    super.key,
    required this.bannerList,
    required this.categoryList,
    required this.productList,
    required this.bestSellerProductList,
    required this.hotestProductList,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<HomeBloc>().add(
          HomeInitializeEvent(),
        );
      },
      child: CustomScrollView(
        slivers: [
          const _SearchBox(),

          _BannerSection(bannerList: bannerList),

          const _CategoryTitle(),

          _CategoryList(categoryList: categoryList),

          const _BestSellerTitle(),

          _BestSellerProductList(
            bestSellerProductList:
                bestSellerProductList,
          ),

          const _MostViewedTitle(),

          _MostViewedProductList(
            hotestProductList: hotestProductList,
          ),
        ],
      ),
    );
  }
}

class _MostViewedProductList extends StatelessWidget {
  final List<ProductEntity> hotestProductList;
  const _MostViewedProductList({
    super.key,
    required this.hotestProductList,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: SizedBox(
          height: 240,
          child: Padding(
            padding: const EdgeInsets.only(right: 44),
            child: ListView.builder(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              itemCount: hotestProductList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 20,
                  ),
                  child: ProductItem(
                    product: hotestProductList[index],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _MostViewedTitle extends StatelessWidget {
  const _MostViewedTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          right: 44,
          left: 44,
          top: 32,
        ),
        child: Row(
          children: [
            Text(
              'پر بازدید ترین ها',
              style: AppTextStyle.sb.copyWith(
                color: AppColors.grayColor,
                fontSize: 12,
              ),
            ),
            const Spacer(),

            Text(
              'مشاهده همه',
              style: AppTextStyle.sb.copyWith(
                color: AppColors.blueColor,
                fontSize: 12,
              ),
            ),
            const SizedBox(width: 10),

            Image.asset(
              'assets/images/icon_left_product_list.png',
            ),
          ],
        ),
      ),
    );
  }
}

class _BestSellerProductList extends StatelessWidget {
  final List<ProductEntity> bestSellerProductList;
  const _BestSellerProductList({
    super.key,
    required this.bestSellerProductList,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 220,
        child: Padding(
          padding: const EdgeInsets.only(right: 44),
          child: ListView.builder(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemCount: bestSellerProductList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: ProductItem(
                  product:
                      bestSellerProductList[index],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _BestSellerTitle extends StatelessWidget {
  const _BestSellerTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          right: 44,
          left: 44,
          top: 32,
          bottom: 20,
        ),
        child: Row(
          children: [
            Text(
              'پر فروش ترین ها',
              style: AppTextStyle.sb.copyWith(
                color: AppColors.grayColor,
                fontSize: 12,
              ),
            ),
            const Spacer(),

            Text(
              'مشاهده همه',
              style: AppTextStyle.sb.copyWith(
                color: AppColors.blueColor,
                fontSize: 12,
              ),
            ),
            const SizedBox(width: 10),
            Image.asset(
              'assets/images/icon_left_product_list.png',
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  final List<CategoryEntity> categoryList;
  const _CategoryList({
    super.key,
    required this.categoryList,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(right: 44),
        child: SizedBox(
          height: 103,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                ),
                child: CategoryIconItemChip(
                  category: categoryList[index],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _CategoryTitle extends StatelessWidget {
  const _CategoryTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          right: 44,
          top: 32,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
    );
  }
}

class _BannerSection extends StatelessWidget {
  final List<BannerEntity> bannerList;
  const _BannerSection({
    super.key,
    required this.bannerList,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 32),
        child: BannerSlider(
          bannerEntityList: bannerList,
        ),
      ),
    );
  }
}

class _SearchBox extends StatelessWidget {
  const _SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
                'assets/images/icon_search.png',
              ),

              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'جستجوی محصولات',
                  textAlign: TextAlign.start,
                  style: AppTextStyle.sb.copyWith(
                    fontSize: 16,
                    color: AppColors.grayColor,
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
    );
  }
}
