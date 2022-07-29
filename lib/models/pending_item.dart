class PendingItem {
  String? salesId;
  String? billNo;
  String? carNo;
  String? tableName;
  String? tableId;
  String? userId;
  String? orderType;

  PendingItem(
      {this.salesId,
      this.billNo,
      this.carNo,
      this.tableName,
      this.userId,
      this.orderType});

  PendingItem.fromJson(Map<String, dynamic> json) {
    salesId = json['sales_id'];
    billNo = json['bill_No'];
    carNo = json['car_no'];
    tableName = json['table_name'];
    tableId = json['table_id'];
    userId = json['user_id'];
    orderType = json['order_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sales_id'] = salesId;
    data['bill_No'] = billNo;
    data['car_no'] = carNo;
    data['table_name'] = tableName;
    data['table_id'] = tableId;
    data['user_id'] = userId;
    data['order_type'] = orderType;
    return data;
  }
}
