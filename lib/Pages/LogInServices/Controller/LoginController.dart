
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tpappmobile/Pages/HomeServices/View/homepage.dart';
import 'package:tpappmobile/Pages/LogInServices/Model/user.dart';
import 'package:tpappmobile/Sqlite/sqlite.dart';

class LoginController {
  DatabaseHelper db = DatabaseHelper();

  void login(String username, String pwd)async{
    if(username!=""){
      if(pwd!=""){
        Users user = Users(
          usrName: username,
          usrPassword: pwd,
        );

        bool result  = await db.login(user);
        if(result){
          Get.offAll(homepage());
        }else{
          Get.snackbar("your email or password is not correct !",
            "", colorText: Colors.white , backgroundColor: Colors.red,
            snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.only(bottom: 20, left: 10, right: 10,),
          );
        }
      }else{
        Get.snackbar("You have to enter your password",
            "", colorText: Colors.white , backgroundColor: Colors.red,
            snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.only(bottom: 20, left: 10, right: 10,),
        );
      }
    }else{
      Get.snackbar("You have to enter your username",
        "", colorText: Colors.white , backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.only(bottom: 20, left: 10, right: 10,),
      );
    }
  }


  void register(String username, String pwd, )async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(username!=""){
      if(pwd!=""){
        Users user = Users(
          usrName: username,
          usrPassword: pwd,
        );

        bool result  = await db.signup(user);

        if(result){
          Get.snackbar("You have regitered succesfully , just log in now !",
            "", colorText: Colors.white , backgroundColor: Colors.green,
            snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.only(bottom: 20, left: 10, right: 10,),
          );
        }else{
          Get.snackbar("your username is used before try new one !",
            "", colorText: Colors.white , backgroundColor: Colors.red,
            snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.only(bottom: 20, left: 10, right: 10,),
          );
        }
      }else{
        Get.snackbar("You have to enter your password",
          "", colorText: Colors.white , backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.only(bottom: 20, left: 10, right: 10,),
        );
      }
    }else{
      Get.snackbar("You have to enter your username",
        "", colorText: Colors.white , backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.only(bottom: 20, left: 10, right: 10,),
      );
    }


  }


}