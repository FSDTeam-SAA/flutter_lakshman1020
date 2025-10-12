import 'package:flutter/widgets.dart';
import 'package:flutter_lakshman1020/core/base/base_controller.dart';
import 'package:flutter_lakshman1020/core/network/services/auth_storage_service.dart';
import 'package:flutter_lakshman1020/features/auth/users/domain/repo/auth_repo.dart';
import 'package:flutter_lakshman1020/features/home/presentations/screens/user_home_screen.dart';
import 'package:get/get.dart';

import '../../data/model/login_request_model.dart';

class AuthController extends BaseController {
  final AuthRepository _authRepository;
  final AuthStorageService _authStorageService;
  bool _isSuccess = false;

  AuthController(this._authRepository, this._authStorageService);


  Future<void> login(String email, String password) async {
    setLoading(true);
    setError("");

    final request = LoginRequestModel(email: email, password: password, role: "user");

    final result = await _authRepository.login(request);

    result.fold(
      (fail) {
        debugPrint("❌ API Error: ${fail.message}");
        setError(fail.message);
        setLoading(false);
      },
      (success) async {
        debugPrint("✅ API Hit Successful!");
        await _authStorageService.storeAuthData(
          accessToken: success.data.accessToken,
          refreshToken: success.data.refreshToken,
          userId: success.data.user.id,
        );
        Get.to(() => UserHomeScreen());
      

        setLoading(false);
      },
    );
  }

}
