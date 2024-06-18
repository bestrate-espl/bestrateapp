class ConstantUrl {
  static final ConstantUrl _appColors = ConstantUrl._internal();

  factory ConstantUrl() => _appColors;

  ConstantUrl._internal();
  static const String baseUrl = "http://www.bestrate.encureit.com/api/";
  static const String getArea = "get_area";
  static const String search_keywords = "search_keywords";
  static const String register = "register";
  static const String verify_registerotp = "verify_registerotp";
  static const String login = "login";
  static const String verify_loginotp = "verify_loginotp";

  /*Seller Api's*/
  static const String get_seller_inquiries = "get_seller_inquiries";
  static const String view_inquiry = "view_inquiry";
  static const String get_profile = "get_profile";
  static const String seller_keyword_list = "seller_keyword_list";
  static const String add_keyword_request = "add_keyword_request";
  static const String add_seller_keyword = "add_seller_keyword";
  static const String seller_delete_keyword = "seller_delete_keyword";
  static const String resend_mobile_otp = "resend_mobile_otp";
  static const String resend_email_otp = "resend_email_otp";
  static const String sellerprofileupdate = "sellerprofileupdate";
  static const String sendquotation = "sendquotation";

  /*Buyer Api's*/
  static const String get_buyer_inquiries = "get_buyer_inquiries";
  static const String view_buyer_inquiry = "view_buyer_inquiry";

}