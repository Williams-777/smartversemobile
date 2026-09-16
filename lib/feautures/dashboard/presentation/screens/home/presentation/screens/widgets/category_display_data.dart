class CategoryDisplayData {
  final String imageAsset;
  final String subtitle;

  const CategoryDisplayData({required this.imageAsset, required this.subtitle});

  static const _map = {
    "Kitchen": CategoryDisplayData(imageAsset: "assets/images/🍳.png", subtitle: "Fridge, microwave, iron..."),
    "Living Room": CategoryDisplayData(imageAsset: "assets/images/🛋️.png", subtitle: "TV, fans, decoder…"),
    "Bedroom": CategoryDisplayData(imageAsset: "assets/images/🛏️.png", subtitle: "Fan, bulbs, laptop..."),
    "Office & Study": CategoryDisplayData(imageAsset: "assets/images/💼.png", subtitle: "AC, PC, printer..."),
  };

  static bool isSupported(String name) => _map.containsKey(name);

  static CategoryDisplayData forName(String name) =>
      _map[name] ?? const CategoryDisplayData(imageAsset: "assets/images/🍳.png", subtitle: "Various appliances");
}