import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:bidly/core/widgets/custom_appbar/custom_mobile_appbar.dart';
import 'package:bidly/core/widgets/custom_dropdown.dart';
import 'package:bidly/core/widgets/custom_rounded_button.dart';
import 'package:bidly/core/widgets/custom_textfield.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class MobileProductUploadScreen extends StatefulWidget {
  const MobileProductUploadScreen({super.key});

  @override
  State<MobileProductUploadScreen> createState() =>
      _MobileProductUploadScreenState();
}

class _MobileProductUploadScreenState extends State<MobileProductUploadScreen> {
  Category? selectedCategory;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomMobileAppBar(
        isMenu: false,
        onMenuTap: () {},
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.06, vertical: 10),
        child: SingleChildScrollView(
          child: Container(
            padding:
                EdgeInsets.symmetric(horizontal: width * 0.03, vertical: 20),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.backGroundSecondary,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 12,
                  spreadRadius: 2,
                  offset: const Offset(0, 6),
                ),
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text('Upload Product',
                    style: const AppTextStyles().h4SpaceMono),
                const SizedBox(height: 16),
                DottedBorder(
                  color: Colors.grey.withOpacity(0.4),
                  strokeWidth: 1.2,
                  dashPattern: const [6, 4],
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E1E1E),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_a_photo, color: Colors.grey, size: 28),
                        SizedBox(height: 8),
                        Text(
                          'Upload Image',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Title',
                        style: const AppTextStyles()
                            .h5WorkSans
                            .copyWith(fontSize: 20)),
                    const SizedBox(height: 8),
                    CustomTextField(
                      hintText: 'Product title',
                      style: const TextStyle(color: Colors.white),
                      fillColor: const Color(0xFF1E1E1E),
                      borderColor: Colors.white.withOpacity(0.1),
                      borderRadius: 12,
                      borderWidth: 1,
                      hintStyle: const AppTextStyles()
                          .baseBodyWorkSans
                          .copyWith(color: Colors.white70),
                      cursorColor: Colors.white,
                      textAlignVertical: TextAlignVertical.center,
                    ),
                    const SizedBox(height: 16),
                    Text('Description',
                        style: const AppTextStyles()
                            .h5WorkSans
                            .copyWith(fontSize: 20)),
                    const SizedBox(height: 8),
                    CustomTextField(
                      hintText: 'Product description',
                      style: const TextStyle(color: Colors.white),
                      fillColor: const Color(0xFF1E1E1E),
                      borderColor: Colors.white.withOpacity(0.1),
                      borderRadius: 12,
                      borderWidth: 1,
                      hintStyle: const AppTextStyles()
                          .baseBodyWorkSans
                          .copyWith(color: Colors.white70),
                      cursorColor: Colors.white,
                      textAlignVertical: TextAlignVertical.center,
                    ),
                    const SizedBox(height: 16),
                    Text('Category',
                        style: const AppTextStyles()
                            .h5WorkSans
                            .copyWith(fontSize: 20)),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 68,
                      child: CustomDropdown<Category>(
                        value: selectedCategory,
                        onChanged: (value) {
                          setState(() {
                            selectedCategory = value;
                          });
                        },
                        items: Category.values
                            .map(
                              (category) => DropdownMenuItem<Category>(
                                value: category,
                                child: Text(
                                  category.name,
                                  style: const AppTextStyles()
                                      .baseBodyWorkSans
                                      .copyWith(color: Colors.white70),
                                ),
                              ),
                            )
                            .toList(),
                        fillColor: const Color(0xFF1E1E1E),
                        dropdownColor: const Color(0xFF1E1E1E),
                        borderColor: Colors.white.withOpacity(0.1),
                        borderRadius: 12,
                        borderWidth: 1,
                        hintText: 'Select Category',
                        hintStyle: const AppTextStyles()
                            .baseBodyWorkSans
                            .copyWith(color: Colors.white70),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text('Tags',
                        style: const AppTextStyles()
                            .h5WorkSans
                            .copyWith(fontSize: 20)),
                    const SizedBox(height: 8),
                    CustomTextField(
                      hintText: 'Product tags',
                      style: const TextStyle(color: Colors.white),
                      fillColor: const Color(0xFF1E1E1E),
                      borderColor: Colors.white.withOpacity(0.1),
                      borderRadius: 12,
                      borderWidth: 1,
                      hintStyle: const AppTextStyles()
                          .baseBodyWorkSans
                          .copyWith(color: Colors.white70),
                      cursorColor: Colors.white,
                      textAlignVertical: TextAlignVertical.center,
                    ),
                    const SizedBox(height: 16),
                    Text('Price',
                        style: const AppTextStyles()
                            .h5WorkSans
                            .copyWith(fontSize: 20)),
                    const SizedBox(height: 8),
                    CustomTextField(
                      hintText: 'Minimum price',
                      style: const TextStyle(color: Colors.white),
                      fillColor: const Color(0xFF1E1E1E),
                      borderColor: Colors.white.withOpacity(0.1),
                      borderRadius: 12,
                      borderWidth: 1,
                      hintStyle: const AppTextStyles()
                          .baseBodyWorkSans
                          .copyWith(color: Colors.white70),
                      cursorColor: Colors.white,
                      textAlignVertical: TextAlignVertical.center,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomRoundedButton( 
                        radius: 12,
                        onTap: () {},
                        height: 60,
                        width: double.infinity,
                        color: AppColors.primaryButton,
                        child: Center(
                            child: Text('Upload',
                                style:
                                    const AppTextStyles().baseBodyWorkSans))),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Category enum
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
