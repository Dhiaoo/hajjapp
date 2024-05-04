import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tpappmobile/Pages/TicketsServices/Controller/ticketscontroller.dart';
import 'package:tpappmobile/Shared/Styles.dart';

class addticket extends StatefulWidget {
  const addticket({super.key});

  @override
  State<addticket> createState() => _addticketState();
}

class _addticketState extends State<addticket> {
  Ticketcontroller ticketcontroller = Ticketcontroller();
  String _departure = "";
  String _destination = "";
  String _numofescals = "";
  String _price = "";
  String _date = "";

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
                  onChanged: (val)=> _departure = val,
                  decoration: InputDecoration(
                    hintText: 'Departure',
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
                  onChanged: (val)=> _destination = val,
                  decoration: InputDecoration(
                    hintText: 'Destination',
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
                  onChanged: (val)=> _numofescals = val,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Num of Escals',
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
                  onChanged: (val)=> _price = val,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'price',
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
                  onChanged: (val)=> _date = val,
                  decoration: InputDecoration(
                    hintText: 'Date:   hh:mm dd/mm/yy',
                    border: InputBorder.none,
                    hintStyle: FontStyles.defaultStyle,
                    isCollapsed: true,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.15,),
              GestureDetector(
                onTap: (){

                  ticketcontroller.addTicket(_departure, _destination, _numofescals, _price, _date);

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
                          child: Text("Add Ticket ", style: FontStyles.homepagetitle.copyWith(fontSize: 20),)
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
