import 'package:flutter/widgets.dart';
import 'package:flutter_lakshman1020/core/base/base_controller.dart';
import 'package:flutter_lakshman1020/core/network/services/auth_storage_service.dart';
import 'package:flutter_lakshman1020/core/utils/debug_print.dart';
import 'package:flutter_lakshman1020/features/auth/users/domain/repo/auth_repo.dart';
import 'package:flutter_lakshman1020/features/auth/users/presentation/screens/LogIn_screen.dart';
import 'package:flutter_lakshman1020/features/home/presentations/screens/user_home_screen.dart';
import 'package:get/get.dart';

import '../../data/model/login_request_model.dart';
import '../../data/model/register_request_model.dart';

class AuthController extends BaseController {
  final AuthRepository _authRepository;
  final AuthStorageService _authStorageService;

  // final String selectedRole;
  bool _isSuccess = false;

  AuthController(
    this._authRepository,
    this._authStorageService,
    
  );

  Future<void> login(String email, String password) async {
    setLoading(true);
    setError("");

    final request = LoginRequestModel(email: email, password: password);

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

  Future<void> register(
    String name,
    String email,
    String password,

    String confirmPassword,
    String role,
  ) async {
    setLoading(true);
    setError('');

    final request = RegisterRequestModel(
      name: name,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      role: role,
    );

    final result = await _authRepository.register(request);

    result.fold(
      (fail) {
        setError(fail.message);
        DPrint.log("Register success result : ${fail.message}");
        setLoading(false);
      },
      (success) {
        DPrint.log("Register success result : ${success.data.id}");
        // Get.to(OtpVerificationToCompleteRegister(email: email));
        // Get.to(() => LoginRoleScreen(selectedRole: selectedRole,));
        Get.off(() => LoginRoleScreen(selectedRole: role,));
        setLoading(false);
      },
    );
  }
}
