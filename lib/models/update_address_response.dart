// To parse this JSON data, do
//
//     final updateAddressResponse = updateAddressResponseFromJson(jsonString);

import 'dart:convert';

UpdateAddressResponse updateAddressResponseFromJson(String str) =>
    UpdateAddressResponse.fromJson(json.decode(str));

String updateAddressResponseToJson(UpdateAddressResponse data) =>
    json.encode(data.toJson());

class UpdateAddressResponse {
  UpdateAddressResponse({
    this.message,
  });

  String? message;

  factory UpdateAddressResponse.fromJson(Map<String, dynamic> json) =>
      UpdateAddressResponse(
        message: json['message'],
      );

  Map<String, dynamic> toJson() => {
        'message': message,
      };
}
