import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartversemobile/feautures/dashboard/data/models/calculation_request.dart';
import '../../data/repository/calculation_repository.dart';
import 'appliance_state.dart';
import 'calculation_state.dart';

class CalculationCubit extends Cubit<CalculationState> {
  CalculationCubit(this._repository) : super(const CalculationState());

  final CalculationRepository _repository;

  void setBackupHours(int hours) => emit(state.copyWith(backupHours: hours));

  void setUsageMode(String mode) => emit(state.copyWith(usageMode: mode));

  Future<void> calculate(ApplianceState applianceState) async {
    emit(state.copyWith(status: CalculationStatus.loading));
    try {
      final items = <CalculationRequestItem>[];
      for (final appliance in applianceState.appliances) {
        final qty = applianceState.quantityOf(appliance.id);
        if (qty > 0) {
          items.add(CalculationRequestItem(
            applianceId: appliance.id,
            quantity: qty,
            wattage: applianceState.wattageOf(appliance),
            hoursPerDay: 24,
          ));
        }
      }


      final request = CalculationRequest(
        usageMode: state.usageMode,
        backupHours: state.backupHours,
        items: items,
      );

      final result = await _repository.calculate(request);
      emit(state.copyWith(status: CalculationStatus.loaded, result: result));
    } catch (e) {
      debugPrint("Calculation failed: $e");
      emit(state.copyWith(status: CalculationStatus.error, errorMessage: e.toString()));
    }
  }

  Future<bool> saveCalculation(String label) async {
    if (state.result == null) return false;
    try {
      await _repository.saveCalculation(calculationId: state.result!.calculationId, label: label);
      return true;
    } catch (e) {
      debugPrint("Save calculation failed: $e");
      return false;
    }
  }
}