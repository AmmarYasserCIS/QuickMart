class CheckoutUrlModel {
  final String url;

  CheckoutUrlModel({
    required this.url,
  });

  factory CheckoutUrlModel.fromJson(Map<String, dynamic> json) {
    return CheckoutUrlModel(
      url: json['session']['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
    };
  }
}
