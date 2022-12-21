import 'package:thirumathikart_app/models/address.dart';

class User {
  String? firstName, lastName, email;
  final int? userId;
  int? mobileNumber;
  List<Address>? addresses;
  User({
    this.userId,
    this.firstName,
    this.lastName,
    this.mobileNumber,
    this.email,
    this.addresses,
  });
}
