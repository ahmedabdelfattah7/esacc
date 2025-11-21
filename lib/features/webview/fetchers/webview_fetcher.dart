import '../models/webview_model.dart';

abstract class WebviewFetcher {
  Future<WebviewModel> loadUrl(String url);
}

class WebviewFetcherImpl implements WebviewFetcher {
  @override
  Future<WebviewModel> loadUrl(String url) async {
    // TODO: Implement URL validation and loading logic
    // Validate URL format and return WebviewModel
    if (!_isValidUrl(url)) {
      throw Exception('Invalid URL format');
    }

    return WebviewModel(
      url: url,
      isLoading: false,
    );
  }

  bool _isValidUrl(String url) {
    final uri = Uri.tryParse(url);
    return uri != null && (uri.hasScheme && (uri.scheme == 'http' || uri.scheme == 'https'));
  }
}

