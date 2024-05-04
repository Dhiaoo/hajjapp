import 'package:flutter/material.dart';
import 'package:tpappmobile/Pages/TicketsServices/Controller/ticketscontroller.dart';
import 'package:tpappmobile/Pages/TicketsServices/Model/ticketmodel.dart';
import 'package:tpappmobile/Pages/TicketsServices/View/ticketcard.dart';
import 'package:tpappmobile/Shared/Styles.dart';
class ticketspage extends StatefulWidget {
  const ticketspage({super.key});

  @override
  State<ticketspage> createState() => _ticketspageState();
}

class _ticketspageState extends State<ticketspage> {
  Ticketcontroller  ticketcontroller = Ticketcontroller();
  List data =  [];

  getdata()async{
    List loadeddata =await  ticketcontroller.getallTickets();
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
                child: Text('Tickets', style: FontStyles.homepagesubtitle),
              ) ,
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            Container(
              height: MediaQuery.of(context).size.height*0.8,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for(int i=1; i<=data.length; i++)
                      ticketcard(ticket: Ticket.fromMap(data[data.length-i]),)
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


