import 'dart:convert';

class ProductModel {
  final String idshop;
  final String nameshop;
  final String nameproduct;
  final String price;
  final String amount;
  final String unit;
  final String urlproduct;
  ProductModel({
    this.idshop,
    this.nameshop,
    this.nameproduct,
    this.price,
    this.amount,
    this.unit,
    this.urlproduct,
  });


  ProductModel copyWith({
    String idshop,
    String nameshop,
    String nameproduct,
    String price,
    String amount,
    String unit,
    String urlproduct,
  }) {
    return ProductModel(
      idshop: idshop ?? this.idshop,
      nameshop: nameshop ?? this.nameshop,
      nameproduct: nameproduct ?? this.nameproduct,
      price: price ?? this.price,
      amount: amount ?? this.amount,
      unit: unit ?? this.unit,
      urlproduct: urlproduct ?? this.urlproduct,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idshop': idshop,
      'nameshop': nameshop,
      'nameproduct': nameproduct,
      'price': price,
      'amount': amount,
      'unit': unit,
      'urlproduct': urlproduct,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      idshop: map['idshop'],
      nameshop: map['nameshop'],
      nameproduct: map['nameproduct'],
      price: map['price'],
      amount: map['amount'],
      unit: map['unit'],
      urlproduct: map['urlproduct'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(idshop: $idshop, nameshop: $nameshop, nameproduct: $nameproduct, price: $price, amount: $amount, unit: $unit, urlproduct: $urlproduct)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ProductModel &&
      other.idshop == idshop &&
      other.nameshop == nameshop &&
      other.nameproduct == nameproduct &&
      other.price == price &&
      other.amount == amount &&
      other.unit == unit &&
      other.urlproduct == urlproduct;
  }

  @override
  int get hashCode {
    return idshop.hashCode ^
      nameshop.hashCode ^
      nameproduct.hashCode ^
      price.hashCode ^
      amount.hashCode ^
      unit.hashCode ^
      urlproduct.hashCode;
  }
}
