import 'package:smartversemobile/core/network/api_client.dart';

import '../models/calculation_request.dart';
import '../models/calculation_result.dart';

class CalculationRepository {
  final _dio = ApiClient.instance.dio;

  Future<CalculationResult> calculate(CalculationRequest request) async {
    final response = await _dio.post('/calculations', data: request.toJson());
    return CalculationResult.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  Future<void> saveCalculation({required String calculationId, required String label}) async {
    await _dio.post('/user/calculations', data: {"calculationId": calculationId, "label": label});
  }
}