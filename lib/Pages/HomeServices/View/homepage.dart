import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tpappmobile/Pages/DecumentServices/View/DocumentRequests.dart';
import 'package:tpappmobile/Pages/DecumentServices/View/RequestVisa.dart';
import 'package:tpappmobile/Pages/LogInServices/View/loginpage.dart';
import 'package:tpappmobile/Pages/TicketsServices/View/AddTicket.dart';
import 'package:tpappmobile/Pages/TicketsServices/View/ticketspage.dart';
import 'package:tpappmobile/Shared/Styles.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  bool _isadmin = false;

  getprivelege()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString("role")!=null && int.parse(prefs.getString("role")!)==1){
      setState(() {
        _isadmin = true;
      });
      print(_isadmin);

    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getprivelege();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appbackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.25),
            GestureDetector(
              onTap: (){

              },
              child: Container(
                height: MediaQuery.of(context).size.height*0.09,
                width: MediaQuery.of(context).size.width*0.8,
                decoration: BoxDecoration(
                    color: AppColors.homepagecardColor,
                    borderRadius: BorderRadius.circular(25)
                ),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Text("Hajj App ", style: FontStyles.homepagetitle,)
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.5,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                  Center(
                    child: Wrap(
                      spacing: 30,
                      runSpacing: 30,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Get.to(()=>ticketspage());
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height*0.09,
                            width: MediaQuery.of(context).size.width*0.4,
                            decoration: BoxDecoration(
                                color: AppColors.homepagecardColor,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Center(
                                child: Text("Tickets" , style: FontStyles.homepagesubtitle,)
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.offAll(() =>loginPage());
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height*0.09,
                            width: MediaQuery.of(context).size.width*0.4,
                            decoration: BoxDecoration(
                                color: AppColors.homepagecardColor,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Center(
                                child: Text("Log Out", style: FontStyles.homepagesubtitle, textAlign: TextAlign.center,)
                            ),

                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            if(_isadmin){
                              Get.to(()=>DocumentRequests(isVisa: true,));
                            }else{
                              Get.to(()=>requestdocument(isVisa: true,));
                            }
                            //DocumentRequests

                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height*0.09,
                            width: MediaQuery.of(context).size.width*0.4,
                            decoration: BoxDecoration(
                                color: AppColors.homepagecardColor,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Center(
                                child: Text(_isadmin?"Visa Requests":"Request Visa", style: FontStyles.homepagesubtitle,)
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            if(_isadmin){
                              Get.to(()=>DocumentRequests(isVisa: false,));
                            }else{
                              Get.to(()=>requestdocument(isVisa: false,));
                            }

                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height*0.09,
                            width: MediaQuery.of(context).size.width*0.4,
                            decoration: BoxDecoration(
                                color: AppColors.homepagecardColor,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Center(
                                child: Text(_isadmin? "pilgrim Book Requests":"Request pilgrim Book", style: FontStyles.homepagesubtitle, textAlign: TextAlign.center,)
                            ),

                          ),
                        ),
                        _isadmin? GestureDetector(
                          onTap: (){
                            Get.to(()=>addticket());
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height*0.09,
                            width: MediaQuery.of(context).size.width*0.4,
                            decoration: BoxDecoration(
                                color: AppColors.homepagecardColor,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Center(
                                child: _isadmin?Text("Add Tickets", style: FontStyles.homepagesubtitle,) : Container()
                            ),
                          ),
                        ): Container(height: MediaQuery.of(context).size.height*0.09, width: MediaQuery.of(context).size.width*0.4,),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
