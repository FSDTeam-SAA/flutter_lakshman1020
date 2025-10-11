import 'package:get/get.dart';

import '../../features/auth/users/data/repo/auth_repo_impl.dart';
import '../../features/auth/users/domain/repo/auth_repo.dart';


void setupRepository() {
  Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(apiClient: Get.find()));

}
