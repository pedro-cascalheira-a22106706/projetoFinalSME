import 'package:flutter/material.dart';
import 'package:projeto_final/core/constants/paths.dart';
import 'package:projeto_final/ui/screens/init/init_screen.dart';


class RouteUtils {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case init:
        return MaterialPageRoute(builder: (context) => InitScreen());
      //case home:
      //  return MaterialPageRoute(builder: (context) => HomeScreen());
      default:
        return MaterialPageRoute(builder: (context) => Scaffold(
            body:Center(
                child: Text("Route Error")
            ),
          ),
        );
    }
  }
}