class EndPoint {
  static String baseUrl = "https://ecommerce.routemisr.com/";
  static String signIn = "api/v1/auth/signin";
  static String signUp = "register";
  static String category = "api/v1/categories";
  static String home =
      "api/v1/products?limit=20&category[in]=6439d2d167d9aa4ca970649f";
  static String products = "api/v1/products";
  static String cart = "api/v1/cart";
  static String DeleteCartitem(id){
    return "api/v1/cart/$id";
  }
  static String wishlist = "api/v1/wishlist";
  static String DeleteWishlistitem(id){
    return "api/v1/wishlist/$id";
  }
  static String Checkout(id){
    return "api/v1/orders/checkout-session/$id";
  }
}



class ApiKey {
  static String status = "status";
  static String userName = "name";
  static String userEmail = "email";
  static String errorMessage = "message";
  static String email = "email";
  static String password = "password";
  static String token = "token";
  static String message = "message";
  static String id = "id";
  static String name = "name";
  static String phone = "phone";
  static String confirmPassword = "confirmPassword";
  static String location = "location";
  static String profilePic = "profilePic";
  static String image = "image";
  static String productId = "productId";
}
