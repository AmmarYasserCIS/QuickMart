import 'dart:convert';

class HomeModel {
  final int results;
  final Metadata metadata;
  final List<Product> data;

  HomeModel({
    required this.results,
    required this.metadata,
    required this.data,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      results: json['results'],
      metadata: Metadata.fromJson(json['metadata']),
      data: List<Product>.from(json['data'].map((item) => Product.fromJson(item))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'results': results,
      'metadata': metadata.toJson(),
      'data': List<dynamic>.from(data.map((product) => product.toJson())),
    };
  }
}

class Metadata {
  final int currentPage;
  final int numberOfPages;
  final int limit;
  final int? nextPage;

  Metadata({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
    this.nextPage,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
      currentPage: json['currentPage'],
      numberOfPages: json['numberOfPages'],
      limit: json['limit'],
      nextPage: json['nextPage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currentPage': currentPage,
      'numberOfPages': numberOfPages,
      'limit': limit,
      'nextPage': nextPage,
    };
  }
}

class Product {
  final int sold;
  final List<String> images;
  final List<Subcategory> subcategory;
  final int ratingsQuantity;
  final String id;
  final String title;
  final String slug;
  final String description;
  final int quantity;
  final double price;
  final String imageCover;
  final Category category;
  final Brand brand;
  final double ratingsAverage;
  final DateTime createdAt;
  final DateTime updatedAt;

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
      subcategory: List<Subcategory>.from(json['subcategory'].map((item) => Subcategory.fromJson(item))),
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
      'images': List<dynamic>.from(images),
      'subcategory': List<dynamic>.from(subcategory.map((sub) => sub.toJson())),
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
  final String id;
  final String name;
  final String slug;
  final String category;

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
  final String id;
  final String name;
  final String slug;
  final String image;

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
  final String id;
  final String name;
  final String slug;
  final String image;

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
