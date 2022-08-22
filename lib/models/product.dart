class Product {
  String? prodId;
  String? prodCode;
  String? prodName;
  String? description;
  String? barcodeTagName;
  String? catId;
  String? subCatId;
  String? mesId;
  String? catName;
  String? mesName;
  String? purchasePrice;
  String? retailPrice;
  String? mrp;
  String? qutationPrice;
  String? opStock;
  String? typeId;
  String? typeName;
  String? wholesalePrice;
  String? qtyStock;
  String? qtyRate;
  String? opConvertStock;
  String? activeConvert;
  String? convertMesure;
  String? dateAdded;
  String? subName;
  String? productValue;
  String? maxDiscount;
  String? username;
  String? barcode;
  String? rack;
  String? pfPercentage;
  String? cfPercentage;
  String? active;
  String? systemId;
  String? isSynched;
  String? isEligibleCommission;
  String? isEligiblePoint;
  String? supplierId;
  String? prodTypeId;
  String? createdUserId;
  String? lastUpdateUserId;
  String? lastUpdateDate;
  String? assetAccountId;
  String? secSubCatId;
  String? thirdSubCatId;
  String? isKotPrint;
  String? isWgScale;
  String? wgScaleReadMode;
  String? isNonReturn;
  String? isGurantee;
  String? isWarranty;
  String? estimateTime;
  String? departmentId;
  String? packageId;
  String? kitchenId;
  String? fkWmId;
  String? hotKeyNo;
  String? fkOriginId;
  String? model;
  String? multiunitId;
  String? amberBarcode;
  String? prodid;
  String? mid;
  String? mname;
  String? purchaseprice;
  String? retailprice;
  String? mrp1;
  String? qutationprice;
  String? wholesaleprice;
  String? openingStock;
  String? active1;
  String? type;
  String? convertion;
  String? barcode1;
  String? stockViewUnit;
  String? defaultTransUint;
  String? avgPurchaseCost;
  String? lastPurchaseCost;
  String? fkTaxEntryId;
  String? taxSaIncludeAmount;
  String? taxPuIncludeAmount;
  String? prodId1;
  String? prodImage;
  String? kitchenName;
  String? printerName;
  String narration = "";

  Product({
    this.prodId,
    this.prodCode,
    this.prodName,
    this.description,
    this.barcodeTagName,
    this.catId,
    this.subCatId,
    this.mesId,
    this.catName,
    this.mesName,
    this.purchasePrice,
    this.retailPrice,
    this.mrp,
    this.qutationPrice,
    this.opStock,
    this.typeId,
    this.typeName,
    this.wholesalePrice,
    this.qtyStock,
    this.qtyRate,
    this.opConvertStock,
    this.activeConvert,
    this.convertMesure,
    this.dateAdded,
    this.subName,
    this.productValue,
    this.maxDiscount,
    this.username,
    this.barcode,
    this.rack,
    this.pfPercentage,
    this.cfPercentage,
    this.active,
    this.systemId,
    this.isSynched,
    this.isEligibleCommission,
    this.isEligiblePoint,
    this.supplierId,
    this.prodTypeId,
    this.createdUserId,
    this.lastUpdateUserId,
    this.lastUpdateDate,
    this.assetAccountId,
    this.secSubCatId,
    this.thirdSubCatId,
    this.isKotPrint,
    this.isWgScale,
    this.wgScaleReadMode,
    this.isNonReturn,
    this.isGurantee,
    this.isWarranty,
    this.estimateTime,
    this.departmentId,
    this.packageId,
    this.kitchenId,
    this.fkWmId,
    this.hotKeyNo,
    this.fkOriginId,
    this.model,
    this.multiunitId,
    this.amberBarcode,
    this.prodid,
    this.mid,
    this.mname,
    this.purchaseprice,
    this.retailprice,
    this.mrp1,
    this.qutationprice,
    this.wholesaleprice,
    this.openingStock,
    this.active1,
    this.type,
    this.convertion,
    this.barcode1,
    this.stockViewUnit,
    this.defaultTransUint,
    this.avgPurchaseCost,
    this.lastPurchaseCost,
    this.fkTaxEntryId,
    this.taxSaIncludeAmount,
    this.taxPuIncludeAmount,
    this.prodId1,
    this.prodImage,
    this.kitchenName,
    this.printerName,
  });

  Product.fromJson(Map<String, dynamic> json) {
    prodId = json['prod_id'];
    prodCode = json['prod_code'];
    prodName = json['prod_name'];
    description = json['Description'];
    barcodeTagName = json['barcode_tag_name'];
    catId = json['cat_id'];
    subCatId = json['sub_cat_id'];
    mesId = json['mes_id'];
    catName = json['cat_name'];
    mesName = json['mes_name'];
    purchasePrice = json['purchase_price'];
    retailPrice = json['retail_price'];
    mrp = json['mrp'];
    qutationPrice = json['qutation_price'];
    opStock = json['op_stock'];
    typeId = json['type_id'];
    typeName = json['type_name'];
    wholesalePrice = json['wholesale_price'];
    qtyStock = json['qty_stock'];
    qtyRate = json['Qty_rate'];
    opConvertStock = json['op_convert_stock'];
    activeConvert = json['ActiveConvert'];
    convertMesure = json['convert_Mesure'];
    dateAdded = json['date_added'];
    subName = json['subName'];
    productValue = json['productValue'];
    maxDiscount = json['maxDiscount'];
    username = json['username'];
    barcode = json['barcode'];
    rack = json['rack'];
    pfPercentage = json['pfPercentage'];
    cfPercentage = json['cfPercentage'];
    active = json['active'];
    systemId = json['system_id'];
    isSynched = json['is_synched'];
    isEligibleCommission = json['is_eligible_commission'];
    isEligiblePoint = json['is_eligible_point'];
    supplierId = json['supplier_id'];
    prodTypeId = json['prod_type_id'];
    createdUserId = json['created_user_id'];
    lastUpdateUserId = json['last_update_user_id'];
    lastUpdateDate = json['last_update_date'];
    assetAccountId = json['asset_account_id'];
    secSubCatId = json['sec_sub_cat_id'];
    thirdSubCatId = json['third_sub_cat_id'];
    isKotPrint = json['is_kot_print'];
    isWgScale = json['is_wg_scale'];
    wgScaleReadMode = json['wg_scale_read_mode'];
    isNonReturn = json['is_non_return'];
    isGurantee = json['is_gurantee'];
    isWarranty = json['is_warranty'];
    estimateTime = json['estimate_time'];
    departmentId = json['department_id'];
    packageId = json['package_id'];
    kitchenId = json['kitchen_id'];
    fkWmId = json['fk_wm_id'];
    hotKeyNo = json['hot_key_no'];
    fkOriginId = json['fk_origin_id'];
    model = json['model'];
    multiunitId = json['multiunitId'];
    amberBarcode = json['amber_barcode'];
    prodid = json['prodid'];
    mid = json['mid'];
    mname = json['mname'];
    purchaseprice = json['purchaseprice'];
    retailprice = json['retailprice'];
    mrp1 = json['mrp1'];
    qutationprice = json['qutationprice'];
    wholesaleprice = json['wholesaleprice'];
    openingStock = json['openingStock'];
    active1 = json['active1'];
    type = json['type'];
    convertion = json['convertion'];
    barcode1 = json['barcode1'];
    stockViewUnit = json['stockViewUnit'];
    defaultTransUint = json['defaultTransUint'];
    avgPurchaseCost = json['AvgPurchaseCost'];
    lastPurchaseCost = json['LastPurchaseCost'];
    fkTaxEntryId = json['fk_tax_entry_id'];
    taxSaIncludeAmount = json['tax_sa_include_amount'];
    taxPuIncludeAmount = json['tax_pu_include_amount'];
    prodId1 = json['prod_id1'];
    prodImage = json['prod_image'];
    kitchenName = json['pkn_name'];
    printerName = json['printer_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['prod_id'] = prodId;
    data['prod_code'] = prodCode;
    data['prod_name'] = prodName;
    data['Description'] = description;
    data['barcode_tag_name'] = barcodeTagName;
    data['cat_id'] = catId;
    data['sub_cat_id'] = subCatId;
    data['mes_id'] = mesId;
    data['cat_name'] = catName;
    data['mes_name'] = mesName;
    data['purchase_price'] = purchasePrice;
    data['retail_price'] = retailPrice;
    data['mrp'] = mrp;
    data['qutation_price'] = qutationPrice;
    data['op_stock'] = opStock;
    data['type_id'] = typeId;
    data['type_name'] = typeName;
    data['wholesale_price'] = wholesalePrice;
    data['qty_stock'] = qtyStock;
    data['Qty_rate'] = qtyRate;
    data['op_convert_stock'] = opConvertStock;
    data['ActiveConvert'] = activeConvert;
    data['convert_Mesure'] = convertMesure;
    data['date_added'] = dateAdded;
    data['subName'] = subName;
    data['productValue'] = productValue;
    data['maxDiscount'] = maxDiscount;
    data['username'] = username;
    data['barcode'] = barcode;
    data['rack'] = rack;
    data['pfPercentage'] = pfPercentage;
    data['cfPercentage'] = cfPercentage;
    data['active'] = active;
    data['system_id'] = systemId;
    data['is_synched'] = isSynched;
    data['is_eligible_commission'] = isEligibleCommission;
    data['is_eligible_point'] = isEligiblePoint;
    data['supplier_id'] = supplierId;
    data['prod_type_id'] = prodTypeId;
    data['created_user_id'] = createdUserId;
    data['last_update_user_id'] = lastUpdateUserId;
    data['last_update_date'] = lastUpdateDate;
    data['asset_account_id'] = assetAccountId;
    data['sec_sub_cat_id'] = secSubCatId;
    data['third_sub_cat_id'] = thirdSubCatId;
    data['is_kot_print'] = isKotPrint;
    data['is_wg_scale'] = isWgScale;
    data['wg_scale_read_mode'] = wgScaleReadMode;
    data['is_non_return'] = isNonReturn;
    data['is_gurantee'] = isGurantee;
    data['is_warranty'] = isWarranty;
    data['estimate_time'] = estimateTime;
    data['department_id'] = departmentId;
    data['package_id'] = packageId;
    data['kitchen_id'] = kitchenId;
    data['fk_wm_id'] = fkWmId;
    data['hot_key_no'] = hotKeyNo;
    data['fk_origin_id'] = fkOriginId;
    data['model'] = model;
    data['multiunitId'] = multiunitId;
    data['amber_barcode'] = amberBarcode;
    data['prodid'] = prodid;
    data['mid'] = mid;
    data['mname'] = mname;
    data['purchaseprice'] = purchaseprice;
    data['retailprice'] = retailprice;
    data['mrp1'] = mrp1;
    data['qutationprice'] = qutationprice;
    data['wholesaleprice'] = wholesaleprice;
    data['openingStock'] = openingStock;
    data['active1'] = active1;
    data['type'] = type;
    data['convertion'] = convertion;
    data['barcode1'] = barcode1;
    data['stockViewUnit'] = stockViewUnit;
    data['defaultTransUint'] = defaultTransUint;
    data['AvgPurchaseCost'] = avgPurchaseCost;
    data['LastPurchaseCost'] = lastPurchaseCost;
    data['fk_tax_entry_id'] = fkTaxEntryId;
    data['tax_sa_include_amount'] = taxSaIncludeAmount;
    data['tax_pu_include_amount'] = taxPuIncludeAmount;
    data['prod_id1'] = prodId1;
    data['prod_image'] = prodImage;
    return data;
  }
}
