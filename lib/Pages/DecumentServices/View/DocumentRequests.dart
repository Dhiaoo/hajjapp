import 'package:flutter/material.dart';
import 'package:tpappmobile/Pages/DecumentServices/Controller/DocumentController.dart';
import 'package:tpappmobile/Pages/DecumentServices/Model/DocumentModel.dart';
import 'package:tpappmobile/Pages/DecumentServices/View/documentcard.dart';
import 'package:tpappmobile/Shared/Styles.dart';

class DocumentRequests extends StatefulWidget {
  bool isVisa;
  DocumentRequests({super.key, required this.isVisa});

  @override
  State<DocumentRequests> createState() => _DocumentRequestsState(isVisa);
}

class _DocumentRequestsState extends State<DocumentRequests> {

  bool isVisa;
  _DocumentRequestsState(this.isVisa);
  Docscontroller doccontroller = Docscontroller();

  List data =  [];
  getdata()async{
    List loadeddata =await  doccontroller.getallRequests(isVisa);
    setState(() {
      data = loadeddata;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appbackground,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.06,),
            Container(
              height: MediaQuery.of(context).size.height*0.07,
              width: MediaQuery.of(context).size.width*0.85,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
              ),
              child:Center(
                child: Text(isVisa?'Visa Requests ':"Pilgrim Book Requests", style: FontStyles.homepagesubtitle),
              ) ,
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            Container(
              height: MediaQuery.of(context).size.height*0.8,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for(int i=1; i<=data.length; i++)
                      DocumentCard(doc: Document.fromMap(data[data.length-i]), isVisa: isVisa,)
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
