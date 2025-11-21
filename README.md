

Esacc App
<img width="1170" height="2532" alt="IMG_0681" src="https://github.com/user-attachments/assets/7ac9f2ed-4f15-493c-9971-31d3b20fe054" />
<img width="1170" height="2532" alt="IMG_0682" src="https://github.com/user-attachments/assets/3de27232-3863-4095-a6b4-25b79f7f1016" />
<img width="1170" height="2532" alt="IMG_0678" src="https://github.com/user-attachments/assets/8fb1346f-de22-45ff-b1b7-9b5b2e79687e" />

A robust Flutter application featuring secure Social Login (Google and Facebook) and a configurable WebView interface. Built with clean architecture principles using BLoC/Cubit for state management.

Features
	•	Social Authentication:
	•	Google Sign-In integrated via Firebase Auth.
	•	Facebook Login integrated via Firebase Auth.
	•	Auto-Login persists user session and bypasses the login screen if already authenticated.
	•	Logout securely signs out from Firebase and social providers.
	•	WebView Integration:
	•	Configurable URL that can be set dynamically from the Settings screen.
	•	Device Selection for network devices such as printers and scanners (UI implementation).
	•	Dynamic Title where the AppBar automatically updates to show the current web page title.
	•	Navigation Controls with built-in navigation support.
	•	Modern UI/UX:
	•	Stateless Architecture optimized for performance using StatelessWidgets and BLoC.
	•	Responsive Design adapting to different screen sizes.
	•	Feedback with loading indicators and error handling via SnackBars.

Tech Stack
	•	Framework: Flutter
	•	State Management: flutter_bloc (Cubit)
	•	Authentication: Firebase Auth
	•	WebView: webview_flutter
	•	Social SDKs:
	•	google_sign_in
	•	flutter_facebook_auth

Project Structure

The project follows a feature-based directory structure:

lib/
├── app.dart                Main App Widget and Auth Check
├── main.dart               Entry Point and Firebase Init
└── features/
    ├── social_login/       Login Feature
    │   ├── controllers/    Cubit and State
    │   ├── fetchers/       Auth Logic (Google and Facebook)
    │   ├── models/         User Models
    │   └── views/          Login UI
    └── webview/            WebView and Settings Feature
        ├── controllers/    Settings and WebView Cubits
        ├── fetchers/       WebView Logic
        └── views/          SettingsScreen and WebviewView

Setup and Configuration

Prerequisites
	•	Flutter SDK
	•	Firebase Project

Configuration Files

Ensure you have the following configuration files from your Firebase Console:
	•	Android: android/app/google-services.json
	•	iOS: ios/Runner/GoogleService-Info.plist

Facebook Setup
	•	Android: Ensure strings.xml in android/app/src/main/res/values/ contains your facebook_app_id and facebook_client_token.
	•	iOS: Ensure Info.plist contains your Facebook App ID and Client Token.

Running the App
	1.	Install Dependencies:

flutter pub get


	2.	Run on Android:

flutter run


	3.	Run on iOS (requires macOS):

cd ios
pod install
cd ..
flutter run



