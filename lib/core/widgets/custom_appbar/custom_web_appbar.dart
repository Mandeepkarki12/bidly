import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:bidly/core/widgets/custom_rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomWebAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomWebAppBar({super.key});

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

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return AppBar(
      backgroundColor: AppColors.backGroundPrimary,
      toolbarHeight: 90,
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
      actions: [
        _buildHoverableText(
          text: 'Marketplace',
          isHovered: _isMarketplaceHovered,
          onHover: (value) => setState(() => _isMarketplaceHovered = value),
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
        MouseRegion(
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
              style: const AppTextStyles().baseBodyWorkSans.copyWith(
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
                      style: const AppTextStyles().baseBodyWorkSans.copyWith(
                            fontSize: _isSignUpHovered ? 14 : 16,
                            color: AppColors.primaryText,
                          )),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: width * 0.01),
      ],
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
