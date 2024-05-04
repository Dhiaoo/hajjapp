
class Users {
  final int? usrId;
  final String usrName;
  final String usrPassword;

  Users({
    this.usrId,
    required this.usrName,
    required this.usrPassword,

  });

  factory Users.fromMap(Map<String, dynamic> json) => Users(
    usrName: json["usrName"],
    usrPassword: json["usrPassword"],
  );

  Map<String, dynamic> toMap( ) => {
    "usrName": usrName,
    "usrPassword": usrPassword,
    "role":"0"
  };
}