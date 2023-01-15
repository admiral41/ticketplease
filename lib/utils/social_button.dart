import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticketplease/utils/my_theme.dart';

class SocialLoginButton extends StatelessWidget {
  final Function() onGoogleClick;
  final Function() onfbClick;
  const SocialLoginButton(
      {Key? key, required this.onfbClick, required this.onGoogleClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Material(
            color: MyTheme.redLight,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: const BorderSide(color: MyTheme.redBorder,width: 0.2)

            ),
            child: InkWell(
              onTap: onGoogleClick,
              borderRadius: BorderRadius.circular(5),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/images/google.svg"),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text("Google",style: TextStyle(color: Color(0xFF666666),fontWeight: FontWeight.w600,fontSize: 16
                    ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10,
        ),
        Expanded(
          child: Material(
            color: MyTheme.blueLight,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: const BorderSide(color: MyTheme.blueBorder,width: 0.2)

            ),
            child: InkWell(
              onTap: onfbClick,
              borderRadius: BorderRadius.circular(5),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/images/facebook.svg"),
                    const SizedBox(
                      width: 8,
                    ),
                    Text("Facebook",style: TextStyle(color: Color(0xFF666666),fontWeight: FontWeight.w600,fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
