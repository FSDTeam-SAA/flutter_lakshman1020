import 'package:get/get.dart';

import '../../features/auth/users/presentation/controller/auth_controller.dart';


void setupController() {
  // Auth Controller
  Get.lazyPut<AuthController>(() => AuthController(Get.find(), Get.find()), fenix: true);

}
