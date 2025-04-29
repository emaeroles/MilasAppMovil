class Kiosco {
  final String id;
  final String name;
  final String manager;
  final String phone;
  final String address;
  final bool isEnableChanges;
  final String notes;
  final double dubt;
  final String order;

  Kiosco({
    required this.id,
    required this.name,
    required this.manager,
    required this.phone,
    required this.address,
    required this.isEnableChanges,
    required this.notes,
    required this.dubt,
    required this.order,
  });

  factory Kiosco.fromJson(Map<String, dynamic> json) {
    return Kiosco(
      id: json["id"],
      name: json["name"],
      manager: json["manager"],
      phone: json["phone"],
      address: json["address"],
      isEnableChanges: json["isEnableChanges"],
      notes: json["notes"],
      dubt: json["dubt"],
      order: json["order"],
    );
  }
}
