class Ticket {
  final String depart;
  final String destin;
  final String numofescals;
  final String price;
  final String date;
  Ticket({
    required this.depart,
    required this.destin,
    required this.numofescals,
    required this.price,
    required this.date,

  });

  factory Ticket.fromMap(Map<String, dynamic> json) => Ticket(
    depart: json["depart"],
    destin: json["destin"],
    numofescals: json["numofescals"],
    price: json["price"],
    date: json["date"],
  );

  Map<String, dynamic> toMap( ) => {
    "depart": depart,
    "destin": destin,
    "numofescals": numofescals,
    "price": price,
    "date": date,
  };
}