import 'dart:convert';

class Categories {
  final int results;
  final Metadata metadata;
  final List<Category> data;

  Categories({
    required this.results,
    required this.metadata,
    required this.data,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      results: json['results'],
      metadata: Metadata.fromJson(json['metadata']),
      data: List<Category>.from(json['data'].map((x) => Category.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'results': results,
      'metadata': metadata.toJson(),
      'data': List<dynamic>.from(data.map((x) => x.toJson())),
    };
  }
}

class Metadata {
  final int currentPage;
  final int numberOfPages;
  final int limit;

  Metadata({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
      currentPage: json['currentPage'],
      numberOfPages: json['numberOfPages'],
      limit: json['limit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currentPage': currentPage,
      'numberOfPages': numberOfPages,
      'limit': limit,
    };
  }
}

class Category {
  final String id;
  final String name;
  final String slug;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;

  Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'slug': slug,
      'image': image,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
