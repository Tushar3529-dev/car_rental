import 'package:car_rental/data/model/car.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCarDataSources {
  final FirebaseFirestore firestore;

  FirebaseCarDataSources({required this.firestore});

  Future<List<Car>> getCars() async {
    var snapshot = await firestore.collection("cars").get();
    return snapshot.docs.map((doc) => Car.fromFirestore(doc.data())).toList();
  }
}
