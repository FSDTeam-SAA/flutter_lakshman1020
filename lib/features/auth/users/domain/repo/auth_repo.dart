import 'package:flutter_lakshman1020/features/auth/users/data/model/auth_response_model.dart';

import '../../../../../core/network/network_result.dart';
import '../../data/model/login_request_model.dart';

abstract class AuthRepository {
  NetworkResult<AuthResponseModel> login(LoginRequestModel request);
}