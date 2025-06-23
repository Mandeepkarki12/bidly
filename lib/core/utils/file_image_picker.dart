import 'dart:io';
import 'package:image_picker/image_picker.dart';

class FileImagePicker {
  final ImagePicker _picker = ImagePicker();

  /// Picks an image from the device's camera
  Future<File?> pickImageFromCamera({
    ImageQuality imageQuality = ImageQuality.medium,
  }) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: _convertImageQuality(imageQuality),
      );
      return image != null ? File(image.path) : null;
    } catch (e) {
      throw Exception('Failed to capture image: $e');
    }
  }

  /// Picks an image from the device's gallery
  Future<File?> pickImageFromGallery({
    ImageQuality imageQuality = ImageQuality.medium,
  }) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: _convertImageQuality(imageQuality),
      );
      return image != null ? File(image.path) : null;
    } catch (e) {
      throw Exception('Failed to pick image: $e');
    }
  }

  /// Platform-agnostic method that uses camera on mobile and file picker on web
  Future<File?> pickImage({
    ImageQuality imageQuality = ImageQuality.medium,
    bool preferCamera = false,
  }) async {
    if (Platform.isAndroid || Platform.isIOS) {
      return preferCamera
          ? pickImageFromCamera(imageQuality: imageQuality)
          : pickImageFromGallery(imageQuality: imageQuality);
    } else {
      // Web implementation
      return pickImageFromGallery(imageQuality: imageQuality);
    }
  }

  /// Converts our custom ImageQuality enum to the int value image_picker expects
  int _convertImageQuality(ImageQuality quality) {
    switch (quality) {
      case ImageQuality.low:
        return 25;
      case ImageQuality.medium:
        return 50;
      case ImageQuality.high:
        return 75;
      case ImageQuality.max:
        return 100;
      default:
        return 50;
    }
  }
}

enum ImageQuality {
  low, // 25% quality
  medium, // 50% quality
  high, // 75% quality
  max, // 100% quality (no compression)
}

// Example usage:

// final filePicker = FileImagePicker();

// // Pick from camera (mobile) or file picker (web)
// final imageFile = await filePicker.pickImage(preferCamera: true);

// // Pick from gallery with high quality
// final highQualityImage = await filePicker.pickImageFromGallery(
//   imageQuality: ImageQuality.high,
// );

// // Pick from camera with default quality
// final cameraImage = await filePicker.pickImageFromCamera();