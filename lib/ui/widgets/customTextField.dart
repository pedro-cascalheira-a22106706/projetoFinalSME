import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projeto_final/core/constants/colors.dart';
import 'package:projeto_final/core/constants/styles.dart';

class CustomTextField extends StatelessWidget{
  const CustomTextField({
    super.key,
    this.onChanged,
    this.hintText,
    this.focusNode
  });

  final void Function(String)? onChanged;
  final String? hintText;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      focusNode: focusNode,
      decoration: InputDecoration(
        filled: true,
        fillColor: secondary.withValues(alpha: 0.25),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15.r)
        ),
        hintText: hintText,
        hintStyle: body.copyWith(color: secondary),
      ),
    );
  }
}