import 'dart:developer';

import 'package:bidly/core/services/shared_prefrences.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

class AuthService extends GetxService {
  static Future<bool> isUserLoggedIn() async {
    try {
      String? accessToken = await SecureStorageService().getValue(
        key: "accessToken",
      );
      if (accessToken == null) {
        return false;
      } else {
        log('Access Token: $accessToken');
        return true;
      }
    } catch (e) {
      return false;
    }
  }
}
