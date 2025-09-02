import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:bloc/bloc.dart';
import 'package:car_rental/data/model/car.dart';
import 'package:car_rental/domain/usecases/get_cars.dart';

part 'car_event.dart';
part 'car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final GetCars getCars;
  CarBloc({required this.getCars}) : super(CarLoading()) {
    on<LoadCars>((event, emit) async {
      emit(CarLoading());
      try {
        final cars = await getCars().call();
        emit(CarLoaded(cars));
      } catch (e) {
        emit(CarError(e.toString()));
      }
    });
  }
}
