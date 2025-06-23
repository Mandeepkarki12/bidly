import 'package:bidly/core/routes/route_names.dart';
import 'package:bidly/core/services/shared_prefrences.dart';
import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:bidly/core/widgets/custom_rounded_button.dart';
import 'package:bidly/features/profile_screen/presentation/bloc/profile_screen_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:octo_image/octo_image.dart'; // Add this import

class CustomWebAppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool isHomepage;
  final bool isLoggedIn;
  final String? profileImageUrl;

  const CustomWebAppBar({
    super.key,
    this.isHomepage = true,
    this.isLoggedIn = false,
    this.profileImageUrl,
  });

  @override
  State<CustomWebAppBar> createState() => _CustomWebAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(90);
}

class _CustomWebAppBarState extends State<CustomWebAppBar> {
  bool _isMarketplaceHovered = false;
  bool _isRankingHovered = false;
  bool _isWalletHovered = false;
  bool _isSignUpHovered = false;
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
    final double width = MediaQuery.of(context).size.width;
    return AppBar(
      backgroundColor: AppColors.backGroundPrimary,
      toolbarHeight: 90,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/app_logo.svg',
            height: 40,
            width: 40,
          ),
          SizedBox(width: width * 0.01),
          Text('Bidly', style: const AppTextStyles().h4SpaceMono),
        ],
      ),
      centerTitle: false,
      actions: widget.isHomepage
          ? [
              _buildHoverableText(
                text: 'Marketplace',
                isHovered: _isMarketplaceHovered,
                onHover: (value) =>
                    setState(() => _isMarketplaceHovered = value),
              ),
              const SizedBox(width: 60),
              _buildHoverableText(
                text: 'Ranking',
                isHovered: _isRankingHovered,
                onHover: (value) => setState(() => _isRankingHovered = value),
              ),
              const SizedBox(width: 60),
              _buildHoverableText(
                text: 'Connect a Wallet',
                isHovered: _isWalletHovered,
                onHover: (value) => setState(() => _isWalletHovered = value),
              ),
              const SizedBox(width: 60),
              widget.isLoggedIn
                  ? GestureDetector(
                      onTap: () {
                        // Handle profile tap
                        Navigator.pushNamed(context, RouteNames.profileScreen);
                      },
                      child: BlocBuilder<ProfileScreenBloc, ProfileScreenState>(
                        builder: (context, state) {
                          if (!hasFetchedUser) {
                            hasFetchedUser = true;
                            context.read<ProfileScreenBloc>().add(
                                  GetUserDetailEvent(userId: _userId!),
                                );
                          }
                          if (state is ProfileScreenFailure) {
                            return const ClipOval(
                              child: SizedBox(
                                width: 40,
                                height: 40,
                                child: Center(
                                  child: Icon(
                                    Icons.error_outline,
                                    color: Colors.red,
                                    size: 24,
                                  ),
                                ),
                              ),
                            );
                          }
                          if (state is ProfileScreenSuccess) {
                            final user = state.userDetailEntity.data!;
                            return ClipOval(
                              child: SizedBox(
                                width: 40,
                                height: 40,
                                child: OctoImage(
                                  image: NetworkImage(
                                    user.profileImage ??
                                        'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg',
                                  ),
                                  fit: BoxFit.cover,
                                  placeholderBuilder: (_) => const Center(
                                    child: CupertinoActivityIndicator(
                                      radius: 10,
                                      color: AppColors.primaryButton,
                                    ),
                                  ),
                                  errorBuilder: (_, __, ___) => const Icon(
                                    Icons.error_outline,
                                    color: Colors.red,
                                    size: 24,
                                  ),
                                ),
                              ),
                            );
                          }
                          return const Center(
                            child: CupertinoActivityIndicator(
                              radius: 10,
                              color: AppColors.primaryButton,
                            ),
                          );
                        },
                      ),
                    )
                  : MouseRegion(
                      onEnter: (_) => setState(() => _isSignUpHovered = true),
                      onExit: (_) => setState(() => _isSignUpHovered = false),
                      child: CustomRoundedButton(
                        radius: 20,
                        onTap: () {},
                        height: 60,
                        width: 152,
                        color: _isSignUpHovered
                            ? AppColors.primaryButton
                            : AppColors.primaryButton,
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 200),
                          style:
                              const AppTextStyles().baseBodyWorkSans.copyWith(
                                    fontSize: _isSignUpHovered ? 14 : 16,
                                  ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.person,
                                size: 22,
                                color: AppColors.primaryText,
                              ),
                              SizedBox(width: width * 0.003),
                              Text('SignUp',
                                  style: const AppTextStyles()
                                      .baseBodyWorkSans
                                      .copyWith(
                                        fontSize: _isSignUpHovered ? 14 : 16,
                                        color: AppColors.primaryText,
                                      )),
                            ],
                          ),
                        ),
                      ),
                    ),
              SizedBox(width: width * 0.01),
            ]
          : null, // If not homepage, actions will be null
    );
  }

  Widget _buildHoverableText({
    required String text,
    required bool isHovered,
    required Function(bool) onHover,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => onHover(true),
      onExit: (_) => onHover(false),
      child: GestureDetector(
        onTap: () {
          print('$text tapped');
        },
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: const AppTextStyles().baseBodyWorkSans.copyWith(
                fontSize: isHovered ? 14 : 16,
                color: isHovered
                    ? AppColors.primaryText.withOpacity(0.8)
                    : AppColors.primaryText,
              ),
          child: Text(text),
        ),
      ),
    );
  }
}
