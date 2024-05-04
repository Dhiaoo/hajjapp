import 'package:flutter/material.dart';
import 'package:tpappmobile/Pages/TicketsServices/Model/ticketmodel.dart';
import 'package:tpappmobile/Shared/Styles.dart';

class ticketcard extends StatelessWidget {
  Ticket ticket;
  ticketcard({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.2,
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
                child: Text("Departure : ${ticket.depart}", style: FontStyles.defaultexthintfield,),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.38,
                child: Text("Price : ${ticket.price}", style: FontStyles.defaultexthintfield,),
              )
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.03,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.38,
                child: Text("Destination : ${ticket.destin}", style: FontStyles.defaultexthintfield,),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.38,
                child: Text("Date : ${ticket.date}", style: FontStyles.defaultexthintfield,),
              )
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.03,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.38,
                child: Text("Num of Escals : ${ticket.numofescals}", style: FontStyles.defaultexthintfield,),
              ),

            ],
          )
        ],
      ),
    );
  }
}
