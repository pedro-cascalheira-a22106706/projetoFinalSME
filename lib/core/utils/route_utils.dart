import 'package:flutter/material.dart';
import 'package:projeto_final/core/constants/paths.dart';
import 'package:projeto_final/ui/screens/auth/login/login_screen.dart';
import 'package:projeto_final/ui/screens/auth/signup/signup_screen.dart';
import 'package:projeto_final/ui/screens/home/HomeScreen.dart';
import 'package:projeto_final/ui/screens/init/init_screen.dart';
import 'package:projeto_final/ui/screens/wrapper/wrapper.dart';


class RouteUtils {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch(settings.name){
      //initial screen
      case init:
        return MaterialPageRoute(builder: (context) => InitScreen());
      case wrapper:
        return MaterialPageRoute(builder: (context) => WrapperScreen());
      //home screen
      case home:
        return MaterialPageRoute(builder: (context) => HomeScreen(uid: args as String,));
      //auth
      case signup:
        return MaterialPageRoute(builder: (context) => SignupScreen());
      case login:
        return MaterialPageRoute(builder: (context) => LoginScreen());
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