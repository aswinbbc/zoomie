class Table {
  int? tableId;
  String? tableName;
  int? noOfChair;
  String? narration;

  Table({this.tableId, this.tableName, this.noOfChair, this.narration});

  Table.fromJson(Map<String, dynamic> json) {
    tableId = int.parse(json['table_id'].toString());
    tableName = json['table_name'];
    noOfChair = int.parse(json['No_of_chair'].toString());
    narration = json['Narration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['table_id'] = tableId;
    data['table_name'] = tableName;
    data['No_of_chair'] = noOfChair;
    data['Narration'] = narration;
    return data;
  }
}
