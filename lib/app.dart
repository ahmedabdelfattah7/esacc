import 'package:esacc/features/social_login/views/social_login_screen.dart';
import 'package:esacc/features/webview/views/settings_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EsaccApp extends StatelessWidget {
  const EsaccApp({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: user != null ? const SettingsScreen() : const SocialLoginScreen(),
    );
  }
}
