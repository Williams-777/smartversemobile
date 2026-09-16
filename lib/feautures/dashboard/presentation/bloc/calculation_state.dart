
import 'package:smartversemobile/feautures/dashboard/data/models/calculation_result.dart';

enum CalculationStatus { idle, loading, loaded, error }

class CalculationState {
  const CalculationState({
    this.status = CalculationStatus.idle,
    this.backupHours = 6,
    this.usageMode = "OFF_GRID",
    this.result,
    this.errorMessage,
  });

  final CalculationStatus status;
  final int backupHours;
  final String usageMode;
  final CalculationResult? result;
  final String? errorMessage;

  CalculationState copyWith({
    CalculationStatus? status,
    int? backupHours,
    String? usageMode,
    CalculationResult? result,
    String? errorMessage,
  }) {
    return CalculationState(
      status: status ?? this.status,
      backupHours: backupHours ?? this.backupHours,
      usageMode: usageMode ?? this.usageMode,
      result: result ?? this.result,
      errorMessage: errorMessage,

    );
  }
}