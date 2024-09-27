import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_ring_app/core/parameters/text_field_parameters.dart';

import '../theming/my_app_colors.dart';
import '../theming/text_styles.dart';
import '../theming/theme_colors.dart';
import 'vertical_space.dart';

class MyAppTextField extends StatefulWidget {
  MyAppTextField({required this.parameters, super.key});
  TextFieldParameters parameters;

  @override
  State<MyAppTextField> createState() => _MyAppTextFieldState();
}

class _MyAppTextFieldState extends State<MyAppTextField> {
  FocusNode focusNode = FocusNode();
  bool isSecure = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.parameters.isPassword) {
      isSecure = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [titleSection(), textFieldSection()],
    );
  }

  Widget titleSection() {
    return (widget.parameters.title != null)
        ? Column(
            children: [
              Text(
                widget.parameters.title!,
                style: MyAppTextStyle.secondaryTitle,
              ),
              VerticalSpace(height: 16)
            ],
          )
        : Container();
  }

  Widget textFieldSection() {
    return TextFormField(
      maxLines: widget.parameters.maxLines,

      focusNode: focusNode,
      onTapOutside: (PointerDownEvent event) {
        focusNode.unfocus();
      },
      controller: widget.parameters.controller,
      onChanged: widget.parameters.onChanged,
      keyboardType: widget.parameters.keyboardType,
      obscureText: isSecure,
      decoration: InputDecoration(
        hintText: widget.parameters.hint,
        hintStyle: MyAppTextStyle.hint,

        suffixIcon: getSuffixIcon(),
        prefixIcon: getPrefixIcon(),
        filled: true,
        fillColor: widget.parameters.filledColor??ThemeColors.smallContainer.color,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:
                BorderSide(color: ThemeColors.borderGreyDarkWhite.color)),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: ThemeColors.borderGreyDarkWhite.color),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: ThemeColors.borderGreyDarkWhite.color),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: ThemeColors.borderGreyDarkWhite.color),
        ),
      ),
      validator: widget.parameters.validator,
    );
  }

  Widget? getSuffixIcon() {
    if (widget.parameters.suffixIcon != null) {
      return widget.parameters.suffixIcon;
    }
    if (widget.parameters.isPassword) {
      return GestureDetector(
        onTap: () {
          setState(() {
            isSecure = !isSecure;
          });
        },
        child: Icon(
            isSecure
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            size: 24.sp,
            color: MyAppColors.primary),
      );
    }
  }

  getPrefixIcon() {
    if (widget.parameters.prefixIcon != null) {
      return Padding(
          padding: EdgeInsets.all(8.sp), child: widget.parameters.prefixIcon);
    }
  }
}
