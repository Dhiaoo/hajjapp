
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:tpappmobile/Pages/TicketsServices/Model/ticketmodel.dart';
import 'package:tpappmobile/Sqlite/sqlite.dart';

class Ticketcontroller {

  Future<List> getallTickets() async {
    final DatabaseHelper db = await DatabaseHelper();
    List result = await db.getTickets();
    return result;
  }


  Future<void> addTicket(String depart , String destin , String numofescals, String price, String date) async {
    final DatabaseHelper db = await DatabaseHelper();
    if(depart!=""){
      if(destin!=""){
        if(numofescals!=""){
          if(price!=""){
            if(date!=""){
              Ticket ticket = Ticket(depart: depart, destin: destin, numofescals: numofescals, price: price, date: date);
              await db.addTickets(ticket).then((value){
                Get.snackbar("Your ticket have been aded successfully ! ",
                  "", colorText: Colors.white , backgroundColor: Colors.green,
                  snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.only(bottom: 20, left: 10, right: 10,),
                );

              });

            }else{
              Get.snackbar("You have to enter your the date ",
                "", colorText: Colors.white , backgroundColor: Colors.red,
                snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.only(bottom: 20, left: 10, right: 10,),
              );
            }
          }else{
            Get.snackbar("You have to enter your the price ",
              "", colorText: Colors.white , backgroundColor: Colors.red,
              snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.only(bottom: 20, left: 10, right: 10,),
            );
          }
        }else{
          Get.snackbar("You have to enter your the number of escals ",
            "", colorText: Colors.white , backgroundColor: Colors.red,
            snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.only(bottom: 20, left: 10, right: 10,),
          );
        }
      }else{
        Get.snackbar("You have to enter your the destination ",
          "", colorText: Colors.white , backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.only(bottom: 20, left: 10, right: 10,),
        );
      }
    }else{
      Get.snackbar("You have to enter your the depart ",
        "", colorText: Colors.white , backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.only(bottom: 20, left: 10, right: 10,),
      );
    }
  }

}