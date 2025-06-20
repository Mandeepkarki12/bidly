import 'package:bidly/core/routes/route_names.dart';
import 'package:bidly/core/services/shared_prefrences.dart';
import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:bidly/core/widgets/custom_appbar/custom_mobile_appbar.dart';
import 'package:bidly/core/widgets/custom_footer/custom_mobile_footer.dart';
import 'package:bidly/core/widgets/custom_rounded_button.dart';
import 'package:bidly/core/widgets/custom_snackbar.dart';
import 'package:bidly/features/auth_screen/presentation/bloc/auth_screen_bloc.dart';
import 'package:bidly/features/home_screen/presentation/widgets/mobile_widgets/mobile_auction_widget.dart';
import 'package:bidly/features/home_screen/presentation/widgets/mobile_widgets/mobile_browse_categories.dart';
import 'package:bidly/features/home_screen/presentation/widgets/mobile_widgets/mobile_discover_more_auction.dart';
import 'package:bidly/features/home_screen/presentation/widgets/mobile_widgets/mobile_trending_auction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:octo_image/octo_image.dart';

class MobileHomeScreen extends StatefulWidget {
  const MobileHomeScreen({super.key});

  @override
  State<MobileHomeScreen> createState() => _MobileHomeScreenState();
}

class _MobileHomeScreenState extends State<MobileHomeScreen> {
  final SecureStorageService secureStorageService = SecureStorageService();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const CustomMobileAppBar(),
      body: BlocListener<AuthScreenBloc, AuthScreenState>(
        listener: (context, state) {
          if (state is AuthScreenFailure) {
            showCustomSnackBar(context,
                message: state.message, type: SnackBarType.error);
          }
          if (state is AuthScreenSucess) {
            showCustomSnackBar(context,
                message: 'Logged out successfully', type: SnackBarType.success);
            Navigator.pushReplacementNamed(context, RouteNames.loginScreen);
          }
        },
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.1, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Discover the best deals for you',
                  textAlign: TextAlign.center,
                  style: const AppTextStyles().h3WorkSans),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Buy and sell digital assets on Bidly, the leading platform for buying and selling digital assets.',
                textAlign: TextAlign.center,
                style: const AppTextStyles().bodyText.copyWith(fontSize: 21),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                height: 315,
                width: width,
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
                      height: 220,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        child: OctoImage(
                          image: const NetworkImage(
                            'https://images.pexels.com/photos/3768163/pexels-photo-3768163.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                          ),
                          fit: BoxFit.cover,
                          placeholderBuilder: (context) =>
                              const CupertinoActivityIndicator(),
                          errorBuilder: (context, error, stackTrace) =>
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Top Seller',
                            style: const AppTextStyles().h5WorkSans,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 12,
                                backgroundColor: AppColors.backGroundTertiary,
                                child: ClipOval(
                                  child: OctoImage(
                                    image: const NetworkImage(
                                      'https://images.pexels.com/photos/3768163/pexels-photo-3768163.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                                    ),
                                    width: 24,
                                    height: 24,
                                    fit: BoxFit.cover,
                                    placeholderBuilder: (context) =>
                                        const CupertinoActivityIndicator(),
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Icon(
                                      Icons.error_outline_outlined,
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
                                'John Doe',
                                style: const AppTextStyles().baseBodyWorkSans,
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomRoundedButton(
                onTap: () => {
                  // deleting the userid from shared preferences

                  context.read<AuthScreenBloc>().add(AuthScreenSignOutEvent())
                },
                height: 60,
                width: double.infinity,
                color: AppColors.primaryButton,
                child: Center(
                  child: Text(
                    'Get Started',
                    style: const AppTextStyles().bodyText,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('200k+',
                              style: const AppTextStyles().h5SpaceMono),
                          const SizedBox(
                            height: 5,
                          ),
                          Text('Auctions',
                              style: const AppTextStyles().baseBodyWorkSans)
                        ]),
                  ),
                  SizedBox(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('100k+',
                              style: const AppTextStyles().h5SpaceMono),
                          const SizedBox(
                            height: 5,
                          ),
                          Text('Users',
                              style: const AppTextStyles().baseBodyWorkSans)
                        ]),
                  ),
                  SizedBox(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('50k+',
                              style: const AppTextStyles().h5SpaceMono),
                          const SizedBox(
                            height: 5,
                          ),
                          Text('Bids',
                              style: const AppTextStyles().baseBodyWorkSans)
                        ]),
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              Text(
                'Trending Auctions',
                style: const AppTextStyles().h4WorkSans,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Checkout our top auctions',
                style: const AppTextStyles().baseBodyWorkSans,
              ),
              const SizedBox(
                height: 40,
              ),
              const MobileTrendingAuction(),
              const SizedBox(
                height: 80,
              ),
              SizedBox(
                height: 946,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Browse categories',
                      style: const AppTextStyles().h4WorkSans,
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 870,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 30,
                          mainAxisExtent: 200,
                        ),
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          return const MobileBrowseCategories();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Text(
                'Discover More ',
                style: const AppTextStyles().h4WorkSans,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Explore new trending auctions',
                style: const AppTextStyles().baseBodyWorkSans,
              ),
              const SizedBox(
                height: 40,
              ),
              const MobileDiscoverMoreAution(),
              const SizedBox(
                height: 20,
              ),
              const MobileDiscoverMoreAution(),
              const SizedBox(
                height: 20,
              ),
              const MobileDiscoverMoreAution(),
              const SizedBox(
                height: 40,
              ),
              CustomRoundedButton(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.profileScreen);
                  },
                  height: 60,
                  width: width,
                  shouldFill: false,
                  color: AppColors.primaryButton,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                  )),
              const SizedBox(
                height: 80,
              ),
              const MobileAuctionWidget(),
              const SizedBox(
                height: 80,
              ),
              const CustomMobileFooter()
            ],
          ),
        )),
      ),
    );
  }
}
