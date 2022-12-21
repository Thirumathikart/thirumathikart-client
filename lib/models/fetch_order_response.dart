import 'dart:convert';

FetchOrderResponse fetchorderResponseFromJson(String str) =>
    FetchOrderResponse.fromJson(json.decode(str));

String fetchorderResponseToJson(FetchOrderResponse data) =>
    json.encode(data.toJson());

class FetchOrderResponse {
  FetchOrderResponse({
    required this.message,
  });

  final String message;

  factory FetchOrderResponse.fromJson(Map<String, dynamic> json) =>
      FetchOrderResponse(
        message: json['message'],
      );

  Map<String, dynamic> toJson() => {
        'message': message,
      };
}
