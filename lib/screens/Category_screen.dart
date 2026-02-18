import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shop_application/bloc/category/category_bloc.dart';
import 'package:shop_application/bloc/category/category_event.dart';
import 'package:shop_application/bloc/category/category_state.dart';
import 'package:shop_application/core/theme/app_colors.dart';
import 'package:shop_application/core/theme/app_text_style.dart';
import 'package:shop_application/domain/entities/category_entity.dart';
import 'package:shop_application/widgets/cached_image.dart';
import 'package:shop_application/widgets/custom_error_widget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() =>
      _CategoryScreenState();
}

class _CategoryScreenState
    extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryBloc>().add(
      CategoryRequestEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundScreenColor,
      body: SafeArea(
        child:
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                return _buildbyState(context, state);
              },
            ),
      ),
    );
  }

  Widget _buildbyState(
    BuildContext context,
    CategoryState state,
  ) {
    switch (state) {
      case CategoryInitiateState():
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,

          child: const Center(
            child: SpinKitCircle(
              color: AppColors.blueColor,
              size: 50.0,
            ),
          ),
        );

      case CategoryLoadingState():
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: const Center(
            child: SpinKitCircle(
              color: AppColors.blueColor,
              size: 50.0,
            ),
          ),
        );

      case CategoryResponseState():
        return state.response.fold(
          (errorMessage) {
            return CustomErrorWidget(
              context: context,
              message: errorMessage,
            );
          },
          (categoryList) {
            return CategoryContent(
              categoryList: categoryList,
            );
          },
        );

      default:
        {
          return const SizedBox.shrink();
        }
    }
  }
}

class CategoryContent extends StatelessWidget {
  final List<CategoryEntity> categoryList;
  const CategoryContent({
    super.key,
    required this.categoryList,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<CategoryBloc>().add(
          CategoryRequestEvent(),
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
                        'دسته بندی',
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

          ListCategory(categoryList: categoryList),
        ],
      ),
    );
  }
}

class ListCategory extends StatelessWidget {
  final List<CategoryEntity>? categoryList;
  const ListCategory({
    super.key,
    required this.categoryList,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 44,
        vertical: 32,
      ),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate((
          context,
          index,
        ) {
          return Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: CachedImage(
              imageUrl:
                  categoryList?[index].thumbnail ?? '',
            ),
          );
        }, childCount: categoryList?.length ?? 0),

        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
      ),
    );
  }
}
