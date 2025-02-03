import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projeto_final/core/constants/paths.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  Timer? _timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _timer = Timer(const Duration(seconds: 3), (){
      Navigator.pushNamed(context, wrapper);
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _timer?.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            loading,
            height: 1.sh,
            width: 1.sw,
            fit: BoxFit.fill,
          ),
          Center(
            child: Image.asset(
              logo,
              height: 250,
              width: 250,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
