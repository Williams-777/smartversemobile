import 'calculation_result.dart';

class CalculationDetail {
  final String id;
  final String calculationId;
  final String label;
  final DateTime createdAt;
  final CalculationResult result;

  const CalculationDetail({
    required this.id,
    required this.calculationId,
    required this.label,
    required this.createdAt,
    required this.result,
  });

  factory CalculationDetail.fromJson(Map<String, dynamic> json) => CalculationDetail(
    id: json['id'] as String,
    calculationId: json['calculationId'] as String,
    label: json['label'] as String,
    createdAt: DateTime.parse(json['createdAt'] as String),
    result: CalculationResult.fromJson(json['calculationResult'] as Map<String, dynamic>),
  );
}

extension CalculationDetailDisplay on CalculationDetail {
  String get modeText => result.recommendation.solar.panelCount > 0 ? "Off-grid" : "Backup";
  int get distinctApplianceCount => result.breakdown.length;
}