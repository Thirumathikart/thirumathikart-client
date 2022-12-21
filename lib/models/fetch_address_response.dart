// To parse this JSON data, do
//
//     final fetchAddressResponse = fetchAddressResponseFromJson(jsonString);

import 'dart:convert';

FetchAddressResponse fetchAddressResponseFromJson(String str) =>
    FetchAddressResponse.fromJson(json.decode(str));

String fetchAddressResponseToJson(FetchAddressResponse data) =>
    json.encode(data.toJson());

class FetchAddressResponse {
  FetchAddressResponse({
    this.address,
    this.message,
  });

  List<AddressResponse>? address;
  String? message;

  factory FetchAddressResponse.fromJson(Map<String, dynamic> json) =>
      FetchAddressResponse(
        address: List<AddressResponse>.from(
            // ignore: unnecessary_lambdas
            json['address'].map((i) => AddressResponse.fromJson(i))),
        message: json['message'],
      );

  Map<String, dynamic> toJson() => {
        'address': List<dynamic>.from(address!.map((x) => x.toJson())),
        'message': message,
      };
}

class AddressResponse {
  AddressResponse({
    this.userId,
    this.id,
    this.line1,
    this.line2,
    this.landmark,
    this.district,
    this.state,
    this.pincode,
    // this.latitude,
    // this.longitude,
  });

  int? userId;
  int? id;
  String? line1;
  String? line2;
  String? landmark;
  String? district;
  String? state;
  String? pincode;
  // double? latitude;
  // double? longitude;

  factory AddressResponse.fromJson(Map<String, dynamic> json) =>
      AddressResponse(
        userId: json['userId'],
        id: json['id'],
        line1: json['line1'],
        line2: json['line2'],
        landmark: json['landmark'],
        district: json['district'],
        state: json['state'],
        pincode: json['pincode'],
        // latitude: json['latitude'],
        // longitude: json['longitude'],
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'id': id,
        'line1': line1,
        'line2': line2,
        'landmark': landmark,
        'district': district,
        'state': state,
        'pincode': pincode,
        // 'latitude': latitude,
        // 'longitude': longitude,
      };
}
