import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_ring_app/core/theming/theming_bloc/themeing_cubit.dart';
import 'package:medical_ring_app/medical_ring_app.dart';

import 'firebase_options.dart';

// Created By Mohamed Elrashidy
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(BlocProvider(
      create: (context) => ThemingCubit(), child: const MedicalRingApp()));
}
