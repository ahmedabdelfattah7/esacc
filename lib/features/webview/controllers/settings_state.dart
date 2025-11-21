abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class SettingsUpdated extends SettingsState {
  final String url;
  final String? selectedDevice;

  SettingsUpdated({required this.url, this.selectedDevice});
}

class SettingsLoggedOut extends SettingsState {}
