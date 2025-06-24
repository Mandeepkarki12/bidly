import 'package:bidly/core/services/shared_prefrences.dart';
import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:bidly/core/utils/app_apis.dart';
import 'package:bidly/core/widgets/custom_appbar/custom_mobile_appbar.dart';
import 'package:bidly/core/widgets/custom_footer/custom_tablet_footer.dart';
import 'package:bidly/core/widgets/custom_rounded_button.dart';
import 'package:bidly/features/home_screen/presentation/bloc/home_screen_bloc.dart';
import 'package:bidly/features/home_screen/presentation/widgets/desktop_widgets/desktop_browse_categories.dart';

import 'package:bidly/features/home_screen/presentation/widgets/mobile_widgets/mobile_drawer.dart';
import 'package:bidly/features/home_screen/presentation/widgets/tablet_widgets/tablet_auction_widget.dart';
import 'package:bidly/features/home_screen/presentation/widgets/tablet_widgets/tablet_discover_more_aution.dart';
import 'package:bidly/features/home_screen/presentation/widgets/tablet_widgets/tablet_shimmer.dart';
import 'package:bidly/features/home_screen/presentation/widgets/tablet_widgets/tablet_trending_auction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:octo_image/octo_image.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TabletHomeScreen extends StatefulWidget {
  const TabletHomeScreen({super.key});

  @override
  State<TabletHomeScreen> createState() => _TabletHomeScreenState();
}

