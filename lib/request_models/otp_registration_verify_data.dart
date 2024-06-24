class OtpRegistrationVerifyData{
  final int userId;
  final String mobileNo;
  final String mobileOtp;
  final String emailId;
  final String emailOtp;

  OtpRegistrationVerifyData({
    required this.userId,
    required this.mobileNo,
    required this.mobileOtp,
    required this.emailId,
    required this.emailOtp,
  });
}