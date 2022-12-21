class OrderDisplay {
  String? status;
  int? id, totalAmount;
  String? customerAddress, sellerAddress, sellerName;
  List<OrderItemDisplay>? orderItemsList;

  OrderDisplay({
    this.id,
    this.status,
    this.totalAmount,
    this.orderItemsList,
    this.customerAddress,
    this.sellerName,
    this.sellerAddress,
  });
}

class OrderItemDisplay {
  String? name, category, description;
  int? price, quantity, totalPrice;
  OrderItemDisplay({
    this.name,
    this.category,
    this.description,
    this.price,
    this.quantity,
    this.totalPrice,
  });
}
