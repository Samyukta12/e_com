// To parse this JSON data, do
//
//     final cartList = cartListFromJson(jsonString);

import 'dart:convert';

List<CartList> cartListFromJson(String str) => List<CartList>.from(json.decode(str).map((x) => CartList.fromJson(x)));

String cartListToJson(List<CartList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartList {
  int id;
  int userId;
  DateTime date;
  List<Product> products;
  int v;

  CartList({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
    required this.v,
  });

  factory CartList.fromJson(Map<String, dynamic> json) => CartList(
    id: json["id"],
    userId: json["userId"],
    date: DateTime.parse(json["date"]),
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "date": date.toIso8601String(),
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "__v": v,
  };
}

class Product {
  int productId;
  int quantity;

  Product({
    required this.productId,
    required this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productId: json["productId"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "productId": productId,
    "quantity": quantity,
  };
}
