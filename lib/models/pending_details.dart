class PendingItemModel {
  String? sno;
  String? barcode;
  String? productId;
  String? prodName;
  String? qty;
  String? mesName;
  String? price;
  String? discount;
  String? prodCode;
  String? advance;
  String? otherchgs;
  String? isEligiblePoint;
  String? rowId;
  String? customerId;
  String? modeType;
  String? billNo;
  String? billDate;
  String? clientName;
  String? productNarration;
  String? salesId;

  PendingItemModel(
      {this.sno,
      this.barcode,
      this.productId,
      this.prodName,
      this.qty,
      this.mesName,
      this.price,
      this.discount,
      this.prodCode,
      this.advance,
      this.otherchgs,
      this.isEligiblePoint,
      this.rowId,
      this.customerId,
      this.modeType,
      this.billNo,
      this.billDate,
      this.clientName,
      this.productNarration,
      this.salesId});

  PendingItemModel.fromJson(Map<String, dynamic> json) {
    sno = json['sno'];
    barcode = json['barcode'];
    productId = json['product_id'];
    prodName = json['prod_name'];
    qty = json['qty'];
    mesName = json['mes_name'];
    price = json['price'];
    discount = json['discount'];
    prodCode = json['prod_code'];
    advance = json['advance'];
    otherchgs = json['otherchgs'];
    isEligiblePoint = json['is_eligible_point'];
    rowId = json['row_id'];
    customerId = json['customer_id'];
    modeType = json['mode_type'];
    billNo = json['bill_no'];
    billDate = json['bill_date'];
    clientName = json['client_name'];
    productNarration = json['product_narration'];
    salesId = json['sales_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sno'] = sno;
    data['barcode'] = barcode;
    data['product_id'] = productId;
    data['prod_name'] = prodName;
    data['qty'] = qty;
    data['mes_name'] = mesName;
    data['price'] = price;
    data['discount'] = discount;
    data['prod_code'] = prodCode;
    data['advance'] = advance;
    data['otherchgs'] = otherchgs;
    data['is_eligible_point'] = isEligiblePoint;
    data['row_id'] = rowId;
    data['customer_id'] = customerId;
    data['mode_type'] = modeType;
    data['bill_no'] = billNo;
    data['bill_date'] = billDate;
    data['client_name'] = clientName;
    data['product_narration'] = productNarration;
    data['sales_id'] = salesId;
    return data;
  }
}
