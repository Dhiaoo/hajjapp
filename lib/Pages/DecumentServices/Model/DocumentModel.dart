class Document {
  final String firstname;
  final String lastname;
  final String cardid;
  final String phonenum;
  final String status;
  Document({
    required this.firstname,
    required this.lastname,
    required this.cardid,
    required this.phonenum,
    required this.status,

  });

  factory Document.fromMap(Map<String, dynamic> json) => Document(
    firstname: json["firstname"],
    lastname: json["lastname"],
    cardid: json["cardid"],
    phonenum: json["phonenum"],
    status: json["status"],
  );

  Map<String, dynamic> toMap( ) => {
    "firstname": firstname,
    "lastname": lastname,
    "cardid": cardid,
    "phonenum": phonenum,
    "status": status,
  };
}