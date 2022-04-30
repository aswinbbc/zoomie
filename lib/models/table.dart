class Table {
  double? tableId;
  String? tableName;
  double? noOfChair;
  String? narration;

  Table({this.tableId, this.tableName, this.noOfChair, this.narration});

  Table.fromJson(Map<String, dynamic> json) {
    tableId = json['table_id'];
    tableName = json['table_name'];
    noOfChair = json['No_of_chair'];
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
