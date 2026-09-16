class CalculationSummary {
  final int totalRunningLoadWatts;
  final int peakLoadWatts;
  final int dailyEnergyWh;

  const CalculationSummary({required this.totalRunningLoadWatts, required this.peakLoadWatts, required this.dailyEnergyWh});

  factory CalculationSummary.fromJson(Map<String, dynamic> json) => CalculationSummary(
    totalRunningLoadWatts: (json['totalRunningLoadWatts'] as num).toInt(),
    peakLoadWatts: (json['peakLoadWatts'] as num).toInt(),
    dailyEnergyWh: (json['dailyEnergyWh'] as num).toInt(),
  );
}

class BatteryRecommendation {
  final int systemVoltage;
  final int capacityAh;
  final num energyKwh;
  final int dodPercentage;

  const BatteryRecommendation({required this.systemVoltage, required this.capacityAh, required this.energyKwh, required this.dodPercentage});

  factory BatteryRecommendation.fromJson(Map<String, dynamic> json) => BatteryRecommendation(
    systemVoltage: (json['systemVoltage'] as num).toInt(),
    capacityAh: (json['capacityAh'] as num).toInt(),
    energyKwh: json['energyKwh'] as num,
    dodPercentage: (json['dodPercentage'] as num).toInt(),
  );
}

class SolarRecommendation {
  final num capacityKw;

  final int panelCount;
  final int panelWatts;

  const SolarRecommendation({required this.capacityKw, required this.panelCount, required this.panelWatts});

  factory SolarRecommendation.fromJson(Map<String, dynamic> json) => SolarRecommendation(
    capacityKw: json['capacityKw'] as num,
    panelCount: (json['panelCount'] as num).toInt(),
    panelWatts: (json['panelWatts'] as num).toInt(),
  );
}

class Recommendation {
  final num inverterKva;
  final BatteryRecommendation battery;
  final SolarRecommendation solar;

  const Recommendation({required this.inverterKva, required this.battery, required this.solar});

  factory Recommendation.fromJson(Map<String, dynamic> json) => Recommendation(
    inverterKva: json['inverterKva'] as num,
    battery: BatteryRecommendation.fromJson(json['battery'] as Map<String, dynamic>),
    solar: SolarRecommendation.fromJson(json['solar'] as Map<String, dynamic>),
  );
}

class BreakdownItem {
  final String applianceName;
  final int quantity;
  final int wattage;
  final int runningWatts;
  final num hoursPerDay;

  final num dailyEnergyWh;
  final int surgeWatts;
  final bool surgeApplicable;

  const BreakdownItem({
    required this.applianceName,
    required this.quantity,
    required this.wattage,
    required this.runningWatts,
    required this.hoursPerDay,
    required this.dailyEnergyWh,
    required this.surgeWatts,
    required this.surgeApplicable,
  });

  factory BreakdownItem.fromJson(Map<String, dynamic> json) => BreakdownItem(
    applianceName: json['applianceName'] as String,
    quantity: (json['quantity'] as num).toInt(),
    wattage: (json['wattage'] as num).toInt(),
    runningWatts: (json['runningWatts'] as num).toInt(),
    hoursPerDay: json['hoursPerDay'] as num,
    dailyEnergyWh: json['dailyEnergyWh'] as num,
    surgeWatts: (json['surgeWatts'] as num).toInt(),
    surgeApplicable: json['surgeApplicable'] as bool,
  );
}

class CalculationResult {
  final String calculationId;
  final String calculationVersion;
  final CalculationSummary summary;
  final Recommendation recommendation;

  final List<BreakdownItem> breakdown;

  const CalculationResult({
    required this.calculationId,
    required this.calculationVersion,
    required this.summary,
    required this.recommendation,
    required this.breakdown,
  });

  factory CalculationResult.fromJson(Map<String, dynamic> json) => CalculationResult(
    calculationId: json['calculationId'] as String,
    calculationVersion: json['calculationVersion'] as String,
    summary: CalculationSummary.fromJson(json['summary'] as Map<String, dynamic>),
    recommendation: Recommendation.fromJson(json['recommendation'] as Map<String, dynamic>),
    breakdown: (json['breakdown'] as List).map((b) => BreakdownItem.fromJson(b as Map<String, dynamic>)).toList(),
  );
}