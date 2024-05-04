

import 'package:flutter/material.dart';
import 'package:tpappmobile/Pages/DecumentServices/Controller/DocumentController.dart';
import 'package:tpappmobile/Pages/DecumentServices/Model/DocumentModel.dart';
import 'package:tpappmobile/Shared/Styles.dart';

class DocumentCard extends StatefulWidget {
  Document doc;
  bool isVisa;
  DocumentCard({super.key, required this.doc, required this.isVisa});

  @override
  State<DocumentCard> createState() => _DocumentCardState(doc, isVisa);
}

class _DocumentCardState extends State<DocumentCard> {
  Document document;
  bool isVisa;
  _DocumentCardState(this.document, this.isVisa);
  Docscontroller pagecontroller = Docscontroller();

  changeStatus(Document doc,bool isVisa, String newStatus)async{
      setState(() {
        document = Document(firstname: document.firstname, lastname: document.lastname,
            cardid: document.cardid, phonenum: document.phonenum, status: newStatus);
      });
      await pagecontroller.updateDocumentstatus(isVisa, document);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.22,
      width: MediaQuery.of(context).size.width*0.85,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.38,
                child: Text("First Name : ${document.firstname}", style: FontStyles.defaultexthintfield,),
              ),/*${}*/
              Container(
                width: MediaQuery.of(context).size.width*0.38,
                child: Text("Last Name : ${document.lastname}", style: FontStyles.defaultexthintfield,),
              )
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.03,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.38,
                child: Text("Card id : ${document.cardid}", style: FontStyles.defaultexthintfield,),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.38,
                child: Text("Phone Number : ${document.phonenum}", style: FontStyles.defaultexthintfield,),
              )
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.03,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Text("Status : ", style: FontStyles.defaultexthintfield,),
                    GestureDetector(
                      onTap: (){
                        showDialog(context: context,
                            builder: (BuildContext context)=>AlertDialog(
                              content: Container(
                                height: MediaQuery.of(context).size.height*0.3,
                                width: MediaQuery.of(context).size.width*0.1,
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: ()async{
                                        await changeStatus(document, isVisa, 'Rejected');
                                      },
                                      child: Container(
                                        height: MediaQuery.of(context).size.height*0.07,
                                        width: MediaQuery.of(context).size.width*0.3,
                                        margin: EdgeInsets.symmetric(horizontal: 20),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.red
                                        ),
                                        child: Center(
                                            child: Text("Rejected", style: FontStyles.defaultexthintfield.copyWith(color: Colors.white),)),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: ()async{
                                        await changeStatus(document, isVisa, 'Approved');
                                      },
                                      child: Container(
                                        height: MediaQuery.of(context).size.height*0.07,
                                        width: MediaQuery.of(context).size.width*0.3,
                                        margin: EdgeInsets.symmetric(horizontal: 20),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.green
                                        ),
                                        child: Center(
                                            child: Text("Approved", style: FontStyles.defaultexthintfield.copyWith(color: Colors.white),)),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: ()async{
                                        await changeStatus(document, isVisa, 'Pending');
                                      },
                                      child: Container(
                                        height: MediaQuery.of(context).size.height*0.07,
                                        width: MediaQuery.of(context).size.width*0.3,
                                        margin: EdgeInsets.symmetric(horizontal: 20),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.blueAccent
                                        ),
                                        child: Center(
                                            child: Text("Pending", style: FontStyles.defaultexthintfield.copyWith(color: Colors.white),)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                        );
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.045,
                        width: MediaQuery.of(context).size.width*0.22,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: document.status=="Pending"? Colors.blueAccent: document.status=="Approved"? Colors.green:Colors.red
                        ),
                        child: Center(
                            child: Text( "${document.status}", style: FontStyles.defaultexthintfield.copyWith(color: Colors.white),)),
                      ),
                    )
                  ],
                ),
              ),

            ],
          )
        ],
      ),
    );
  }
}

