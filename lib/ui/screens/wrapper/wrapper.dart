import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projeto_final/ui/screens/auth/login/login_screen.dart';
import 'package:projeto_final/ui/screens/home/HomeScreen.dart';

class WrapperScreen extends StatelessWidget {
  const WrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          final user = snapshot.data;

          if(user==null){
            return LoginScreen();
          }else{
            return HomeScreen(uid: user.uid,);
          }
        }
    );
  }
}
