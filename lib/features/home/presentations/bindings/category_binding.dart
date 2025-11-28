import 'package:get/get.dart';

import '../../../../core/network/api_client.dart';
import '../../data/datasources/category_remote_datasource.dart';
import '../../data/repositories/category_repository_impl.dart';
import '../../domain/repositories/category_repository.dart';
import '../controllers/category_controller.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    // API Client
    Get.lazyPut<ApiClient>(
      () => ApiClient(),
      fenix: true,
    );

    // Data source
    Get.lazyPut<CategoryRemoteDataSource>(
      () => CategoryRemoteDataSourceImpl(apiClient: Get.find<ApiClient>()),
    );

    // Repository
    Get.lazyPut<CategoryRepository>(
      () => CategoryRepositoryImpl(
        remoteDataSource: Get.find<CategoryRemoteDataSource>(),
      ),
    );

    // Controller
    Get.lazyPut<CategoryController>(
      () => CategoryController(repository: Get.find<CategoryRepository>()),
    );
  }
}