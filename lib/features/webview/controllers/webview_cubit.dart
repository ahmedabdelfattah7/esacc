import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'webview_state.dart';
import '../fetchers/webview_fetcher.dart';

class WebviewCubit extends Cubit<WebviewState> {
  final WebviewFetcher _fetcher;

  WebviewCubit(this._fetcher) : super(WebviewInitial());

  Future<void> loadUrl(String url) async {
    emit(WebviewLoading(url));
    try {
      final result = await _fetcher.loadUrl(url);

      final controller = WebViewController();

      controller
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(
          NavigationDelegate(
            onPageFinished: (String url) async {
              final title = await controller.getTitle();
              updateTitle(title);
            },
            onWebResourceError: (WebResourceError error) {
              debugPrint('WebResourceError: ${error.description}');
            },
          ),
        )
        ..loadRequest(Uri.parse(result.url));

      emit(WebviewLoaded(result, controller));
    } catch (e) {
      emit(WebviewError(url, e.toString()));
    }
  }

  void updateTitle(String? title) {
    final currentState = state;
    if (currentState is WebviewLoaded) {
      emit(
        WebviewLoaded(
          currentState.model.copyWith(title: title),
          currentState.controller,
        ),
      );
    }
  }
}
