import 'package:dio/dio.dart';
import 'package:flutter_lakshman1020/features/accounts/data/models/fetch_profile_response_model.dart';

import '../../../../core/network/network_result.dart';



abstract class AccountRepository {
  NetworkResult<FetchProfileResponseModel> fetchProfile();

  // //profile update
  // NetworkResult<UserResponse> updatePersonalInfo(FormData request);

// //Change password
//   NetworkResult<void> changePass(ChangePasswordRequest request);
//
//   NetworkResult<UserResponse> uploadPhoto(FormData request);
//
//
//   NetworkResult<UserResponse> tradingInfo(FormData request);
}
