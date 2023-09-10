import 'package:flutter/material.dart';
import 'package:frontend/app/chart.dart';
import 'package:frontend/models/ticker.dart';
import 'package:frontend/repository/trading_repository.dart';

class TradingView extends StatefulWidget {
  const TradingView({super.key});

  @override
  State<TradingView> createState() => _TradingViewState();
}

class _TradingViewState extends State<TradingView>
    with TickerProviderStateMixin {
  TabController? _controller;
  List<String> currentTickers = [];
  TickerRepository _tickerRepository = TickerRepository();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  void initializeController() {
    _controller = TabController(length: currentTickers.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<String>?>(
          future: _tickerRepository.fetchTickers(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Text("Sorry! no data"),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasData && snapshot.data != null) {
              currentTickers = snapshot.data!;
              currentTickers.sort();
            }

            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    itemCount: currentTickers.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                        crossAxisCount: 2,
                        childAspectRatio: 4 / 2),
                    itemBuilder: (ctx, index) {
                      String ticker = currentTickers[index];
                      return Container(
                          margin: EdgeInsets.all(16),
                          child: TickerChart(ticker: ticker));
                    }));
          }),
    );
  }
}
