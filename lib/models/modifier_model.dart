class ModifierModel {
  String? modifierId;
  String? modifierName;
  String? spPrice;

  ModifierModel({this.modifierId, this.modifierName, this.spPrice});

  ModifierModel.fromJson(Map<String, dynamic> json) {
    modifierId = json['modifier_id'];
    modifierName = json['modifier_name'];
    spPrice = json['sp_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['modifier_id'] = modifierId;
    data['modifier_name'] = modifierName;
    data['sp_price'] = spPrice;
    return data;
  }
}
