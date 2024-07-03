class ConstantUrl {
  static final ConstantUrl _appColors = ConstantUrl._internal();

  factory ConstantUrl() => _appColors;

  ConstantUrl._internal();
  static const String baseUrl = "http://www.bestrate.encureit.com/api/";
  static const String getArea = "get_area";
  static const String search_keywords = "search_keywords";
  static const String register = "register_new";
  static const String verify_registerotp = "verify_registerotp";
  static const String login = "login";
  static const String verify_loginotp = "verify_loginotp";
  static const String resend_mobile_otp = "resend_mobile_otp";
  static const String resend_email_otp = "resend_email_otp";
  static const String get_buyer_inquiries = "get_buyer_inquiries";
  static const String view_buyer_inquiry = "view_buyer_inquiry";
  static const String buyer_accepted_inquiry = "buyer_accepted_inquiry";
  static const String buyer_rejected_inquiry = "buyer_rejected_inquiry";
  static const String buyer_accept_quotation = "buyer_accept_quotation";
  static const String buyer_reject_quotation = "buyer_reject_quotation";
  static const String create_buyer_inquiry = "create_buyer_inquiry";
  static const String get_profile = "get_profile";
  static const String update_buyer_profile = "update_buyer_profile";

}