class CalculationRequestItem {
  final String applianceId;
  final int quantity;
  final int wattage;
  final int hoursPerDay;

  const CalculationRequestItem({
    required this.applianceId,
    required this.quantity,
    required this.wattage,
    required this.hoursPerDay,
  });

  Map<String, dynamic> toJson() => {
    "applianceId": applianceId,
    "quantity": quantity,
    "wattage": wattage,
    "hoursPerDay": hoursPerDay,
  };
}

class CalculationRequest {
  final String usageMode;
  final int backupHours;
  final List<CalculationRequestItem> items;

  const CalculationRequest({
    required this.usageMode,
    required this.backupHours,
    required this.items,
  });


  Map<String, dynamic> toJson() => {
    "usageMode": usageMode,
    "backupHours": backupHours,
    "items": items.map((i) => i.toJson()).toList(),
  };
}