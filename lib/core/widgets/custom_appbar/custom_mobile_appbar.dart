import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

class CustomMobileAppBar extends StatefulWidget implements PreferredSizeWidget {
  final VoidCallback onMenuTap;
  final bool isMenu;
  const CustomMobileAppBar(
      {super.key, required this.onMenuTap, this.isMenu = true});

  @override
  State<CustomMobileAppBar> createState() => _CustomMobileAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(90);
}

class _CustomMobileAppBarState extends State<CustomMobileAppBar> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return AppBar(
      backgroundColor: AppColors.backGroundPrimary,
      toolbarHeight: 90,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/app_logo.svg',
            height: 35,
            width: 35,
          ),
          SizedBox(width: width * 0.04),
          Text('Bidly', style: const AppTextStyles().h4SpaceMono),
        ],
      ),
      centerTitle: true,
      actions: [
        widget.isMenu
            ? IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: AppColors.primaryText,
                ),
                onPressed: () {
                  widget.onMenuTap();
                },
              )
            : const SizedBox(),
        SizedBox(width: width * 0.02),
      ],
    );
  }
}
