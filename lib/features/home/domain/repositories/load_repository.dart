import '../../domain/entities/load.dart';

abstract class LoadRepository {
  /// Fetch a single load by id
  Future<LoadEntity> getLoadById(String id);

  /// Create or post a new load
  Future<LoadEntity> createLoad(Map<String, dynamic> payload);
}
