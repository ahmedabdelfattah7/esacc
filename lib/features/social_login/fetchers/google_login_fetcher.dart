import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../models/social_login_model.dart';

abstract class GoogleLoginFetcher {
  Future<SocialLoginModel> login();
}

class GoogleLoginFetcherImpl implements GoogleLoginFetcher {
  @override
  Future<SocialLoginModel> login() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        // The user canceled the sign-in
        throw Exception('Google sign in canceled');
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user == null) {
        throw Exception('Firebase sign in failed');
      }

      return SocialLoginModel(
        accessToken: googleAuth.accessToken,
        userId: user.uid,
        email: user.email,
        name: user.displayName,
        profilePicture: user.photoURL,
        loginType: SocialLoginType.google,
      );
    } catch (e) {
      // Handle errors or rethrow to be handled by the caller
      rethrow;
    }
  }
}
