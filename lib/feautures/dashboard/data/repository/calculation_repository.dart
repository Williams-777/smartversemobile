import 'package:smartversemobile/core/network/api_client.dart';

import '../models/calculation_detail.dart';
import '../models/calculation_request.dart';
import '../models/calculation_result.dart';

class CalculationRepository {
  final _dio = ApiClient.instance.dio;

  Future<CalculationResult> calculate(CalculationRequest request) async {
    try {
      final response = await _dio.post('/calculations', data: request.toJson());
      return CalculationResult.fromJson(response.data['data'] as Map<String, dynamic>);
    } catch (e) {
      ApiClient.instance.handleError(e);
    }
  }

  Future<String> saveCalculation({required String calculationId, required String label}) async {
    try {
      final response = await _dio.post('/user/calculations', data: {"calculationId": calculationId, "label": label});
      return response.data['data']['id'] as String;
    } catch (e) {
      ApiClient.instance.handleError(e);
    }
  }

  Future<List<CalculationDetail>> getSavedCalculations() async {
    try {
      final response = await _dio.get('/user/calculations');
      final list = response.data['data'] as List;
      return list.map((json) => CalculationDetail.fromJson(json as Map<String, dynamic>)).toList();

    } catch (e) {
      ApiClient.instance.handleError(e);
    }
  }

  Future<CalculationDetail> getSavedCalculationDetail(String id) async {
    try {
      final response = await _dio.get('/user/calculations/$id');
      // print('DEBUG raw detail response: ${response.data}');
      return CalculationDetail.fromJson(response.data['data'] as Map<String, dynamic>);
    } catch (e) {
      ApiClient.instance.handleError(e);
    }
  }
  Future<void> deleteCalculation(String id) async {
    await _dio.delete('/user/calculations/$id');
  }
}

