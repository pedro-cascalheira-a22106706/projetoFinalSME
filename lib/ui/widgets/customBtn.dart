import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projeto_final/core/constants/colors.dart';
import 'package:projeto_final/core/constants/styles.dart';

class CustomButton extends StatelessWidget{
  const CustomButton({
    super.key,
    this.onPressed,
    this.btnText,
    this.loading=false,
  });

  final void Function()? onPressed;
  final String? btnText;
  final bool? loading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw*0.75,
      height: 40.h,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: primary),
          onPressed: onPressed,
          child: loading!?Center(child: CircularProgressIndicator(color: white,),):Text(btnText!, style: body.copyWith(color: white),)
      ),
    );
  }
}