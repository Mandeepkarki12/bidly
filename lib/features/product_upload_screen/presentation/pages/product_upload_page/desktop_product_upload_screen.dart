import 'package:bidly/core/widgets/custom_appbar/custom_web_appbar.dart';

import 'package:flutter/material.dart';

class DesktopProductUploadScreen extends StatefulWidget {
  const DesktopProductUploadScreen({super.key});

  @override
  State<DesktopProductUploadScreen> createState() =>
      _DesktopProductUploadScreenState();
}

class _DesktopProductUploadScreenState
    extends State<DesktopProductUploadScreen> {
  Category? selectedCategory;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: CustomWebAppBar(
      isHomepage: false,
      isLoggedIn: true,
    ));
  }
}

enum Category {
  electronics('101', 'Electronics'),
  clothing('102', 'Clothing'),
  homeAndGarden('103', 'Home & Garden'),
  vehicles('104', 'Vehicles'),
  booksAndMedia('105', 'Books & Media'),
  sportsAndOutdoors('106', 'Sports & Outdoors'),
  toysAndGames('107', 'Toys & Games'),
  artAndCollectibles('108', 'Art & Collectibles');

  final String id;
  final String name;

  const Category(this.id, this.name);
}
