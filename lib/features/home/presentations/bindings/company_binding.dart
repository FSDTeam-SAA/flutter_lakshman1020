import 'package:get/get.dart';

import '../../../../core/network/api_client.dart';
import '../../data/datasources/company_remote_datasource.dart';
import '../../data/repositories/company_repository_impl.dart';
import '../../domain/repositories/company_repository.dart';
import '../controllers/company_controller.dart';

class CompanyBinding extends Bindings {
  @override
  void dependencies() {
    // API Client
    Get.lazyPut<ApiClient>(
      () => ApiClient(),
      fenix: true,
    );

    // Data source
    Get.lazyPut<CompanyRemoteDataSource>(
      () => CompanyRemoteDataSourceImpl(apiClient: Get.find<ApiClient>()),
    );

    // Repository
    Get.lazyPut<CompanyRepository>(
      () => CompanyRepositoryImpl(
        remoteDataSource: Get.find<CompanyRemoteDataSource>(),
      ),
    );

    // Controller
    Get.lazyPut<CompanyController>(
      () => CompanyController(repository: Get.find<CompanyRepository>()),
    );
  }
}