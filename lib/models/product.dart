class Product {
  final String? image, name, unit, parentName, details, sellerDetails;
  final int? id, parentId;
  int? quantity = 0;
  final double? price;
  // final Color? color;
  Product({
    this.id,
    this.name,
    this.image,
    this.parentId,
    this.parentName,
    this.price,
    this.unit,
    this.details,
    this.sellerDetails,
    this.quantity,
    // this.color,
  });

  factory Product.fromMap(Map<String, dynamic> map) => Product(
        id: map['id'],
        name: map['name'],
        image: map['image'],
        parentId: map['parentId'],
        parentName: map['parentName'],
        price: map['price'],
        unit: map['unit'],
        details: map['details'],
        sellerDetails: map['sellerDetails'],
        quantity: map['quantity'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'parentId': parentId,
        'parentName': parentName,
        'price': price,
        'unit': unit,
        'details': details,
        'sellerDetails': sellerDetails,
        'quantity': quantity,
      };
}
