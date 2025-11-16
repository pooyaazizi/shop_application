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
          child: Center(
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
          child: Center(
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
        } else {
          return HomeContent(
            bannerList: bannerResult.getOrElse(
              () => [],
            ),

            categoryList: categoryResult.getOrElse(
              () => [],
            ),
            productList: productResult.getOrElse(
              () => [],
            ),
          );
        }

      default:
        {
          return const SizedBox.shrink();
        }
    }
  }
}

class HomeContent extends StatelessWidget {
  List<BannerEntity> bannerList;
  List<CategoryEntity> categoryList;
  List<ProductEntity> productList;
  HomeContent({
    super.key,
    required this.bannerList,
    required this.categoryList,
    required this.productList,
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
          _getSearchBox(),

          _getBanners(bannerList: bannerList),

          _getCategoryListTitle(),

          _getCategoryList(categoryList: categoryList),

          _getBestSellerTitle(),

          _getBestSellerProducts(),

          _getMostViewedTitle(),

          _getMostViewedProducts(),
        ],
      ),
    );
  }
}

class _getMostViewedProducts extends StatelessWidget {
  const _getMostViewedProducts({super.key});

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
    );
  }
}

class _getMostViewedTitle extends StatelessWidget {
  const _getMostViewedTitle({super.key});

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

class _getBestSellerProducts extends StatelessWidget {
  const _getBestSellerProducts({super.key});

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
            itemCount: 6,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.only(left: 20),
                child: ProductItem(),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _getBestSellerTitle extends StatelessWidget {
  const _getBestSellerTitle({super.key});

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

class _getCategoryList extends StatelessWidget {
  List<CategoryEntity> categoryList;
  _getCategoryList({
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
                padding: EdgeInsets.only(
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

class _getCategoryListTitle extends StatelessWidget {
  const _getCategoryListTitle({super.key});

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

class _getBanners extends StatelessWidget {
  List<BannerEntity> bannerList;
  _getBanners({super.key, required this.bannerList});

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

class _getSearchBox extends StatelessWidget {
  const _getSearchBox({super.key});

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
