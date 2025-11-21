// Webview Model
class WebviewModel {
  final String url;
  final String? title;
  final bool isLoading;

  WebviewModel({
    required this.url,
    this.title,
    this.isLoading = false,
  });

  WebviewModel copyWith({
    String? url,
    String? title,
    bool? isLoading,
  }) {
    return WebviewModel(
      url: url ?? this.url,
      title: title ?? this.title,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

