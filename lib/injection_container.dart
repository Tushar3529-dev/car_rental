import 'package:car_rental/data/datasources/firebase_car_data_sources.dart';
import 'package:car_rental/data/repository/car_repository_impl.dart';
import 'package:car_rental/domain/repository/car_repository.dart';
import 'package:car_rental/domain/usecases/get_cars.dart';
import 'package:car_rental/presentation/bloc/car_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void initInjection() {
  try {
    getIt.registerLazySingleton<FirebaseFirestore>(
        () => FirebaseFirestore.instance);
    getIt.registerLazySingleton<FirebaseCarDataSources>(
        () => FirebaseCarDataSources(firestore: getIt<FirebaseFirestore>()));
    getIt.registerLazySingleton<CarRepository>(
        () => CarRepositoryImpl(getIt<FirebaseCarDataSources>()));
    getIt.registerLazySingleton<GetCars>(() => GetCars(getIt<CarRepository>()));
    getIt.registerFactory(() => CarBloc(getCars: getIt<GetCars>()));
  } catch (e) {
    throw e;
  }
}
