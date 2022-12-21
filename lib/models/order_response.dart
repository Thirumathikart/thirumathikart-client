import 'dart:convert';

OrderResponse orderResponseFromJson(String str) =>
    OrderResponse.fromJson(json.decode(str));

String orderResponseToJson(OrderResponse data) => json.encode(data.toJson());

class OrderResponse {
  OrderResponse({
    required this.message,
  });

  final String message;

  factory OrderResponse.fromJson(Map<String, dynamic> json) => OrderResponse(
        message: json['message'],
      );

  Map<String, dynamic> toJson() => {
        'message': message,
      };
}
