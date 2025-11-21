import '../models/webview_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

abstract class WebviewState {}

class WebviewInitial extends WebviewState {}

class WebviewLoading extends WebviewState {
  final String url;

  WebviewLoading(this.url);
}

class WebviewLoaded extends WebviewState {
  final WebviewModel model;
  final WebViewController controller;

  WebviewLoaded(this.model, this.controller);
}

class WebviewError extends WebviewState {
  final String url;
  final String message;

  WebviewError(this.url, this.message);
}
