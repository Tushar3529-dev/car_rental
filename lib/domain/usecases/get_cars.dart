import 'package:car_rental/data/model/car.dart';
import 'package:car_rental/domain/repository/car_repository.dart';

class GetCars {
  final CarRepository carRepository;

  GetCars(this.carRepository);

  Future<List<Car>> call() {
    return carRepository.fetchAllCars();
  }
}
