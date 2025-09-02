import 'package:car_rental/data/datasources/firebase_car_data_sources.dart';
import 'package:car_rental/data/model/car.dart';
import 'package:car_rental/domain/repository/car_repository.dart';

class CarRepositoryImpl implements CarRepository {
  final FirebaseCarDataSources dataSources;

  CarRepositoryImpl(this.dataSources);

  @override
  Future<List<Car>> fetchAllCars() {
    return dataSources.getCars();
  }
}
