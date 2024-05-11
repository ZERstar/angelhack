import 'package:flutter/material.dart';
import 'package:frontend_app/widgets/constants/texts.dart';

class MarketPlaceBody extends StatefulWidget {
  const MarketPlaceBody({super.key});

  @override
  State<MarketPlaceBody> createState() => _MarketPlaceBodyState();
}

class _MarketPlaceBodyState extends State<MarketPlaceBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Market Place \n Coming Soon...',
        style: h1TextStyle.copyWith(color: Colors.grey),
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
    );
  }
}
