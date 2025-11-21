import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../controllers/webview_cubit.dart';
import '../controllers/webview_state.dart';
import '../fetchers/webview_fetcher.dart';

class WebviewView extends StatelessWidget {
  final String url;

  const WebviewView({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WebviewCubit(WebviewFetcherImpl())..loadUrl(url),
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<WebviewCubit, WebviewState>(
            builder: (context, state) {
              if (state is WebviewLoaded && state.model.title != null) {
                return Text(state.model.title!);
              }
              return const Text('WebView');
            },
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: BlocBuilder<WebviewCubit, WebviewState>(
          builder: (context, state) {
            if (state is WebviewLoading || state is WebviewInitial) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is WebviewLoaded) {
              return WebViewWidget(controller: state.controller);
            }

            if (state is WebviewError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 64,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 16),
                    Text('Error: ${state.message}'),
                  ],
                ),
              );
            }

            return const Center(child: Text('Initializing...'));
          },
        ),
      ),
    );
  }
}
