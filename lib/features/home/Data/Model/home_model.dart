class HomeModel {
  bool status;
  dynamic message;
  List<Banner> banners;
  List<Product> products;
  String ad;

  HomeModel({
    required this.status,
    this.message,
    required this.banners,
    required this.products,
    required this.ad,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      status: json['status'],
      message: json['message'],
      banners: List<Banner>.from(
          json['data']['banners'].map((x) => Banner.fromJson(x))),
      products: List<Product>.from(
          json['data']['products'].map((x) => Product.fromJson(x))),
      ad: json['data']['ad'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': {
        'banners': banners.map((x) => x.toJson()).toList(),
        'products': products.map((x) => x.toJson()).toList(),
        'ad': ad,
      },
    };
  }
}

class Banner {
  int id;
  String image;
  dynamic category;
  dynamic product;

  Banner({
    required this.id,
    required this.image,
    this.category,
    this.product,
  });

  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(
      id: json['id'],
      image: json['image'],
      category: json['category'],
      product: json['product'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'category': category,
      'product': product,
    };
  }
}

class Product {
  int id;
  double price;
  double oldPrice;
  double discount;
  String image;
  String name;
  String description;
  List<String> images;
  bool inFavorites;
  bool inCart;

  Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      price: (json['price'] is int)
          ? (json['price'] as int).toDouble()
          : json['price'],
      oldPrice: (json['old_price'] is int)
          ? (json['old_price'] as int).toDouble()
          : json['old_price'],
      discount: (json['discount'] is int)
          ? (json['discount'] as int).toDouble()
          : json['discount'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
      images: List<String>.from(json['images']),
      inFavorites: json['in_favorites'],
      inCart: json['in_cart'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'price': price,
      'old_price': oldPrice,
      'discount': discount,
      'image': image,
      'name': name,
      'description': description,
      'images': images,
      'in_favorites': inFavorites,
      'in_cart': inCart,
    };
  }
}
