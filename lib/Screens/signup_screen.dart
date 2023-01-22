import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ticketplease/Controller/auth_controller.dart';
import 'package:ticketplease/Controller/input_validator.dart';
import 'package:ticketplease/utils/my_theme.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController =  TextEditingController();
  final emailController =TextEditingController();
  final passwordController = TextEditingController();
  final cnfpasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyTheme.splash,
      resizeToAvoidBottomInset: false,
      body: Container(
        height: _size.height,
        width: _size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/splash_icon.png",
              height: 100,
              width: 800,),

            SizedBox(height: 20,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              padding: const EdgeInsets.all(19),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)
              ),
              width: _size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Create your account",
                    style: TextStyle(
                      fontSize: 15,
                      color: MyTheme.splash,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:15),
                    child: TextFormField(
                      controller: nameController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Name",
                        hintStyle: const TextStyle(color: Colors.black45),
                        fillColor: MyTheme.greyColor,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:10),
                    child: TextFormField(
                      controller: emailController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Email Address",
                        hintStyle: const TextStyle(color: Colors.black45),
                        fillColor: MyTheme.greyColor,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:15),
                    child: TextFormField(
                      controller: passwordController,
                      style: TextStyle(color: Colors.black),
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Password",
                        hintStyle: const TextStyle(color: Colors.black45),
                        fillColor: MyTheme.greyColor,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:10,bottom: 10),
                    child: TextFormField(
                      controller: cnfpasswordController,
                      style: TextStyle(color: Colors.black),
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Confirm-Password",
                        hintStyle: const TextStyle(color: Colors.black45),
                        fillColor: MyTheme.greyColor,
                        filled: true,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async{
                      if(InputValidator.validateField("Name", nameController.text.trim()) &&
                          InputValidator.validateField("Email", emailController.text.trim())) {
                        if(InputValidator.validatePassword(passwordController.text.trim(), cnfpasswordController.text.trim()))
                          AuthController.instance.
                          registerUser(
                              emailController.text.trim(),
                              passwordController.text.trim()
                          );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: MyTheme.splash,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        )
                    ),
                    child: const Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text("Register",
                          style: TextStyle(fontSize: 16),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            RichText(
                text: TextSpan(
                    children:[
                      const TextSpan(
                        text: "Already have an account ? ",
                        style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white,),
                      ),
                      TextSpan(
                        text: "Login",
                        style: const TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.w700,color: Colors.redAccent,),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
                            Get.back();
                          },
                      ),
                    ]
                ))
          ],

        ),

      ),
    );
  }
}
