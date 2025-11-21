import '../models/social_login_model.dart';

abstract class SocialLoginState {}

class SocialLoginInitial extends SocialLoginState {}

class SocialLoginLoading extends SocialLoginState {}

class SocialLoginSuccess extends SocialLoginState {
  final SocialLoginModel user;

  SocialLoginSuccess(this.user);
}

class SocialLoginError extends SocialLoginState {
  final String message;

  SocialLoginError(this.message);
}

