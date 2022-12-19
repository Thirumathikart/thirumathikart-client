// To parse this JSON data, do
//
//     final updateAddressRequest = updateAddressRequestFromJson(jsonString);

import 'dart:convert';

UpdateAddressRequest updateAddressRequestFromJson(String str) =>
    UpdateAddressRequest.fromJson(json.decode(str));

String updateAddressRequestToJson(UpdateAddressRequest data) =>
    json.encode(data.toJson());

class UpdateAddressRequest {
  UpdateAddressRequest({
    this.id,
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

  int? id;
  String? line1;
  String? line2;
  String? landmark;
  String? district;
  String? state;
  String? pincode;
  double? latitude;
  double? longitude;
  String? token;

  factory UpdateAddressRequest.fromJson(Map<String, dynamic> json) =>
      UpdateAddressRequest(
        id: json['id'],
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
        'id': id,
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
