// To parse this JSON data, do
//
//     final productResponse = productResponseFromJson(jsonString);

import 'dart:convert';

List<ProductResponse> productResponseFromJson(String str) =>
    List<ProductResponse>.from(
        // ignore: unnecessary_lambdas
        json.decode(str).map((x) => ProductResponse.fromJson(x)));

String productResponseToJson(List<ProductResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductResponse {
  ProductResponse({
    this.productId,
    this.productPhoto,
    this.productImages,
    this.productTitle,
    this.productCategory,
    this.productPrice,
    this.productDescription,
    this.productStock,
    this.slug,
    this.available,
    this.created,
    this.updated,
    this.seller,
  });

  int? productId;
  String? productPhoto;
  List<ProductImage>? productImages;
  String? productTitle;
  String? productCategory;
  String? productPrice;
  String? productDescription;
  int? productStock;
  String? slug;
  bool? available;
  DateTime? created;
  DateTime? updated;
  Seller? seller;

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      ProductResponse(
        productId: json['product_id'],
        productPhoto: json['product_photo'],
        productImages: List<ProductImage>.from(
            // ignore: unnecessary_lambdas
            json['product_images'].map((x) => ProductImage.fromJson(x))),
        productTitle: json['product_title'],
        productCategory: json['product_category'],
        productPrice: json['product_price'],
        productDescription: json['product_description'],
        productStock: json['product_stock'],
        slug: json['slug'],
        available: json['available'],
        created: DateTime.parse(json['created']),
        updated: DateTime.parse(json['updated']),
        seller: Seller.fromJson(json['seller']),
      );

  Map<String, dynamic> toJson() => {
        'product_id': productId,
        'product_photo': productPhoto,
        'product_images':
            List<dynamic>.from(productImages!.map((x) => x.toJson())),
        'product_title': productTitle,
        'product_category': productCategory,
        'product_price': productPrice,
        'product_description': productDescription,
        'product_stock': productStock,
        'slug': slug,
        'available': available,
        'created': created!.toIso8601String(),
        'updated': updated!.toIso8601String(),
        'seller': seller!.toJson(),
      };
}

class ProductImage {
  ProductImage({
    this.id,
    this.productImage,
    this.product,
  });

  int? id;
  String? productImage;
  int? product;

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
        id: json['id'],
        productImage: json['product_image'],
        product: json['product'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'product_image': productImage,
        'product': product,
      };
}

class Seller {
  Seller({
    this.sellerAccount,
    this.sellerName,
    this.sellerContact,
    this.sellerEmail,
    this.password,
    this.token,
    this.isVerified,
    this.firebaseToken,
    this.ifscCode,
    this.branch,
    this.memberCode,
    this.sellerAddress,
  });

  int? sellerAccount;
  String? sellerName;
  String? sellerContact;
  dynamic sellerEmail;
  String? password;
  String? token;
  bool? isVerified;
  String? firebaseToken;
  String? ifscCode;
  dynamic branch;
  String? memberCode;
  int? sellerAddress;

  factory Seller.fromJson(Map<String, dynamic> json) => Seller(
        sellerAccount: json['seller_account'],
        sellerName: json['seller_name'],
        sellerContact: json['seller_contact'],
        sellerEmail: json['seller_email'],
        password: json['password'],
        token: json['token'],
        isVerified: json['is_verified'],
        firebaseToken: json['firebase_token'],
        ifscCode: json['ifsc_code'],
        branch: json['branch'],
        memberCode: json['member_code'],
        sellerAddress: json['seller_address'],
      );

  Map<String, dynamic> toJson() => {
        'seller_account': sellerAccount,
        'seller_name': sellerName,
        'seller_contact': sellerContact,
        'seller_email': sellerEmail,
        'password': password,
        'token': token,
        'is_verified': isVerified,
        'firebase_token': firebaseToken,
        'ifsc_code': ifscCode,
        'branch': branch,
        'member_code': memberCode,
        'seller_address': sellerAddress,
      };
}
