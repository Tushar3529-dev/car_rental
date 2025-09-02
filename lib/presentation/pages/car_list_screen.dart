import 'package:car_rental/data/model/car.dart';
import 'package:car_rental/presentation/bloc/car_bloc.dart';
import 'package:car_rental/presentation/widgets/car_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarListScreen extends StatelessWidget {
  CarListScreen({super.key});

  /* final List<Car> cars = [
    Car(
      model: "Fortuner GR",
      distance: 870,
      fuelCapacity: 78,
      pricePerHour: 94,
    ),
    Car(model: "Creata", distance: 870, fuelCapacity: 78, pricePerHour: 94),
    Car(
      model: "Fortuner GR",
      distance: 870,
      fuelCapacity: 78,
      pricePerHour: 94,
    ),
  ]; */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Your Car"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: BlocBuilder<CarBloc, CarState>(
        builder: (context, state) {
          if (state is CarLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CarLoaded) {
            final cars = state.cars;
            return ListView.builder(
              itemCount: cars.length,
              itemBuilder: (context, index) {
                return CarCard(car: cars[index]);
              },
            );
          } else if (state is CarError) {
            return Center(child: Text("Error loading cars"));
          } else {
            return Center(child: Text("Unknown state"));
          }
        },
      ),
    );
  }
}
