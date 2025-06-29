import 'dart:io';
import 'package:bidly/core/widgets/custom_snackbar.dart';
import 'package:bidly/features/product_upload_screen/presentation/bloc/product_upload_screen_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bidly/core/services/shared_prefrences.dart';
import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:bidly/core/widgets/custom_appbar/custom_mobile_appbar.dart';
import 'package:bidly/core/widgets/custom_dropdown.dart';
import 'package:bidly/core/widgets/custom_rounded_button.dart';
import 'package:bidly/core/widgets/custom_textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bidly/core/utils/file_image_picker.dart';

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
  String? _userId;
  bool hasFetchedUser = false;

  String title = '';
  String description = '';
  String price = '';
  String tags = '';
  File? _pickedImageFile;
  Category? selectedCategory;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadUserId();
  }

  Future<void> _loadUserId() async {
    final userId = await _storageService.getValue(key: 'userId');
    if (_userId != userId) {
      setState(() {
        _userId = userId;
        hasFetchedUser = false;
      });
    }
  }

  Future<void> _pickImage() async {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.backGroundPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt, color: Colors.white),
                title: const Text('Take Photo',
                    style: TextStyle(color: Colors.white)),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedFile =
                      await _fileImagePicker.pickImageFromCamera();
                  if (pickedFile != null) {
                    setState(() {
                      _pickedImageFile = pickedFile;
                    });
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library, color: Colors.white),
                title: const Text('Choose from Gallery',
                    style: TextStyle(color: Colors.white)),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedFile =
                      await _fileImagePicker.pickImageFromGallery();
                  if (pickedFile != null) {
                    setState(() {
                      _pickedImageFile = pickedFile;
                    });
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _submitForm() {
    if (_globalFormKey.currentState!.validate()) {
      _globalFormKey.currentState!.save();

      if (_pickedImageFile == null) {
        showCustomSnackBar(context,
            message: 'Please select an image', type: SnackBarType.error);
        return;
      }
      if (_userId == null) {
        showCustomSnackBar(context,
            message: 'User ID not found', type: SnackBarType.error);
        return;
      }
      if (title.isEmpty) {
        showCustomSnackBar(context,
            message: 'Please enter a title', type: SnackBarType.error);
        return;
      }
      if (description.isEmpty) {
        showCustomSnackBar(context,
            message: 'Please enter a description', type: SnackBarType.error);
        return;
      }
      if (price.isEmpty) {
        showCustomSnackBar(context,
            message: 'Please enter a price', type: SnackBarType.error);
        return;
      }
      if (selectedCategory == null) {
        showCustomSnackBar(context,
            message: 'Please select a category', type: SnackBarType.error);
        return;
      }
      if (!hasFetchedUser) {
        hasFetchedUser = true;
        context.read<ProductUploadScreenBloc>().add(UploadProductEvent(
              userId: _userId!,
              categoryId: selectedCategory!.id,
              tags: tags,
              productTitle: title,
              productDescription: description,
              productPrice: price,
              productImage: _pickedImageFile!.path,
            ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomMobileAppBar(isMenu: false, onMenuTap: () {}),
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
            setState(() {
              title = '';
              description = '';
              price = '';
              tags = '';
              selectedCategory = null;
              _pickedImageFile = null;
              hasFetchedUser = false;
            });
            _globalFormKey.currentState!.reset();
            Navigator.pop(context);
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06, vertical: 10),
          child: SingleChildScrollView(
            child: Form(
              key: _globalFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Text('Upload Product',
                          style: const AppTextStyles().h4SpaceMono)),
                  const SizedBox(height: 16),
                  Center(
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: _pickedImageFile != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.file(_pickedImageFile!,
                                  width: 120, height: 120, fit: BoxFit.cover),
                            )
                          : Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: const Color(0xFF1E1E1E),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.4),
                                    width: 1.2),
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add_a_photo,
                                      color: Colors.grey, size: 28),
                                  SizedBox(height: 8),
                                  Text('Upload Image',
                                      style: TextStyle(color: Colors.white70)),
                                ],
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(
                      label: 'Title',
                      hint: 'Product title',
                      onSaved: (val) => title = val ?? ''),
                  const SizedBox(height: 16),
                  _buildTextField(
                      label: 'Description',
                      hint: 'Product description',
                      onSaved: (val) => description = val ?? ''),
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
                      onChanged: (value) =>
                          setState(() => selectedCategory = value),
                      items: Category.values
                          .map((category) => DropdownMenuItem(
                                value: category,
                                child: Text(category.name,
                                    style: const AppTextStyles()
                                        .baseBodyWorkSans
                                        .copyWith(color: Colors.white70)),
                              ))
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
                      onSaved: (val) => tags = val ?? ''),
                  const SizedBox(height: 16),
                  _buildTextField(
                      label: 'Price',
                      hint: 'Minimum price',
                      onSaved: (val) => price = val ?? '',
                      keyboardType: TextInputType.number),
                  const SizedBox(height: 30),
                  BlocBuilder<ProductUploadScreenBloc,
                      ProductUploadScreenState>(
                    builder: (context, state2) {
                      return CustomRoundedButton(
                        radius: 12,
                        onTap: _submitForm,
                        height: 60,
                        width: double.infinity,
                        color: AppColors.primaryButton,
                        child: state2 is ProductUploadScreenLoading
                            ? const CupertinoActivityIndicator(
                                color: Colors.white,
                                radius: 12,
                              )
                            : Center(
                                child: Text('Upload',
                                    style: const AppTextStyles()
                                        .baseBodyWorkSans)),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      {required String label,
      required String hint,
      required Function(String?) onSaved,
      TextInputType keyboardType = TextInputType.text}) {
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
