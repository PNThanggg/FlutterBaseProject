import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../../common/utils/app_log.dart';
import '../widget/app_container.dart';
import '../widget/app_header.dart';

class WebViewScreen extends StatefulWidget {
  final String url;
  final String title;

  const WebViewScreen({
    Key? key,
    required this.url,
    required this.title,
  }) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  @override
  void initState() {
    AppLog.info("Web view screen init");

    super.initState();
  }

  @override
  void dispose() {
    AppLog.info("Web view screen dispose");

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Column(
        children: [
          AppHeader(
            title: widget.title,
          ),
          Expanded(
            child: InAppWebView(
              initialUrlRequest: URLRequest(
                url: Uri.parse(widget.url),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
