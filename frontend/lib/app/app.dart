import 'package:flutter/material.dart';
import 'package:frontend/app/trading_view.dart';

class RealTimeTradingApp extends StatelessWidget {
  const RealTimeTradingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Realtime Trading App",
      home: TradingView(),
    );
  }
}
