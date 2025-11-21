import '../models/social_login_model.dart';
import 'google_login_fetcher.dart';
import 'facebook_login_fetcher.dart';

abstract class SocialLoginFetcher {
  Future<SocialLoginModel> loginWithGoogle();
  Future<SocialLoginModel> loginWithFacebook();
}

class SocialLoginFetcherImpl implements SocialLoginFetcher {
  final GoogleLoginFetcher _googleFetcher;
  final FacebookLoginFetcher _facebookFetcher;

  SocialLoginFetcherImpl({
    required GoogleLoginFetcher googleFetcher,
    required FacebookLoginFetcher facebookFetcher,
  })  : _googleFetcher = googleFetcher,
        _facebookFetcher = facebookFetcher;

  @override
  Future<SocialLoginModel> loginWithGoogle() {
    return _googleFetcher.login();
  }

  @override
  Future<SocialLoginModel> loginWithFacebook() {
    return _facebookFetcher.login();
  }
}

