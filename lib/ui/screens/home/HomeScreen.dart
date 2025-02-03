import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:projeto_final/core/services/auth_service.dart';
import 'package:projeto_final/core/services/db_service.dart';
import 'package:projeto_final/ui/screens/home/home_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.uid
  });
  final String uid;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewmodel(DataBaseService(), uid),
      child: Consumer<HomeViewmodel>(
        builder: (context, model, _) {
          return Scaffold(
            body: Center(
              child: model.user == null?CircularProgressIndicator():InkWell(
                  onTap: (){
                      AuthService().logout();
                    },
                  child: Text(model.user.toString()))
            ),
          );
        }
      ),
    );
  }
}
