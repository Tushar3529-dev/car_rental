class Car {
  final String model;
  final double distance;
  final double fuelCapacity;
  final double pricePerHour;

  Car({
    required this.model,
    required this.distance,
    required this.fuelCapacity,
    required this.pricePerHour,
  });

  factory Car.fromFirestore(Map<String, dynamic> data) {
    return Car(
      model: data['model'] ?? '',
      distance: (data['distance'] ?? 0).toDouble(),
      fuelCapacity: (data['fuelCapacity'] ?? 0).toDouble(),
      pricePerHour: (data['pricePerHour'] ?? 0).toDouble(),
    );
  }
}
