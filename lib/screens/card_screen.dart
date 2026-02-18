import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shop_application/bloc/basket/basket_bloc.dart';
import 'package:shop_application/bloc/basket/basket_event.dart';
import 'package:shop_application/bloc/basket/basket_state.dart';
import 'package:shop_application/core/theme/app_colors.dart';
import 'package:shop_application/core/theme/app_text_style.dart';
import 'package:shop_application/core/utils/extentions/number_extensions.dart';
import 'package:shop_application/domain/entities/card_item_entity.dart';
import 'package:shop_application/widgets/cached_image.dart';
import 'package:shop_application/widgets/custom_error_widget.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() =>
      _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  void initState() {
    super.initState();

    context.read<BasketBloc>().add(
      BasketFetchFromHiveEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundScreenColor,
      body: SafeArea(
        child: BlocBuilder<BasketBloc, BasketState>(
          builder: (context, state) {
            return _buildByState(context, state);
          },
        ),
      ),
    );
  }
}

Widget _buildByState(
  BuildContext context,
  BasketState state,
) {
  switch (state) {
    case BasketInitState():
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

    case BasketLoadingState():
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

    case BasketDataFeachedState():
      return state.cardItemList.fold(
        (errorMessage) {
          return CustomErrorWidget(
            context: context,
            message: errorMessage,
          );
        },
        (cardItemList) {
          return (cardItemList.isEmpty)
              ? Center(
                  child: Text(
                    'سبد خرید شما خالی است',
                    style: AppTextStyle.sb.copyWith(
                      fontSize: 16,
                      color: AppColors.blackColor,
                    ),
                  ),
                )
              : CardScreenContent(
                  cardItemList: cardItemList,
                  basketFinalPrice: state.finalPrice,
                );
        },
      );

    default:
      {
        return const SizedBox.shrink();
      }
  }
}

class CardScreenContent extends StatelessWidget {
  final List<CardItemEntity> cardItemList;
  final int basketFinalPrice;

  const CardScreenContent({
    super.key,
    required this.cardItemList,
    required this.basketFinalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CustomScrollView(
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
                          'سبد خرید',
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

            SliverList(
              delegate: SliverChildBuilderDelegate((
                context,
                index,
              ) {
                return CartItem(
                  cardItem: cardItemList[index],
                );
              }, childCount: cardItemList.length),
            ),
            const SliverPadding(
              padding: EdgeInsets.only(bottom: 93),
            ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.only(
            bottom: 20,
            left: 44,
            right: 44,
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 53,
            child: ElevatedButton(
              onPressed: () {
                context.read<BasketBloc>().add(
                  BasketPaymentInitEvent(),
                );
                context.read<BasketBloc>().add(
                  BasketPaymentRequestEvent(),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.greenColor,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                ),
              ),
              child: Text(
                '${basketFinalPrice.toSeparated()} تومان',
                style: AppTextStyle.sb.copyWith(
                  fontSize: 16,
                  color: AppColors.whiteColor,
                ),
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CartItem extends StatelessWidget {
  final CardItemEntity cardItem;
  const CartItem({super.key, required this.cardItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,

      margin: const EdgeInsets.only(
        left: 44,
        top: 20,
        right: 44,
      ),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.grayColor,
            blurRadius: 20,
            spreadRadius: -18,
            offset: Offset(0, 10),
          ),
        ],

        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        color: AppColors.whiteColor,
      ),
      child: Column(
        children: [
          Row(
            /*       crossAxisAlignment:
                CrossAxisAlignment.stretch, */
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 8,
                    left: 20,
                    top: 17,
                  ),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.start,
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [
                        Text(
                          cardItem.name,
                          overflow:
                              TextOverflow.ellipsis,
                          style: AppTextStyle.sb
                              .copyWith(
                                fontSize: 16,
                                color: AppColors
                                    .blackColor,
                              ),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          'گارانتی 18 ماه مدیا پردازش',
                          overflow:
                              TextOverflow.ellipsis,
                          style: AppTextStyle.sm
                              .copyWith(
                                fontSize: 10,
                                color: AppColors
                                    .grayColor,
                              ),
                        ),

                        const SizedBox(height: 10),

                        Wrap(
                          crossAxisAlignment:
                              WrapCrossAlignment
                                  .center,
                          alignment: WrapAlignment
                              .spaceEvenly,
                          runAlignment:
                              WrapAlignment.center,
                          children: [
                            Text(
                              cardItem.price
                                  .toSeparated(),
                              overflow: TextOverflow
                                  .ellipsis,
                              style: AppTextStyle.sm
                                  .copyWith(
                                    fontSize: 12,
                                    color: AppColors
                                        .grayColor,
                                  ),
                            ),
                            const SizedBox(width: 5),

                            Text(
                              'تومان',
                              overflow: TextOverflow
                                  .ellipsis,
                              style: AppTextStyle.sm
                                  .copyWith(
                                    fontSize: 10,
                                    color: AppColors
                                        .grayColor,
                                  ),
                            ),

                            const SizedBox(width: 5),
                            Container(
                              decoration:
                                  const BoxDecoration(
                                    color: AppColors
                                        .redColor,
                                    borderRadius:
                                        BorderRadius.all(
                                          Radius.circular(
                                            7.5,
                                          ),
                                        ),
                                  ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 1,
                                    ),
                                child: Text(
                                  cardItem
                                      .discountPercent
                                      .toPercent(),
                                  style: AppTextStyle
                                      .sb
                                      .copyWith(
                                        fontSize: 10,
                                        color: AppColors
                                            .whiteColor,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Wrap(
                          runSpacing: 10,
                          spacing: 10,
                          children: [
                            OptionChip(),
                            OptionChip(),
                            OptionChip(),
                            OptionChip(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width:
                      MediaQuery.of(
                        context,
                      ).size.width *
                      0.20,
                  child: AspectRatio(
                    aspectRatio: 1 / 2,
                    child: CachedImage(
                      imageUrl: cardItem.thumbnail,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            child: DottedLine(
              lineThickness: 2,
              dashColor: AppColors.grayLigthColor,
              lineLength: double.infinity,
              dashLength: 6,
              dashGapLength: 2,
              dashRadius: 10,
            ),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              children: [
                Text(
                  cardItem.realPrice.toSeparated(),
                  style: AppTextStyle.sm.copyWith(
                    fontSize: 16,
                    color: AppColors.blackColor,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  'تومان',
                  style: AppTextStyle.sm.copyWith(
                    fontSize: 12,
                    color: AppColors.blackColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class OptionChip extends StatelessWidget {
  const OptionChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: BoxBorder.all(
          width: 1,
          color: AppColors.grayChipBorder,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 5,
              bottom: 5,
              right: 10,
              left: 10,
            ),
            child: Text(
              '1 ترابایت',
              style: AppTextStyle.sm.copyWith(
                fontSize: 10,
                color: AppColors.grayColor,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
              top: 5,
              bottom: 5,
              left: 10,
              right: 10,
            ),
            child: Image.asset(
              'assets/images/icon_options.png',
            ),
          ),
        ],
      ),
    );
  }
}
