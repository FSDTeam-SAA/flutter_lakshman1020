import '../../domain/entities/load.dart';
import '../../domain/repositories/load_repository.dart';
import '../models/load_model.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/constants/api_constants.dart';

class LoadRepositoryImpl implements LoadRepository {
  final ApiClient _client;

  LoadRepositoryImpl({ApiClient? client}) : _client = client ?? ApiClient();

  @override
  Future<LoadEntity> getLoadById(String id) async {
    final endpoint = '${ApiConstants.baseUrl}/load/$id';

    final result = await _client.get<LoadModel>(
      endpoint,
      fromJsonT: (json) => LoadModel.fromJson(json as Map<String, dynamic>),
    );

    return result.fold((failure) {
      throw Exception('Failed to fetch load: ${failure.runtimeType}');
    }, (success) {
      return success.data;
    });
  }

  @override
  Future<LoadEntity> createLoad(Map<String, dynamic> payload) async {
    final endpoint = '${ApiConstants.baseUrl}/load/';

    final result = await _client.post<LoadModel>(
      endpoint,
      data: payload,
      fromJsonT: (json) => LoadModel.fromJson(json as Map<String, dynamic>),
    );

    return result.fold((failure) {
      throw Exception('Failed to create load: ${failure.runtimeType}');
    }, (success) {
      return success.data;
    });
  }
}
