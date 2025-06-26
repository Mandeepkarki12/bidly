import 'package:bidly/core/responsive_tools/responsive_layout.dart';
import 'package:bidly/features/product_upload_screen/presentation/pages/product_upload_page/desktop_product_upload_screen.dart';
import 'package:bidly/features/product_upload_screen/presentation/pages/product_upload_page/mobile_product_upload_screen.dart';
import 'package:flutter/material.dart';

class ProductUploadScreen extends StatelessWidget {
  const ProductUploadScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileProductUploadScreen(),
        tabletBody: MobileProductUploadScreen(),
        webBody: DesktopProductUploadScreen(),
      ),
    );
  }
}
