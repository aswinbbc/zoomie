class Category {
  double? pcId;
  String? pcName;
  bool? isActive;
  String? categImage;

  Category({this.pcId, this.pcName, this.isActive, this.categImage});

  Category.fromJson(Map<String, dynamic> json) {
    pcId = json['pc_id'];
    pcName = json['pc_name'];
    isActive = json['is_active'];
    categImage = json['categ_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pc_id'] = pcId;
    data['pc_name'] = pcName;
    data['is_active'] = isActive;
    data['categ_image'] = categImage;
    return data;
  }
}
