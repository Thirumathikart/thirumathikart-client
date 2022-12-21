// To parse this JSON data, do
//
//     final addAddressResponse = addAddressResponseFromJson(jsonString);

import 'dart:convert';

AddAddressResponse addAddressResponseFromJson(String str) =>
    AddAddressResponse.fromJson(json.decode(str));

String addAddressResponseToJson(AddAddressResponse data) =>
    json.encode(data.toJson());

class AddAddressResponse {
  AddAddressResponse({
    this.message,
  });

  String? message;

  factory AddAddressResponse.fromJson(Map<String, dynamic> json) =>
      AddAddressResponse(
        message: json['message'],
      );

  Map<String, dynamic> toJson() => {
        'message': message,
      };
}
