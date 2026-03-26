import 'package:agricola_core/src/models/inventory_model.dart';
import 'package:dio/dio.dart';

class InventoryApiService {
  final Dio _dio;

  InventoryApiService(this._dio);

  /// POST /api/v1/inventory — create a new inventory item
  Future<InventoryModel> createInventory(InventoryModel item) async {
    final response = await _dio.post('/api/v1/inventory', data: item.toJson());
    return InventoryModel.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  /// GET /api/v1/inventory — get all inventory items for the authenticated user
  Future<List<InventoryModel>> getUserInventory() async {
    final response = await _dio.get('/api/v1/inventory');
    final list = response.data['data'] as List<dynamic>;
    return list.map((json) => InventoryModel.fromJson(json as Map<String, dynamic>)).toList();
  }

  /// PUT /api/v1/inventory/<id> — update an existing inventory item
  Future<InventoryModel> updateInventory(String id, InventoryModel item) async {
    final response = await _dio.put('/api/v1/inventory/$id', data: item.toJson());
    return InventoryModel.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  /// DELETE /api/v1/inventory/<id> — delete an inventory item
  Future<void> deleteInventory(String id) async {
    await _dio.delete('/api/v1/inventory/$id');
  }

  /// POST /api/v1/inventory/bulk-delete — delete multiple inventory items
  Future<int> bulkDeleteInventory(List<String> ids) async {
    final response = await _dio.post(
      '/api/v1/inventory/bulk-delete',
      data: {'ids': ids},
    );
    return response.data['data']['deletedCount'] as int;
  }

  /// PATCH /api/v1/inventory/bulk-condition — update condition on multiple items
  Future<int> bulkUpdateCondition(List<String> ids, String condition) async {
    final response = await _dio.patch(
      '/api/v1/inventory/bulk-condition',
      data: {'ids': ids, 'condition': condition},
    );
    return response.data['data']['updatedCount'] as int;
  }
}
