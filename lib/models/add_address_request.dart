// To parse this JSON data, do
//
//     final updateAddressRequest = updateAddressRequestFromJson(jsonString);

import 'dart:convert';

AddAddressRequest addAddressRequestFromJson(String str) =>
    AddAddressRequest.fromJson(json.decode(str));

String addAddressRequestToJson(AddAddressRequest data) =>
    json.encode(data.toJson());

class AddAddressRequest {
  AddAddressRequest({
    this.line1,
    this.line2,
    this.landmark,
    this.district,
    this.state,
    this.pincode,
    this.latitude,
    this.longitude,
    this.token,
  });

  String? line1;
  String? line2;
  String? landmark;
  String? district;
  String? state;
  String? pincode;
  double? latitude;
  double? longitude;
  String? token;

  factory AddAddressRequest.fromJson(Map<String, dynamic> json) =>
      AddAddressRequest(
        line1: json['line1'],
        line2: json['line2'],
        landmark: json['landmark'],
        district: json['district'],
        state: json['state'],
        pincode: json['pincode'],
        latitude: json['latitude'].toDouble(),
        longitude: json['longitude'].toDouble(),
        token: json['token'],
      );

  Map<String, dynamic> toJson() => {
        'line1': line1,
        'line2': line2,
        'landmark': landmark,
        'district': district,
        'state': state,
        'pincode': pincode,
        'latitude': latitude,
        'longitude': longitude,
        'token': token,
      };
}
