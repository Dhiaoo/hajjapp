
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tpappmobile/Pages/DecumentServices/Model/DocumentModel.dart';
import 'package:tpappmobile/Sqlite/sqlite.dart';

class Docscontroller {
  DatabaseHelper db = DatabaseHelper();

  Future<List> getallRequests(bool isVisa) async {
    final DatabaseHelper db = await DatabaseHelper();
    List result = await db.getallDocumentRequests(isVisa);
    return result;
  }
  updateDocumentstatus(bool isVisa, Document doc )async{
   await db.updateDocumentStatus(doc, isVisa).then((value){
     Get.snackbar("The status have been changed !",
       "", colorText: Colors.white , backgroundColor: Colors.green,
       snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.only(bottom: 20, left: 10, right: 10,),
     );
   });
  }
  requestdoc(bool isVisa, String firstname, String lastname, String cardid, String phonenum,) async{
    if(firstname!=""){
      if(lastname!=""){
        if(cardid!=""){
          if(firstname!=""){
            Document doc = Document(firstname: firstname, lastname: lastname, cardid: cardid, phonenum: phonenum, status: 'Pending');
            bool result  = await db.addDocumentRequests(doc, isVisa);
            if(result){
              Get.snackbar("You have requested a ${isVisa?"visa":"pligrim book"} succesfully ",
                "", colorText: Colors.white , backgroundColor: Colors.green,
                snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.only(bottom: 20, left: 10, right: 10,),
              );
            }else{
              Get.snackbar("You have requested a ${isVisa?"visa":"pligrim book"} before",
                "", colorText: Colors.white , backgroundColor: Colors.red,
                snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.only(bottom: 20, left: 10, right: 10,),
              );
            }
          }else{
            Get.snackbar("You have to enter your phone number ",
              "", colorText: Colors.white , backgroundColor: Colors.red,
              snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.only(bottom: 20, left: 10, right: 10,),
            );
          }
        }else{
          Get.snackbar("You have to enter your card id ",
            "", colorText: Colors.white , backgroundColor: Colors.red,
            snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.only(bottom: 20, left: 10, right: 10,),
          );
        }
      }else{
        Get.snackbar("You have to enter your lastname ",
          "", colorText: Colors.white , backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.only(bottom: 20, left: 10, right: 10,),
        );
      }
    }else{
      Get.snackbar("You have to enter your firstname ",
        "", colorText: Colors.white , backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.only(bottom: 20, left: 10, right: 10,),
      );
    }
  }

}