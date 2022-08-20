class Kitchen {
  String? pknId;
  String? pknName;
  String? printerName;

  Kitchen({this.pknId, this.pknName, this.printerName});

  Kitchen.fromJson(Map<String, dynamic> json) {
    pknId = json['pkn_id'];
    pknName = json['pkn_name'];
    printerName = json['printer_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pkn_id'] = pknId;
    data['pkn_name'] = pknName;
    data['printer_name'] = printerName;
    return data;
  }
}
