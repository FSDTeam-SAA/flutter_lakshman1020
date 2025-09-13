import 'package:get/get.dart';

class FAQController extends GetxController {
  // tracks if the FAQ is expanded or collapsed
  var isExpanded = false.obs;

  void expand() => isExpanded.value = true;
  void collapse() => isExpanded.value = false;
}
