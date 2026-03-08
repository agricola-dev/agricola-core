import 'package:agricola_core/src/constants/api_constants.dart';
import 'package:agricola_core/src/models/crop_catalog_entry.dart';
import 'package:dio/dio.dart';

class CropCatalogApiService {
  final Dio _dio;

  CropCatalogApiService(this._dio);

  /// GET /api/v1/crop-catalog - fetch all active catalog entries
  Future<List<CropCatalogEntry>> getCatalog() async {
    final response = await _dio.get('/${ApiConstants.cropCatalogEndpoint}');
    final list = response.data['data'] as List<dynamic>;
    return list
        .map((json) =>
            CropCatalogEntry.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
