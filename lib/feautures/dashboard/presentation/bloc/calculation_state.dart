
import 'package:smartversemobile/feautures/dashboard/data/models/calculation_result.dart';

import '../../data/models/calculation_detail.dart';

enum CalculationStatus { idle, loading, loaded, error }

class CalculationState {
  const CalculationState({
    this.status = CalculationStatus.idle,
    this.backupHours = 6,
    this.usageMode = "OFF_GRID",
    this.result,
    this.errorMessage,
    this.savedCalculations = const [],
    this.viewingDetail,
  });

  final CalculationStatus status;
  final int backupHours;
  final String usageMode;
  final CalculationResult? result;
  final String? errorMessage;
  final List<CalculationDetail> savedCalculations;
  final CalculationDetail? viewingDetail;

  CalculationState copyWith({
    CalculationStatus? status,
    int? backupHours,
    String? usageMode,
    CalculationResult? result,
    String? errorMessage,
    List<CalculationDetail>? savedCalculations,
    CalculationDetail? viewingDetail,
  }) {
    return CalculationState(
      status: status ?? this.status,
      backupHours: backupHours ?? this.backupHours,
      usageMode: usageMode ?? this.usageMode,
      result: result ?? this.result,
      errorMessage: errorMessage,
      savedCalculations: savedCalculations ?? this.savedCalculations,
      viewingDetail: viewingDetail ?? this.viewingDetail,
    );
  }
}
