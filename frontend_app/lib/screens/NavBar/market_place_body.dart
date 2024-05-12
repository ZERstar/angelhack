import 'package:flutter/material.dart';
import 'package:frontend_app/widgets/constants/colors.dart';
import 'package:frontend_app/widgets/constants/texts.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MarketPlaceBody extends StatefulWidget {
  const MarketPlaceBody({Key? key}) : super(key: key);

  @override
  _MarketPlaceBodyState createState() => _MarketPlaceBodyState();
}

class _MarketPlaceBodyState extends State<MarketPlaceBody> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://www.exportersindia.com/'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Market Place',
          style: h1TextStyle.copyWith(color: textBlack),
        ),
        centerTitle: true,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 2,
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
