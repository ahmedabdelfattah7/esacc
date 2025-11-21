import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  String _url = '';
  String? _selectedDevice;

  SettingsCubit() : super(SettingsInitial());

  String get url => _url;
  String? get selectedDevice => _selectedDevice;

  void updateUrl(String url) {
    _url = url;
    emit(SettingsUpdated(url: _url, selectedDevice: _selectedDevice));
  }

  void updateDevice(String? device) {
    _selectedDevice = device;
    emit(SettingsUpdated(url: _url, selectedDevice: _selectedDevice));
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      await FacebookAuth.instance.logOut();
      emit(SettingsLoggedOut());
    } catch (e) {
      // Handle error if needed, for now just emit logged out to ensure user can leave
      emit(SettingsLoggedOut());
    }
  }
}
