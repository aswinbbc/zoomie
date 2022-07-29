class SubCategory {
  int? idForDisplay;
  int? isProduct;
  String? subCategoryName;
  int? categId;
  String? itemImage;

  SubCategory({
    this.idForDisplay,
    this.isProduct,
    this.subCategoryName,
    this.categId,
    this.itemImage,
  });

  SubCategory.fromJson(Map<String, dynamic> json) {
    idForDisplay = int.parse(json['IdForDisplay'].toString());
    isProduct = int.parse(json['IsProduct'].toString());
    subCategoryName = json['sub_category_name'];
    categId = int.parse(json['Categ_id'].toString());
    itemImage = json['item_image'];
    // print(itemImage);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['IdForDisplay'] = idForDisplay;
    data['IsProduct'] = isProduct;
    data['sub_category_name'] = subCategoryName;
    data['Categ_id'] = categId;
    data['item_image'] = itemImage;

    return data;
  }
}
