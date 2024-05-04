import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tpappmobile/Pages/HomeServices/View/homepage.dart';
import 'package:tpappmobile/Pages/LogInServices/Controller/LoginController.dart';
import 'package:tpappmobile/Shared/Styles.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  LoginController logincontroller = LoginController();
  bool _isLogin = true;
  String _username = "";
  String _password = "";
  String _confirmpassword = "";
  FontStyles styles  = FontStyles();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(_isLogin? "lib/res/LogIn.png" : "lib/res/SingUp.png", fit: BoxFit.fill,),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).size.height*0.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.07,
                    width: MediaQuery.of(context).size.width*0.8,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: TextField(
                      onChanged: (val)=>_username = val,
                      decoration: InputDecoration(
                        hintText: 'User Name',
                        border: InputBorder.none,
                        hintStyle: FontStyles.defaultStyle,
                        isCollapsed: true,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                  Container(
                    height: MediaQuery.of(context).size.height*0.07,
                    width: MediaQuery.of(context).size.width*0.8,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: TextField(
                      onChanged: (val)=>_password = val,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: InputBorder.none,
                        hintStyle: FontStyles.defaultStyle,
                        isCollapsed: true,
                      ),
                    ),
                  ),
                  _isLogin? SizedBox(height: MediaQuery.of(context).size.height*0.02,) : SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                  _isLogin? Container(height: MediaQuery.of(context).size.height*0.07, width: MediaQuery.of(context).size.width*0.8,) :
                  Container(
                    height: MediaQuery.of(context).size.height*0.07,
                    width: MediaQuery.of(context).size.width*0.8,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: TextField(
                      onChanged: (val)=>_confirmpassword = val,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        border: InputBorder.none,
                        hintStyle: FontStyles.defaultStyle,
                        isCollapsed: true,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: ()async{
                          if(!_isLogin){
                            setState(() {
                              _isLogin = true;
                            });
                          }else{
                            logincontroller.login(_username, _password);
                          }

                          //Get.to(homepage());
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height*0.07,
                          width: MediaQuery.of(context).size.width*0.35,
                          decoration: BoxDecoration(
                            color: Colors.white,
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: Center(
                              child: Text("Log in",
                                style: FontStyles.defaultStyle,)),
                        ),
                      ),
                      SizedBox(width: 10,),
                      GestureDetector(
                        onTap: (){
                          if(_isLogin){
                            setState(() {
                              _isLogin = false;
                            });
                          }else{
                            if(_confirmpassword!=""){
                              if(_confirmpassword==_password){
                                logincontroller.register(_username, _password,);
                              }else{
                                Get.snackbar( "Your password and Confirmation password have to be the same !",
                                  "", colorText: Colors.white , backgroundColor: Colors.red,
                                  snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.only(bottom: 20, left: 10, right: 10,),
                                );
                              }
                            }else{
                              Get.snackbar("You have to enter your Confirmation password",
                                "", colorText: Colors.white , backgroundColor: Colors.red,
                                snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.only(bottom: 20, left: 10, right: 10,),
                              );
                            }
                          }
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height*0.07,
                          width: MediaQuery.of(context).size.width*0.35,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: Center(
                              child: Text("Register",
                                  style: FontStyles.defaultStyle
                              )),
                        ),
                      )
                    ],
                  )
                ],
              ))

        ],
      ),
    );
  }
}
