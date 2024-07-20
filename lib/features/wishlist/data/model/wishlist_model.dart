class WishlistModel {
  String status;
  int count;
  List<Product> data;

  WishlistModel({
    required this.status,
    required this.count,
    required this.data,
  });

  factory WishlistModel.fromJson(Map<String, dynamic> json) {
    return WishlistModel(
      status: json['status'],
      count: json['count'],
      data: (json['data'] as List)
          .map((item) => Product.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'count': count,
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

class Product {
  int sold;
  List<String> images;
  List<Subcategory> subcategory;
  int ratingsQuantity;
  String id;
  String title;
  String slug;
  String description;
  int quantity;
  double price;
  String imageCover;
  Category category;
  Brand brand;
  double ratingsAverage;
  DateTime createdAt;
  DateTime updatedAt;

  Product({
    required this.sold,
    required this.images,
    required this.subcategory,
    required this.ratingsQuantity,
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.quantity,
    required this.price,
    required this.imageCover,
    required this.category,
    required this.brand,
    required this.ratingsAverage,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      sold: json['sold'],
      images: List<String>.from(json['images']),
      subcategory: (json['subcategory'] as List)
          .map((item) => Subcategory.fromJson(item))
          .toList(),
      ratingsQuantity: json['ratingsQuantity'],
      id: json['_id'],
      title: json['title'],
      slug: json['slug'],
      description: json['description'],
      quantity: json['quantity'],
      price: json['price'].toDouble(),
      imageCover: json['imageCover'],
      category: Category.fromJson(json['category']),
      brand: Brand.fromJson(json['brand']),
      ratingsAverage: json['ratingsAverage'].toDouble(),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sold': sold,
      'images': images,
      'subcategory': subcategory.map((item) => item.toJson()).toList(),
      'ratingsQuantity': ratingsQuantity,
      '_id': id,
      'title': title,
      'slug': slug,
      'description': description,
      'quantity': quantity,
      'price': price,
      'imageCover': imageCover,
      'category': category.toJson(),
      'brand': brand.toJson(),
      'ratingsAverage': ratingsAverage,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

class Subcategory {
  String id;
  String name;
  String slug;
  String category;

  Subcategory({
    required this.id,
    required this.name,
    required this.slug,
    required this.category,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) {
    return Subcategory(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'slug': slug,
      'category': category,
    };
  }
}

class Category {
  String id;
  String name;
  String slug;
  String image;

  Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'slug': slug,
      'image': image,
    };
  }
}

class Brand {
  String id;
  String name;
  String slug;
  String image;

  Brand({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'slug': slug,
      'image': image,
    };
  }
}