class _TabletHomeScreenState extends State<TabletHomeScreen> {
  final SecureStorageService secureStorageService = SecureStorageService();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final RefreshController _refreshController = RefreshController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomMobileAppBar(
        onMenuTap: () {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _scaffoldKey.currentState?.openEndDrawer();
          });
        },
      ),
      endDrawer: const MobileDrawer(),
      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: () {
          context.read<HomeScreenBloc>().add(GetHomeDataEvent());
          _refreshController.refreshCompleted();
        },
        enablePullDown: true,
        header: const WaterDropHeader(),
        child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
          builder: (context, state) {
            if (state is HomeScreenInitial) {
              context.read<HomeScreenBloc>().add(GetHomeDataEvent());
            }
            if (state is HomeScreenLoading) {
              return TabletShimmer(width: width);
            }
            if (state is HomeScreenError) {
              return Center(
                child: Text(
                  'Error: ${state.message}',
                  style: const AppTextStyles().bodyText,
                ),
              );
            }
            if (state is HomeScreenLoaded) {
              final homeData = state.homeData;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 520,
                                width: width * 0.5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Discover the best deals for you',
                                        style:
                                            const AppTextStyles().h2WorkSans),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'Buy and sell digital assets on Bidly, the leading platform for buying and selling digital assets.',
                                      style: const AppTextStyles()
                                          .bodyText
                                          .copyWith(fontSize: 22),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    CustomRoundedButton(
                                      onTap: () => {},
                                      height: 60,
                                      width: 244,
                                      color: AppColors.primaryButton,
                                      child: Center(
                                        child: Text(
                                          'Get Started',
                                          style: const AppTextStyles().bodyText,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Row(
                                      children: [
                                        Text('240k+',
                                            style: const AppTextStyles()
                                                .h4SpaceMono),
                                        SizedBox(
                                          width: width * 0.05,
                                        ),
                                        Text('100k+',
                                            style: const AppTextStyles()
                                                .h4SpaceMono),
                                        SizedBox(
                                          width: width * 0.05,
                                        ),
                                        Text('200k+',
                                            style: const AppTextStyles()
                                                .h4SpaceMono),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text('Total sales',
                                            style: const AppTextStyles()
                                                .h5WorkSans),
                                        SizedBox(
                                          width: width * 0.026,
                                        ),
                                        Text('Auctions',
                                            style: const AppTextStyles()
                                                .h5WorkSans),
                                        SizedBox(
                                          width: width * 0.05,
                                        ),
                                        Text('Sellers',
                                            style: const AppTextStyles()
                                                .h5WorkSans),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: width * 0.05,
                              ),
                              // top seller Account
                              Container(
                                height: 400,
                                width: width * 0.32,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.backGroundSecondary),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                      ),
                                      height: 300,
                                      width: double.infinity,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        child: OctoImage(
                                          image: NetworkImage(
                                            homeData.data!.topUser
                                                    ?.profileImage ??
                                                'https://images.pexels.com/photos/3768163/pexels-photo-3768163.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                                          ),
                                          fit: BoxFit.cover,
                                          placeholderBuilder: (context) =>
                                              const CupertinoActivityIndicator(),
                                          errorBuilder:
                                              (context, error, stackTrace) =>
                                                  const Center(
                                            child: Icon(
                                              Icons.error_outline_outlined,
                                              color: Colors.red,
                                              size: 24,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Top Seller',
                                            style: const AppTextStyles()
                                                .h5WorkSans,
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 12,
                                                backgroundColor: AppColors
                                                    .backGroundTertiary,
                                                child: ClipOval(
                                                  child: OctoImage(
                                                    image: NetworkImage(
                                                      homeData.data!.topUser
                                                              ?.profileImage ??
                                                          'https://images.pexels.com/photos/3768163/pexels-photo-3768163.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                                                    ),
                                                    width: 24,
                                                    height: 24,
                                                    fit: BoxFit.cover,
                                                    placeholderBuilder: (context) =>
                                                        const CupertinoActivityIndicator(),
                                                    errorBuilder: (context,
                                                            error,
                                                            stackTrace) =>
                                                        const Icon(
                                                      Icons
                                                          .error_outline_outlined,
                                                      color: Colors.red,
                                                      size: 24,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                homeData.data!.topUser
                                                        ?.userName ??
                                                    'John Doe',
                                                style: const AppTextStyles()
                                                    .baseBodyWorkSans,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Text(
                            'Trending Auctions',
                            style: const AppTextStyles().h3WorkSans,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Checkout our top auctions',
                            style: const AppTextStyles().baseBodyWorkSans,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            height: 420,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: homeData.data!.trending.length,
                                itemBuilder: (context, index) {
                                  return TabletTrendingAuction(
                                    imageUrl:
                                        '$baseUrl${homeData.data!.trending[index].productImage}',
                                    title: homeData.data!.trending[index].title,
                                    sellerImageUrl: homeData.data!
                                        .trending[index].sellerProfileImage,
                                    sellerName: homeData
                                        .data!.trending[index].sellerName,
                                  );
                                }),
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                          SizedBox(
                            height: 1140,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Browse categories',
                                  style: const AppTextStyles().h3WorkSans,
                                ),
                                const SizedBox(height: 30),
                                SizedBox(
                                  width: double.infinity,
                                  height: (316 * 3) + (20 * 2),
                                  child: GridView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 20,
                                      crossAxisSpacing: 30,
                                      mainAxisExtent: 316,
                                    ),
                                    itemCount: homeData.data!.categories.length,
                                    itemBuilder: (context, index) {
                                      return DesktopBrowseCategories(
                                        title: homeData
                                            .data!.categories[index].name,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            height: 780,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Discover More Auctions',
                                  style: const AppTextStyles().h3WorkSans,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Explore new trending auctions',
                                      style: const AppTextStyles().bodyText,
                                    ),
                                    CustomRoundedButton(
                                        onTap: () {},
                                        height: 60,
                                        width: 187,
                                        shouldFill: false,
                                        color: AppColors.primaryButton,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.remove_red_eye_outlined,
                                              size: 20,
                                              color: AppColors.primaryButton,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'See All',
                                              style: const AppTextStyles()
                                                  .bodyText
                                                  .copyWith(fontSize: 16),
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                SizedBox(
                                  height: 480,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        homeData.data!.allProducts.length,
                                    itemBuilder: (context, index) {
                                      return TabletDiscoverMoreAution(
                                        imageUrl:
                                            '$baseUrl${homeData.data!.allProducts[index].productImage}',
                                        title: homeData
                                            .data!.allProducts[index].title,
                                        sellerImageUrl: homeData
                                            .data!
                                            .allProducts[index]
                                            .sellerProfileImage,
                                        sellerName: homeData.data!
                                            .allProducts[index].sellerName,
                                        price: homeData.data!.allProducts[index]
                                            .minimumPrice
                                            .toString(),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TabletAuctionWidget(
                            imageUrl:
                                '$baseUrl${homeData.data!.topOne?.productImage}',
                            title: homeData.data!.topOne?.title,
                            sellerName: homeData.data!.topOne?.sellerName,
                            sellerImageUrl:
                                homeData.data!.topOne?.sellerProfileImage,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const CustomTabletFooter(),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
