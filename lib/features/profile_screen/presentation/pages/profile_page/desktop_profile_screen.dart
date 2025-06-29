import 'package:bidly/core/services/shared_prefrences.dart';
import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:bidly/core/widgets/custom_appbar/custom_web_appbar.dart';
import 'package:bidly/core/widgets/custom_footer/custom_web_footer.dart';
import 'package:bidly/core/widgets/custom_rounded_button.dart';
import 'package:bidly/core/widgets/product_widget.dart';
import 'package:bidly/features/profile_screen/presentation/bloc/profile_screen_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:octo_image/octo_image.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DesktopProfileScreen extends StatefulWidget {
  const DesktopProfileScreen({super.key});

  @override
  State<DesktopProfileScreen> createState() => _DesktopProfileScreenState();
}

class _DesktopProfileScreenState extends State<DesktopProfileScreen> {
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
      appBar: const CustomWebAppBar(
        isHomepage: false,
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
                      height: 370,
                      width: double.infinity,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          SizedBox(
                              height: 320,
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
                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 600,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(userDetail.data!.userName,
                                      style: const AppTextStyles().h2WorkSans),
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
                                                    .h4SpaceMono),
                                            const SizedBox(height: 10),
                                            Text('Volume',
                                                style: const AppTextStyles()
                                                    .bodyText),
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
                                                    .h4SpaceMono),
                                            const SizedBox(height: 10),
                                            Text('Following',
                                                style: const AppTextStyles()
                                                    .bodyText),
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
                                                    .h4SpaceMono),
                                            const SizedBox(height: 10),
                                            Text('Followers',
                                                style: const AppTextStyles()
                                                    .bodyText),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 30),
                                  Text('Bio',
                                      style: const AppTextStyles(
                                        color: AppColors.backGroundTertiary,
                                      ).h5SpaceMono),
                                  const SizedBox(height: 10),
                                  Text(
                                    userDetail.data!.profile!.bio ??
                                        "Whether you stumbled here by accident or on purpose, thanks for stopping by — and remember, we're all just trying to figure it out.",
                                    style: const AppTextStyles().bodyText,
                                  ),
                                  const SizedBox(height: 30),
                                  Text('Links',
                                      style: const AppTextStyles(
                                              color:
                                                  AppColors.backGroundTertiary)
                                          .h5SpaceMono),
                                  const SizedBox(height: 10),
                                  Text(
                                    firstSocialLink,
                                    style:
                                        const AppTextStyles().baseBodyWorkSans,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              CustomRoundedButton(
                                  radius: 20,
                                  width: 187,
                                  height: 60,
                                  color: AppColors.primaryButton,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.copy,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 10),
                                      SizedBox(
                                        width: 120,
                                        child: Text(userDetail.data!.userId,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const AppTextStyles()
                                                .baseBodySpaceMono),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Divider(
                      thickness: 0.2,
                      color: AppColors.backGroundTertiary,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 300,
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Sold',
                                    style: const AppTextStyles().h5WorkSans),
                                const SizedBox(width: 5),
                                Container(
                                  width: 50,
                                  height: 32,
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
                          width: 300,
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Owned',
                                    style: const AppTextStyles().h5WorkSans),
                                const SizedBox(width: 5),
                                Container(
                                  width: 50,
                                  height: 32,
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
                          width: 300,
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('On Sale',
                                    style: const AppTextStyles().h5WorkSans),
                                const SizedBox(width: 5),
                                Container(
                                  width: 50,
                                  height: 32,
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
                      height: itemCount == 0 ? 0 : 1500,
                      width: double.infinity,
                      color: AppColors.backGroundSecondary,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 80, vertical: 60),
                        child: SizedBox(
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
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
                    const CustomWebFooter(),
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
