import 'package:flutter/material.dart';
import 'package:tpappmobile/Pages/DecumentServices/Controller/DocumentController.dart';
import 'package:tpappmobile/Shared/Styles.dart';

class requestdocument extends StatefulWidget {
  bool isVisa;
  requestdocument({super.key, required this.isVisa});

  @override
  State<requestdocument> createState() => _requestdocumentState(this.isVisa);
}

class _requestdocumentState extends State<requestdocument> {
  bool isVisa;

  _requestdocumentState(this.isVisa);
  Docscontroller pagecontroller = Docscontroller();
  String _firstname = "";
  String _lastname = "";
  String _cardIdNumber ="";
  String _phnenumber = "";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.appbackground,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.08,),
              Container(
                height: MediaQuery.of(context).size.height*0.07,
                width: MediaQuery.of(context).size.width*0.85,
                decoration: BoxDecoration(
                    color: AppColors.homepagecardColor,
                    borderRadius: BorderRadius.circular(25)
                ),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Text(isVisa?"Request Visa": "Request Pligrim Book", style: FontStyles.homepagetitle.copyWith(fontSize: 25),)
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.05,),
              Container(
                height: MediaQuery.of(context).size.height*0.07,
                width: MediaQuery.of(context).size.width*0.85,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: TextField(
                  onChanged: (val)=> _firstname = val,
                  decoration: InputDecoration(
                    hintText: 'First Name',
                    border: InputBorder.none,
                    hintStyle: FontStyles.defaultStyle,
                    isCollapsed: true,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
              Container(
                height: MediaQuery.of(context).size.height*0.07,
                width: MediaQuery.of(context).size.width*0.85,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: TextField(
                  onChanged: (val)=> _lastname = val,
                  decoration: InputDecoration(
                    hintText: 'Last Name',
                    border: InputBorder.none,
                    hintStyle: FontStyles.defaultStyle,
                    isCollapsed: true,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
              Container(
                height: MediaQuery.of(context).size.height*0.07,
                width: MediaQuery.of(context).size.width*0.85,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: TextField(
                  onChanged: (val)=> _cardIdNumber = val,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Card ID Number',
                    border: InputBorder.none,
                    hintStyle: FontStyles.defaultStyle,
                    isCollapsed: true,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
              Container(
                height: MediaQuery.of(context).size.height*0.07,
                width: MediaQuery.of(context).size.width*0.85,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: TextField(
                  onChanged: (val)=> _phnenumber = val,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    border: InputBorder.none,
                    hintStyle: FontStyles.defaultStyle,
                    isCollapsed: true,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.15,),
              GestureDetector(
                onTap: (){
                  pagecontroller.requestdoc(isVisa, _firstname, _lastname, _cardIdNumber, _phnenumber);
                },
                child: Container(
                  height: MediaQuery.of(context).size.height*0.07,
                  width: MediaQuery.of(context).size.width*0.85,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: Text("Submit ${isVisa?"visa":"pligrim book"} Request ", style: FontStyles.homepagetitle.copyWith(fontSize: 20),)
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
