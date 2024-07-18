import 'dart:convert';

CartResponse cartResponseFromJson(String str) =>
    CartResponse.fromJson(json.decode(str));

String cartResponseToJson(CartResponse data) => json.encode(data.toJson());

class CartResponse {
  CartResponse({
    required this.status,
    required this.numOfCartItems,
    required this.data,
  });

  String status;
  int numOfCartItems;
  CartData data;

  factory CartResponse.fromJson(Map<String, dynamic> json) => CartResponse(
    status: json["status"],
    numOfCartItems: json["numOfCartItems"],
    data: CartData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "numOfCartItems": numOfCartItems,
    "data": data.toJson(),
  };
}

class CartData {
  CartData({
    required this.id,
    required this.cartOwner,
    required this.products,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.totalCartPrice,
  });

  String id;
  String cartOwner;
  List<ProductItem> products;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  int totalCartPrice;

  factory CartData.fromJson(Map<String, dynamic> json) => CartData(
    id: json["_id"],
    cartOwner: json["cartOwner"],
    products: List<ProductItem>.from(
        json["products"].map((x) => ProductItem.fromJson(x))),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    totalCartPrice: json["totalCartPrice"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "cartOwner": cartOwner,
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "totalCartPrice": totalCartPrice,
  };
}

class ProductItem {
  ProductItem({
    required this.count,
    required this.id,
    required this.product,
    required this.price,
  });

  int count;
  String id;
  Product product;
  int price;

  factory ProductItem.fromJson(Map<String, dynamic> json) => ProductItem(
    count: json["count"],
    id: json["_id"],
    product: Product.fromJson(json["product"]),
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "_id": id,
    "product": product.toJson(),
    "price": price,
  };
}

class Product {
  Product({
    required this.subcategory,
    required this.id,
    required this.title,
    required this.quantity,
    required this.imageCover,
    required this.category,
    required this.brand,
    required this.ratingsAverage,
  });

  List<Subcategory> subcategory;
  String id;
  String title;
  int quantity;
  String imageCover;
  Category category;
  Brand brand;
  double ratingsAverage;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    subcategory: List<Subcategory>.from(
        json["subcategory"].map((x) => Subcategory.fromJson(x))),
    id: json["_id"],
    title: json["title"],
    quantity: json["quantity"],
    imageCover: json["imageCover"],
    category: Category.fromJson(json["category"]),
    brand: Brand.fromJson(json["brand"]),
    ratingsAverage: json["ratingsAverage"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "subcategory": List<dynamic>.from(subcategory.map((x) => x.toJson())),
    "_id": id,
    "title": title,
    "quantity": quantity,
    "imageCover": imageCover,
    "category": category.toJson(),
    "brand": brand.toJson(),
    "ratingsAverage": ratingsAverage,
  };
}

class Subcategory {
  Subcategory({
    required this.id,
    required this.name,
    required this.slug,
    required this.category,
  });

  String id;
  String name;
  String slug;
  String category;

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
    id: json["_id"],
    name: json["name"],
    slug: json["slug"],
    category: json["category"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "slug": slug,
    "category": category,
  };
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  String id;
  String name;
  String slug;
  String image;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["_id"],
    name: json["name"],
    slug: json["slug"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "slug": slug,
    "image": image,
  };
}

class Brand {
  Brand({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  String id;
  String name;
  String slug;
  String image;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    id: json["_id"],
    name: json["name"],
    slug: json["slug"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "slug": slug,
    "image": image,
  };
}
