import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_ring_app/core/theming/theming_bloc/themeing_cubit.dart';
import 'package:medical_ring_app/medical_ring_app.dart';
// Created By Mohamed Elrashidy
void main() {

  runApp(
    BlocProvider(create: (context)=>ThemingCubit(),child: const MedicalRingApp(),)
  );
}