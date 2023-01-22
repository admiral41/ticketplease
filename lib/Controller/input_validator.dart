import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ticketplease/utils/my_theme.dart';

class InputValidator{
  static bool validateField(String titile,String value){
    if(value.trim().isNotEmpty){
      return true;
    }
    Get.snackbar(
      "Error",
      "$titile is empty",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.orange,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.only(bottom: 10,left: 10,right: 10),

    );
    return false;
  }
  static bool validatePassword (String value1,String value2){
    if(value1.trim()==value2.trim()){
      return true;
    }
    Get.snackbar(
      "Error",
      "Confirm password do not match",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.orange,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.only(bottom: 10,left: 10,right: 10),

    );
    return false;
  }
}