class ItemModel {
  String? itemImage;
  String? itemMaterials;
  String? itemName;
  String? itemWeight;
  double? itemPrice;

  ItemModel({
    this.itemImage,
    this.itemMaterials,
    this.itemName,
    this.itemWeight,
    this.itemPrice,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Item Image'] = itemImage;
    data['Item Materials'] = itemMaterials;
    data['Item Name'] = itemName;
    data['Item Weight'] = itemWeight;
    data['Item Price'] = itemPrice;
    return data;
  }
}
