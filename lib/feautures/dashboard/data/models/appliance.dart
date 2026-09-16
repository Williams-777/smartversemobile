class Appliance {
  final String id;
  final String categoryId;
  final String code;
  final String name;
  final int defaultWattage;
  final int minWattage;
  final int maxWattage;
  final int defaultVoltage;
  final bool surgeApplicable;
  final int surgeMultiplier;
  final bool heavyLoad;
  final bool active;
  final String imageUrl;

  const Appliance({
    required this.id,
    required this.categoryId,
    required this.code,
    required this.name,
    required this.defaultWattage,
    required this.minWattage,
    required this.maxWattage,
    required this.defaultVoltage,
    required this.surgeApplicable,
    required this.surgeMultiplier,
    required this.heavyLoad,
    required this.active,
    required this.imageUrl,
  });

  factory Appliance.fromJson(Map<String, dynamic> json) {

    return Appliance(
      id: json['id'] as String,
      categoryId: json['categoryId'] as String,
      code: json['code'] as String,
      name: json['name'] as String,
      defaultWattage: (json['defaultWattage'] as num).toInt(),
      minWattage: (json['minWattage'] as num).toInt(),
      maxWattage: (json['maxWattage'] as num).toInt(),
      defaultVoltage: (json['defaultVoltage'] as num).toInt(),
      surgeApplicable: json['surgeApplicable'] as bool,
      surgeMultiplier: (json['surgeMultiplier'] as num).toInt(),
      heavyLoad: json['heavyLoad'] as bool,
      active: json['active'] as bool,
      imageUrl: json['imageUrl'] as String,
    );
  }
}