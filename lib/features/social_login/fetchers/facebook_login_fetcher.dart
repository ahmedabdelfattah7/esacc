import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import '../models/social_login_model.dart';

abstract class FacebookLoginFetcher {
  Future<SocialLoginModel> login();
}

class FacebookLoginFetcherImpl implements FacebookLoginFetcher {
  @override
  Future<SocialLoginModel> login() async {
    try {
      // Trigger the authentication flow
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status != LoginStatus.success) {
        // The user canceled the sign-in or there was an error
        throw Exception('Facebook sign in failed: ${result.status}');
      }

      // Get the access token
      final AccessToken? accessToken = result.accessToken;

      if (accessToken == null) {
        throw Exception('Failed to get Facebook access token');
      }

      // Create a credential from the access token
      final OAuthCredential credential = FacebookAuthProvider.credential(
        accessToken.tokenString,
      );

      // Sign in to Firebase with the Facebook credential
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user == null) {
        throw Exception('Firebase sign in failed');
      }

      return SocialLoginModel(
        accessToken: accessToken.tokenString,
        userId: user.uid,
        email: user.email,
        name: user.displayName,
        profilePicture: user.photoURL,
        loginType: SocialLoginType.facebook,
      );
    } catch (e) {
      // Handle errors or rethrow to be handled by the caller
      rethrow;
    }
  }
}
