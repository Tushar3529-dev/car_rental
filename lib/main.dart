import 'package:car_rental/firebase_options.dart';
import 'package:car_rental/injection_container.dart';
import 'package:car_rental/presentation/bloc/car_bloc.dart';

import 'package:car_rental/presentation/pages/onboarding_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Hide both status bar (top) and navigation bar (bottom)
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CarBloc>()..add(LoadCars()),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: OnboardingPage(),
      ),
    );
  }
}
