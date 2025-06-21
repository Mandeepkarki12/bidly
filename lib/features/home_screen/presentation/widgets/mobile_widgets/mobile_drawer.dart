import 'package:bidly/core/routes/route_names.dart';
import 'package:bidly/core/services/shared_prefrences.dart';
import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:bidly/core/widgets/custom_rounded_button.dart';
import 'package:bidly/core/widgets/custom_snackbar.dart';
import 'package:bidly/features/auth_screen/presentation/bloc/auth_screen_bloc.dart';
import 'package:bidly/features/profile_screen/presentation/bloc/profile_screen_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:octo_image/octo_image.dart';

class MobileDrawer extends StatefulWidget {
  const MobileDrawer({super.key});

  @override
  State<MobileDrawer> createState() => _MobileDrawerState();
}

class _MobileDrawerState extends State<MobileDrawer> {
  final SecureStorageService _storageService = SecureStorageService();
  String? _userId;
  bool hasFetchedUser = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadUserId(); // Refresh every time drawer is opened
  }

  Future<void> _loadUserId() async {
    final userId = await _storageService.getValue(key: 'userId');
    if (_userId != userId) {
      setState(() {
        _userId = userId;
        hasFetchedUser = false; // Reset fetch trigger
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Drawer(
      backgroundColor: AppColors.backGroundSecondary,
      width: width * 0.7,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: height * 0.07),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: EdgeInsets.all(width * 0.006),
                    margin: EdgeInsets.only(right: width * 0.55, top: 10),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.backGroundPrimary,
                    ),
                    child: const Icon(
                      Icons.close,
                      size: 30,
                      color: AppColors.primaryText,
                    ),
                  ),
                ),

                /// Show loading indicator if userId is not loaded yet
                if (_userId == null || _userId!.isEmpty)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: CupertinoActivityIndicator(),
                  )
                else
                  BlocBuilder<ProfileScreenBloc, ProfileScreenState>(
                    builder: (context, state) {
                      if (!hasFetchedUser) {
                        hasFetchedUser = true;
                        context.read<ProfileScreenBloc>().add(
                              GetUserDetailEvent(userId: _userId!),
                            );
                      }

                      if (state is ProfileScreenLoading) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 30),
                          child: CupertinoActivityIndicator(),
                        );
                      }

                      if (state is ProfileScreenFailure) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Center(
                            child: Text(
                              state.message,
                              style: const AppTextStyles().baseBodySpaceMono,
                            ),
                          ),
                        );
                      }

                      if (state is ProfileScreenSuccess) {
                        final user = state.userDetailEntity.data!;
                        return GestureDetector(
                          onTap: () => Navigator.pushNamed(
                              context, RouteNames.profileScreen),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 120,
                                width: 120,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(360),
                                  child: OctoImage(
                                    image: NetworkImage(
                                      user.profileImage ??
                                          'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg',
                                    ),
                                    fit: BoxFit.cover,
                                    placeholderBuilder: (_) =>
                                        const CupertinoActivityIndicator(),
                                    errorBuilder: (_, __, ___) => const Icon(
                                        Icons.error_outline,
                                        color: Colors.red,
                                        size: 24),
                                  ),
                                ),
                              ),
                              SizedBox(height: height * 0.008),
                              Text(
                                user.userName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const AppTextStyles(
                                  color: AppColors.primaryText,
                                ).h5SpaceMono,
                              ),
                              SizedBox(height: height * 0.001),
                              Divider(
                                color: AppColors.backGroundTertiary,
                                thickness: 0.5,
                                indent: width * 0.03,
                                endIndent: width * 0.03,
                              ),
                            ],
                          ),
                        );
                      }

                      return const SizedBox.shrink();
                    },
                  ),

                SizedBox(height: height * 0.04),
              ],
            ),

            /// Logout button with listener
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: BlocListener<AuthScreenBloc, AuthScreenState>(
                listener: (context, state) {
                  if (state is AuthScreenFailure) {
                    showCustomSnackBar(
                      context,
                      message: state.message,
                      type: SnackBarType.error,
                    );
                  }
                  if (state is AuthScreenSucess) {
                    showCustomSnackBar(
                      context,
                      message: 'Logout Successful',
                      type: SnackBarType.success,
                    );
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      RouteNames.authGate,
                      (route) => false,
                    );
                  }
                },
                child: CustomRoundedButton(
                  shouldFill: false,
                  height: 50,
                  width: 150,
                  radius: 12,
                  color: AppColors.primaryButton,
                  child: Center(
                    child: Text(
                      'Logout',
                      style: const AppTextStyles(
                        color: AppColors.backGroundTertiary,
                      ).baseBodySpaceMono,
                    ),
                  ),
                  onTap: () {
                    context
                        .read<AuthScreenBloc>()
                        .add(AuthScreenSignOutEvent());
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
