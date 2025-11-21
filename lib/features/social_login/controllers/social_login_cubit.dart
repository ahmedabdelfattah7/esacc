import 'package:flutter_bloc/flutter_bloc.dart';
import 'social_login_state.dart';
import '../fetchers/social_login_fetcher.dart';

class SocialLoginCubit extends Cubit<SocialLoginState> {
  final SocialLoginFetcher _fetcher;

  SocialLoginCubit(this._fetcher) : super(SocialLoginInitial());

  Future<void> loginWithGoogle() async {
    print('SocialLoginCubit: loginWithGoogle called');
    emit(SocialLoginLoading());
    try {
      final result = await _fetcher.loginWithGoogle();
      print('SocialLoginCubit: loginWithGoogle success');
      emit(SocialLoginSuccess(result));
    } catch (e, stack) {
      print('SocialLoginCubit: loginWithGoogle error: $e');
      print(stack);
      emit(SocialLoginError(e.toString()));
    }
  }

  Future<void> loginWithFacebook() async {
    emit(SocialLoginLoading());
    try {
      final result = await _fetcher.loginWithFacebook();
      emit(SocialLoginSuccess(result));
    } catch (e) {
      emit(SocialLoginError(e.toString()));
    }
  }

  void logout() {
    emit(SocialLoginInitial());
  }
}
