import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projeto_final/core/constants/colors.dart';
import 'package:projeto_final/core/constants/paths.dart';
import 'package:projeto_final/core/constants/styles.dart';
import 'package:projeto_final/core/extension/extentions.dart';
import 'package:projeto_final/core/services/auth_service.dart';
import 'package:projeto_final/core/services/db_service.dart';
import 'package:projeto_final/ui/screens/auth/signup/signup_viewmodel.dart';
import 'package:projeto_final/ui/widgets/customBtn.dart';
import 'package:projeto_final/ui/widgets/customTextField.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignupViewmodel>(
      create: (context) => SignupViewmodel(AuthService(), DataBaseService()),
      child: Consumer<SignupViewmodel>(
        builder: (context, model, _) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 1.sh*0.07, horizontal: 1.sw*0.05),
              
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Create Account", style: heading),
                    Text("Fill all the boxes below", style: smallText.copyWith(color: secondary),),
                    25.verticalSpace,
                    InkWell(
                      onTap: () {
                        model.pickImage();
                      },
                      child: model.image==null?CircleAvatar(
                        radius: 40.r,
                        child: Icon(Icons.camera_alt),
                      ):CircleAvatar(
                        radius: 40.r,
                        backgroundImage: FileImage(model.image!),
                      ),
                    ),
                    25.verticalSpace,
                    CustomTextField(
                      hintText: "Enter Name",
                      onChanged:  model.setName,
                    ),
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
                    25.verticalSpace,
                    CustomTextField(
                      hintText: "Confirm Password",
                      onChanged:  model.setPassword,
                    ),
                    40.verticalSpace,
                    CustomButton(
                      btnText: "Sign Up",
                      onPressed: () async{
                        try{
                          await model.signup();
                          context.showSnackBar("User signed up successfully!");
                          Navigator.pop(context);
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
                        Text("Already have an account?", style: body.copyWith(color: secondary),),
                        InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, login);
                            },
                            child: Text("\tLogin", style: body.copyWith(color: black, fontWeight: FontWeight.bold))
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

