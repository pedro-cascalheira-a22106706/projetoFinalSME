import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projeto_final/core/constants/colors.dart';
import 'package:projeto_final/core/constants/paths.dart';
import 'package:projeto_final/core/constants/styles.dart';
import 'package:projeto_final/core/extension/extentions.dart';
import 'package:projeto_final/core/services/auth_service.dart';
import 'package:projeto_final/ui/screens/auth/login/login_viewmodel.dart';
import 'package:projeto_final/ui/widgets/customBtn.dart';
import 'package:projeto_final/ui/widgets/customTextField.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewmodel(AuthService()),
      child: Consumer<LoginViewmodel>(
        builder: (context, model, _) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 1.sh*0.07, horizontal: 1.sw*0.02),
              
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Login", style: heading),
                    25.verticalSpace,
                    CustomTextField(
                      hintText: "Enter Email",
                      onChanged:  model.setEmail,
                    ),
                    25.verticalSpace,
                    CustomTextField(
                      hintText: "Enter Password",
                      onChanged:  model.setPassword,
                    ),
                    40.verticalSpace,
                    CustomButton(
                      btnText: "Login",
                      onPressed: () async{
                        try{
                          await model.login();
                          context.showSnackBar("User logged in successfully!");
                          Navigator.pushNamed(context, home);
                        }on FirebaseAuthException catch(e){
                          context.showSnackBar(e.toString());
                        }catch (e){
                          context.showSnackBar(e.toString());
                        }
                      },
                    ),
                    25.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?", style: body.copyWith(color: secondary),),
                        InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, signup);
                            },
                            child: Text("\tSignup", style: body.copyWith(color: black, fontWeight: FontWeight.bold))
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
