// Social Login Model
class SocialLoginModel {
  final String? accessToken;
  final String? userId;
  final String? email;
  final String? name;
  final String? profilePicture;
  final SocialLoginType loginType;

  SocialLoginModel({
    this.accessToken,
    this.userId,
    this.email,
    this.name,
    this.profilePicture,
    required this.loginType,
  });
}

enum SocialLoginType {
  google,
  facebook,
}

