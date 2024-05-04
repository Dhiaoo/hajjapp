

import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tpappmobile/Pages/LogInServices/Model/user.dart';
import 'package:tpappmobile/Pages/TicketsServices/Model/ticketmodel.dart';
import 'package:tpappmobile/Pages/DecumentServices/Model/DocumentModel.dart';
class DatabaseHelper {
  final databaseName = "tphajjapp.db";

  String ticketsTable = "CREATE TABLE ticket ( depart TEXT NOT NULL,destin TEXT NOT NULL, numofescals TEXT NOT NULL, price TEXT NOT NULL, date TEXT NOT NULL)";

  String visarequestTable = "CREATE TABLE visa ( firstname TEXT NOT NULL, lastname TEXT NOT NULL, cardid TEXT NOT NULL, phonenum TEXT NOT NULL, status TEXT NOT NULL)";

  String pilgrimbookrequestTable = "CREATE TABLE pligrimbook ( firstname TEXT NOT NULL, lastname TEXT NOT NULL, cardid TEXT NOT NULL, phonenum TEXT NOT NULL, status TEXT NOT NULL)";

  //Now we must create our user table into our sqlite db

  String users = "create table users ( usrName TEXT UNIQUE, usrPassword TEXT, role TEXT)";


  //We are done in this section

  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(users);
      await db.execute(ticketsTable);
      await db.execute(visarequestTable);
      await db.execute(pilgrimbookrequestTable);
      db.insert('users', {
        "usrName": "admin",
        "usrPassword": "admin",
        "role":"1"
      });
    });
  }

  Future<bool> login(Users user) async {
    final Database db = await initDB();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var result = await db.rawQuery("select * from users where usrName = '${user.usrName}' AND usrPassword = '${user.usrPassword}'");
    if (result.isNotEmpty) {
      prefs.setString("role", result[0]["role"].toString());
      return true;
    } else {
      return false;
    }
  }


  //Sign up
  Future<bool> signup(Users user) async {
    final Database db = await initDB();
    var result = await db.rawQuery("select * from users where usrName = '${user.usrName}'");
    if(result.isNotEmpty){
      return false;
    }else{
      db.insert('users', user.toMap());
      return true;
    }
  }
  //get ticket

  Future<List> getTickets( ) async {
    final Database db = await initDB();
    List result = await db.rawQuery("select * from ticket ");
    return result;
  }

  //add ticket

  Future<int> addTickets(Ticket ticket ) async {
    final Database db = await initDB();
    return db.insert('ticket', ticket.toMap());
  }
  //get all document requests

  Future<List> getallDocumentRequests(bool isVisa) async {
    final Database db = await initDB();
    List result = await db.rawQuery("select * from ${isVisa?"visa":"pligrimbook"}");
    print(result);
    return result;
  }

  Future<bool> addDocumentRequests(Document doc, bool isVisa) async {
    final Database db = await initDB();
    var result = await db.rawQuery("select * from ${isVisa?"visa":"pligrimbook"} where firstname = '${doc.firstname}'");
    if(result.isNotEmpty){
      return false;
    }else{
      db.insert(isVisa?"visa":"pligrimbook", doc.toMap());
      return true;
    }
  }
  //updating the document status
  Future<int> updateDocumentStatus(Document doc, bool isVisa) async {
    final Database db = await initDB();

    return await db.update(
      isVisa?"visa":"pligrimbook",
      doc.toMap(),
      where: 'firstname = ? AND lastname = ? AND phonenum = ? AND cardid= ?',
      whereArgs: [doc.firstname, doc.lastname, doc.phonenum, doc.cardid],
    );
  }

}