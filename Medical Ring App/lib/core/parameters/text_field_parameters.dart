import 'dart:core';

import 'package:flutter/cupertino.dart';

class TextFieldParameters {
  String? title;
  String hint;
  double? width;
  double? height;
  bool isPassword;
  Widget? nextWidget;
  Widget? suffixIcon;
  Widget? prefixIcon;
  TextInputType? keyboardType;
  TextEditingController controller;
  var onChanged;
  int? maxLines;
  Color? filledColor;
  // validator
  String? Function(String?)? validator;

  TextFieldParameters({
    this.title,
    required this.hint,
    this.width,
    this.height,
    this.isPassword = false,
    this.nextWidget,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    required this.controller,
    this.onChanged,
    this.maxLines=1,
    this.filledColor,
    validator,

  });






}