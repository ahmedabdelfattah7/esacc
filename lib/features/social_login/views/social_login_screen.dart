import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controllers/social_login_cubit.dart';
import '../fetchers/social_login_fetcher.dart';
import '../fetchers/google_login_fetcher.dart';
import '../fetchers/facebook_login_fetcher.dart';
import 'social_login_view.dart';

class SocialLoginScreen extends StatelessWidget {
  const SocialLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SocialLoginCubit(
        SocialLoginFetcherImpl(
          googleFetcher: GoogleLoginFetcherImpl(),
          facebookFetcher: FacebookLoginFetcherImpl(),
        ),
      ),
      child: const SocialLoginView(),
    );
  }
}

