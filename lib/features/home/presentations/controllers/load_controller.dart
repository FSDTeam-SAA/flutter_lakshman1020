import 'package:get/get.dart';

import '../../data/repositories/load_repository_impl.dart';
import '../../data/models/load_model.dart';

class LoadController extends GetxController {
  final LoadRepositoryImpl repository;

  LoadController({required this.repository});

  final Rxn<LoadModel> load = Rxn<LoadModel>();
  final RxBool isLoading = false.obs;

  Future<void> fetchLoadById(String id) async {
    try {
      isLoading.value = true;
      final result = await repository.getLoadById(id);
      if (result is LoadModel) {
        load.value = result;
      }
    } catch (e) {
      // handle or rethrow
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> createLoad(Map<String, dynamic> payload) async {
    try {
      isLoading.value = true;
      final result = await repository.createLoad(payload);
      if (result is LoadModel) {
        load.value = result;
      }
    } catch (e) {
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }
}
