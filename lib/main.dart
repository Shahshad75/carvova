import 'package:carnova/bloc/vehicle_bloc.dart';
import 'package:carnova/firebase_options.dart';
import 'package:carnova/view/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VehicleBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Carnova',
        home: HomeScreen(),
      ),
    );
  }
}
