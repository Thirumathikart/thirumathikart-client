class User {
  String? firstName, lastName, email;
  final int? userId;
  int? mobileNumber;
  List<String>? addresses;
  User({
    this.userId,
    this.firstName,
    this.lastName,
    this.mobileNumber,
    this.email,
    this.addresses,
  });
}
