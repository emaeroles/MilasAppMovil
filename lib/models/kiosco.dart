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
  final bool isActive;

  Kiosco({
    this.id = "",
    this.name = "",
    this.manager = "",
    this.phone = "",
    this.address = "",
    this.isEnableChanges = false,
    this.notes = "",
    this.dubt = 0,
    this.order = "",
    this.isActive = false,
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
      isActive: json["isActive"],
    );
  }
}
