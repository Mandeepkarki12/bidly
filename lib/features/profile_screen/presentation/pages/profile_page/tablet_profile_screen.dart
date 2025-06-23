import 'package:bidly/core/services/shared_prefrences.dart';
import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:bidly/core/widgets/custom_appbar/custom_mobile_appbar.dart';
import 'package:bidly/core/widgets/custom_footer/custom_tablet_footer.dart';
import 'package:bidly/core/widgets/custom_rounded_button.dart';
import 'package:bidly/core/widgets/product_widget.dart';
import 'package:bidly/features/profile_screen/presentation/bloc/profile_screen_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:octo_image/octo_image.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TabletProfileScreen extends StatefulWidget {
  const TabletProfileScreen({super.key});

  @override
  State<TabletProfileScreen> createState() => _TabletProfileScreenState();
}

class _TabletProfileScreenState extends State<TabletProfileScreen> {
  final SecureStorageService _storageService = SecureStorageService();
  final RefreshController _refreshController = RefreshController();
  String? _userId;
  final int itemCount = 0;

  @override
  void initState() {
    super.initState();
    _loadUserId();
  }

  Future<void> _loadUserId() async {
    final userId = await _storageService.getValue(key: 'userId');
    setState(() {
      _userId = userId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomMobileAppBar(
        onMenuTap: () {
          // Handle menu tap
        },
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        header: const WaterDropHeader(),
        onRefresh: () async {
          if (_userId != null) {
            context
                .read<ProfileScreenBloc>()
                .add(GetUserDetailEvent(userId: _userId!));
          }
          _refreshController.refreshCompleted();
        },
        child: BlocBuilder<ProfileScreenBloc, ProfileScreenState>(
          builder: (context, state) {
            if (state is ProfileScreenInitial) {
              if (_userId != null) {
                context
                    .read<ProfileScreenBloc>()
                    .add(GetUserDetailEvent(userId: _userId!));
              }
            }
            if (state is ProfileScreenLoading) {
              return const Center(
                child: CupertinoActivityIndicator(
                  radius: 15,
                  color: AppColors.primaryText,
                ),
              );
            } else if (state is ProfileScreenFailure) {
              return Center(
                child: Text(state.message,
                    style: const AppTextStyles().baseBodyWorkSans),
              );
            } else if (state is ProfileScreenSuccess) {
              final userDetail = state.userDetailEntity;
              final firstSocialLink =
                  userDetail.data?.profile?.socialLinks.isNotEmpty == true
                      ? userDetail.data!.profile!.socialLinks[0]
                      : '';
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 330,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          SizedBox(
                              height: 280,
                              width: double.infinity,
                              child: OctoImage(
                                image: NetworkImage(userDetail
                                        .data!.profile!.coverPicture ??
                                    'https://images.pexels.com/photos/1887609/pexels-photo-1887609.jpeg'),
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
                              )),
                          Positioned(
                            left: 115,
                            bottom: 0,
                            child: SizedBox(
                              height: 120,
                              width: 120,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: OctoImage(
                                  image: NetworkImage(
                                    userDetail.data!.profileImage ??
                                        'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg',
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
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 30),
                            Text(userDetail.data!.userName,
                                style: const AppTextStyles().h3WorkSans),
                            const SizedBox(height: 30),
                            Row(
                              children: [
                                CustomRoundedButton(
                                    radius: 20,
                                    width: 187,
                                    height: 60,
                                    color: AppColors.primaryButton,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.copy,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        const SizedBox(width: 10),
                                        SizedBox(
                                          width: 120,
                                          child: Text(
                                            userDetail.data!.userId,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: const AppTextStyles()
                                                .baseBodySpaceMono,
                                          ),
                                        )
                                      ],
                                    )),
                                const SizedBox(width: 30),
                                CustomRoundedButton(
                                    radius: 20,
                                    width: 187,
                                    height: 60,
                                    shouldFill: false,
                                    color: AppColors.primaryButton,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        const SizedBox(width: 10),
                                        Text('Follow',
                                            style: const AppTextStyles()
                                                .baseBodySpaceMono)
                                      ],
                                    )),
                              ],
                            ),
                            const SizedBox(height: 30),
                            Row(
                              children: [
                                SizedBox(
                                  width: 156,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('200k',
                                          style: const AppTextStyles()
                                              .h5SpaceMono),
                                      const SizedBox(height: 10),
                                      Text('Volume',
                                          style: const AppTextStyles()
                                              .baseBodyWorkSans),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 20),
                                SizedBox(
                                  width: 156,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "${userDetail.data!.profile!.followingCount}",
                                          style: const AppTextStyles()
                                              .h5SpaceMono),
                                      const SizedBox(height: 10),
                                      Text('Following',
                                          style: const AppTextStyles()
                                              .baseBodyWorkSans),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 20),
                                SizedBox(
                                  width: 156,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "${userDetail.data!.profile!.followerCount}",
                                          style: const AppTextStyles()
                                              .h5SpaceMono),
                                      const SizedBox(height: 10),
                                      Text('Followers',
                                          style: const AppTextStyles()
                                              .baseBodyWorkSans),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            Text('Bio',
                                style: const AppTextStyles(
                                  color: AppColors.backGroundTertiary,
                                ).baseBodySpaceMono),
                            const SizedBox(height: 10),
                            Text(
                              userDetail.data!.profile!.bio ??
                                  "Whether you stumbled here by accident or on purpose, thanks for stopping by — and remember, we're all just trying to figure it out.",
                              style: const AppTextStyles().baseBodyWorkSans,
                            ),
                            const SizedBox(height: 30),
                            Text('Links',
                                style: const AppTextStyles(
                                        color: AppColors.backGroundTertiary)
                                    .baseBodySpaceMono),
                            const SizedBox(height: 10),
                            Text(
                              firstSocialLink,
                              style: const AppTextStyles().baseBodyWorkSans,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Divider(
                        thickness: 0.2, color: AppColors.backGroundTertiary),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 250,
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Sold Products',
                                    style:
                                        const AppTextStyles().baseBodyWorkSans),
                                const SizedBox(width: 5),
                                Container(
                                  width: 40,
                                  height: 28,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.backGroundTertiary),
                                  child: Center(
                                    child: Text(
                                      '0',
                                      style: const AppTextStyles()
                                          .baseBodySpaceMono,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Divider(
                              thickness: 1,
                              color: AppColors.backGroundTertiary,
                            )
                          ]),
                        ),
                        SizedBox(
                          width: 250,
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Owned Products',
                                    style:
                                        const AppTextStyles().baseBodyWorkSans),
                                const SizedBox(width: 5),
                                Container(
                                  width: 40,
                                  height: 28,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.backGroundTertiary),
                                  child: Center(
                                    child: Text(
                                      '0',
                                      style: const AppTextStyles()
                                          .baseBodySpaceMono,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 22),
                          ]),
                        ),
                        SizedBox(
                          width: 250,
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('On Sale',
                                    style:
                                        const AppTextStyles().baseBodyWorkSans),
                                const SizedBox(width: 5),
                                Container(
                                  width: 40,
                                  height: 28,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.backGroundTertiary),
                                  child: Center(
                                    child: Text(
                                      '0',
                                      style: const AppTextStyles()
                                          .baseBodySpaceMono,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 22),
                          ]),
                        ),
                      ],
                    ),
                    Container(
                      height: itemCount == 0 ? 0 : 1627,
                      color: AppColors.backGroundSecondary,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 80, vertical: 40),
                        child: SizedBox(
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                              mainAxisExtent: 470,
                            ),
                            itemCount: itemCount,
                            itemBuilder: (context, index) {
                              return const ProductWidget();
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
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
