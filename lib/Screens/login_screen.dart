import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ticketplease/Controller/auth_controller.dart';
import 'package:ticketplease/Screens/signup_screen.dart';
import 'package:ticketplease/utils/my_theme.dart';
import 'package:ticketplease/utils/social_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final forgotEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: MyTheme.splash,
      resizeToAvoidBottomInset: false,
      body: Container(
        height: _size.height,
        width: _size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/splash_icon.png",
              height: 100,
              width: 800,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Welcome Buddies",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              "Login to book your seat, I said it's your seat",
              style: TextStyle(
                fontSize: 15,
                color: Colors.white.withOpacity(0.7),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              padding: const EdgeInsets.all(19),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              width: _size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Login to your account",
                    style: TextStyle(
                      fontSize: 15,
                      color: MyTheme.splash,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: TextFormField(
                      controller: emailController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Email",
                        hintStyle: const TextStyle(color: Colors.black45),
                        fillColor: MyTheme.greyColor,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Get.defaultDialog(
                            title: "Forgot Password",
                            content: TextFormField(
                              controller: forgotEmailController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: "Email Address",
                                hintStyle:
                                const TextStyle(color: Colors.black),
                                fillColor: MyTheme.greyColor,
                                filled: true,
                              ),
                              style: TextStyle(color: Colors.black),
                            ),
                            radius: 10,
                            onWillPop: () {
                              forgotEmailController.text = "";
                              return Future.value(true);
                            },
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            confirm: ElevatedButton(
                                onPressed: () {
                                  AuthController.instance.forgorPassword(forgotEmailController.text.trim());
                                  forgotEmailController.text = "";
                                  Get.back();
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: MyTheme.splash,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Text(
                                      "Send Reset Mail",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                )));
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      AuthController.instance.LoginUser(
                          emailController.text.trim(),
                          passwordController.text.trim());
                    },
                    style: ElevatedButton.styleFrom(
                        primary: MyTheme.splash,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        )),
                    child: const Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          "LOGIN",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: const Text(
                            "Or",
                            style: TextStyle(color: Color(0xFFC1C1C1)),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                              thickness: 0.5,
                              color: Colors.black.withOpacity(0.3)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: SocialLoginButton(
                        onfbClick: () {},
                        onGoogleClick: () {
                          AuthController.instance.googleLogin();
                        }),
                  )
                ],
              ),
            ),
            RichText(
                text: TextSpan(children: [
                  const TextSpan(
                    text: "Don't have an account ? ",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: "Sign up",
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w700,
                      color: Colors.redAccent,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Navigator.push(context, MaterialPageRoute(builder: (_) => SignUpScreen()));
                        Get.to(SignUpScreen());
                      },
                  ),
                ]))
          ],
        ),
      ),
    );
  }
}
