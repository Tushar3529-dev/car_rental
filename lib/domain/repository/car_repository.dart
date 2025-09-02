import 'package:car_rental/data/model/car.dart';

abstract class CarRepository {
  Future<List<Car>> fetchAllCars();
}
