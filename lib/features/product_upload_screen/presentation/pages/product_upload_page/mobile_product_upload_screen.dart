import 'dart:io';
import 'package:bidly/core/widgets/custom_snackbar.dart';
import 'package:bidly/features/product_upload_screen/presentation/bloc/product_upload_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bidly/core/services/shared_prefrences.dart';
import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:bidly/core/widgets/custom_appbar/custom_mobile_appbar.dart';
import 'package:bidly/core/widgets/custom_dropdown.dart';
import 'package:bidly/core/widgets/custom_rounded_button.dart';
import 'package:bidly/core/widgets/custom_textfield.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:bidly/core/utils/file_image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MobileProductUploadScreen extends StatefulWidget {
  const MobileProductUploadScreen({super.key});

  @override
  State<MobileProductUploadScreen> createState() =>
      _MobileProductUploadScreenState();
}

class _MobileProductUploadScreenState extends State<MobileProductUploadScreen> {
  final SecureStorageService _storageService = SecureStorageService();
  final FileImagePicker _fileImagePicker = FileImagePicker();
  final _globalFormKey = GlobalKey<FormState>();

  final String _userId = '123';
  String title = '';
  String description = '';
  String price = '';
  String tags = '';
  File? _pickedImageFile;
  Category? selectedCategory;

  Future<void> _pickImage() async {
    final pickedFile = await _fileImagePicker.pickImage(preferCamera: false);
    if (pickedFile != null) {
      setState(() {
        _pickedImageFile = pickedFile;
      });
    }
  }

  void _submitForm() {
    if (_globalFormKey.currentState!.validate()) {
      _globalFormKey.currentState!.save();

      if (_pickedImageFile == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select an image')),
        );
        return;
      }

      if (_userId == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User ID not found')),
        );
        return;
      }

      if (selectedCategory == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a category')),
        );
        return;
      }

      print('--- Product Upload Data ---');
      print('User ID: $_userId');
      print('Title: $title');
      print('Description: $description');
      print('Price: $price');
      print('Tags: $tags');
      print('Category ID: ${selectedCategory!.id}');
      print('Category Name: ${selectedCategory!.name}');
      print('Image Path: ${_pickedImageFile!.path}');
      context.read<ProductUploadScreenBloc>().add(UploadProductEvent(
          userId: _userId,
          categoryId: selectedCategory!.id,
          tags: tags,
          productTitle: title,
          productDescription: description,
          productPrice: price,
          productImage: _pickedImageFile!.path));

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data printed to console successfully')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomMobileAppBar(
        isMenu: false,
        onMenuTap: () {},
      ),
      body: BlocListener<ProductUploadScreenBloc, ProductUploadScreenState>(
        listener: (context, state) {
          if (state is ProductUploadScreenError) {
            showCustomSnackBar(context,
                message: state.message, type: SnackBarType.error);
          }
          if (state is ProductUploadScreenLoaded) {
            showCustomSnackBar(context,
                message: state.productUploadEntity.message,
                type: SnackBarType.success);
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06, vertical: 10),
          child: SingleChildScrollView(
            child: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: width * 0.03, vertical: 20),
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
              child: Form(
                key: _globalFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text('Upload Product',
                          style: const AppTextStyles().h4SpaceMono),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: DottedBorder(
                        color: Colors.grey.withOpacity(0.4),
                        strokeWidth: 1.2,
                        dashPattern: const [6, 4],
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(12),
                        child: GestureDetector(
                          onTap: _pickImage,
                          child: Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              color: const Color(0xFF1E1E1E),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: _pickedImageFile != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.file(
                                      _pickedImageFile!,
                                      fit: BoxFit.cover,
                                      width: 120,
                                      height: 120,
                                    ),
                                  )
                                : const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.add_a_photo,
                                          color: Colors.grey, size: 28),
                                      SizedBox(height: 8),
                                      Text(
                                        'Upload Image',
                                        style: TextStyle(color: Colors.white70),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildTextField(
                      label: 'Title',
                      hint: 'Product title',
                      onSaved: (value) => title = value ?? '',
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      label: 'Description',
                      hint: 'Product description',
                      onSaved: (value) => description = value ?? '',
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
                    _buildTextField(
                      label: 'Tags',
                      hint: 'Product tags',
                      onSaved: (value) => tags = value ?? '',
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      label: 'Price',
                      hint: 'Minimum price',
                      keyboardType: TextInputType.number,
                      onSaved: (value) => price = value ?? '',
                    ),
                    const SizedBox(height: 30),
                    CustomRoundedButton(
                      radius: 12,
                      onTap: _submitForm,
                      height: 60,
                      width: double.infinity,
                      color: AppColors.primaryButton,
                      child: Center(
                        child: Text('Upload',
                            style: const AppTextStyles().baseBodyWorkSans),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required Function(String?) onSaved,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const AppTextStyles().h5WorkSans.copyWith(fontSize: 20)),
        const SizedBox(height: 8),
        CustomTextField(
          onSaved: onSaved,
          hintText: hint,
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
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}

// Enum
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
