class Applink {
  //localhost= 10.0.2.2
  static const String server = 'http://10.0.2.2/ecommerce';
  static const String test = '$server/test.php';
  //============================================ Images ============================================//
  static const String imageLink = '$server/upload';
  static const String categoriesLink = '$imageLink/categories';
  static const String iteamsLink = '$imageLink/iteams';
  //============================================ Auth ============================================//
  static const String signupLink = '$server/Auth/signup.php';
  static const String loginLink = '$server/Auth/login.php';
  static const String verfiyCodeSignUp = '$server/Auth/verfiycode.php';
  static const String resendVerfiyCode = '$server/Auth/resend.php';
  //============================================ forget passwrod ============================================//
  static const String checkEmailLink = '$server/forget_password/checkEmail.php';
  static const String verfiyCodeCheckEmailLink =
      '$server/forget_password/verfiyCode.php';
  static const String reseetPasswordLink =
      '$server/forget_password/resetPasswrod.php';
  //============================================ Home ============================================//
  static const String homeLink = '$server/home.php';
  //============================================ Search ============================================//
  static const String searchLink = '$server/search/search.php';
  //============================================ ItemsPage ============================================//
  static const String itmesLink = '$server/items/items.php';
  //============================================ favorite ============================================//
  static const String addFavorite = '$server/favorite/add.php';
  static const String removeFavorite = '$server/favorite/remove.php';
  static const String viewFavorite = '$server/favorite/view.php';
  //============================================ cart ============================================//
  static const String viewCart = '$server/cart/view.php';
  static const String addCart = '$server/cart/add.php';
  static const String removeCart = '$server/cart/remove.php';
  static const String getCount = '$server/cart/getcout.php';
  //============================================ address ============================================//
  static const String viewAddress = '$server/address/view.php';
  static const String deleteAddress = '$server/address/delete.php';
  static const String editAddress = '$server/address/edit.php';
  static const String addAddress = '$server/address/add.php';
  //============================================ coupon ============================================//
  static const String checkCoupon = '$server/coupon/checkCoupon.php';
  //============================================ orders ============================================//
  static const String checkOut = '$server/orders/checkout.php';
  static const String pendingOrder = '$server/orders/pending.php';
  static const String archiveOrder = '$server/orders/archive.php';
  static const String detailseOrder = '$server/orders/details.php';
  static const String deleteOrder = '$server/orders/delete.php';
  static const String ratingOrder = '$server/orders/rating.php';
  //============================================ notification Page ============================================//
  static const String viewNotification = '$server/notification/view.php';
  //============================================ offer Page ============================================//
  static const String viewOffers = '$server/offers/view.php';
}
