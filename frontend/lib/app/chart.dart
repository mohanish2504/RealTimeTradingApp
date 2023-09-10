import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/cubit/ticker_listener_cubit.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math' as math;
import '../models/ticker.dart';

class TickerChart extends StatefulWidget {
  final String ticker;
  const TickerChart({super.key, required this.ticker});

  @override
  State<TickerChart> createState() => _TickerChartState();
}

class _TickerChartState extends State<TickerChart> {
  TickerListenerCubit? tickerListenerCubit;
  List<Ticker> currTickers = [];
  ChartSeriesController? chartSeriesController;
  static final int maxLength = 100;
  @override
  void initState() {
    // TODO: implement initState
    tickerListenerCubit = TickerListenerCubit(widget.ticker);

    super.initState();
  }

  double currMax = 1;
  @override
  Widget build(BuildContext context) {
    Color color =
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    return BlocBuilder<TickerListenerCubit, TickerListenerState>(
      bloc: tickerListenerCubit,
      buildWhen: ((previous, current) {
        debugPrint(current.toString() + " " + chartSeriesController.toString());
        if (current is NewTicker) {
          if (chartSeriesController != null) {
            currTickers.add(current.ticker);
            //currMax = math.max(currMax, current.ticker.price ?? 0);

            if (currTickers.length >= maxLength) {
              currTickers.removeAt(0);
            }
          }
        }
        return true;
      }),
      builder: (context, state) {
        return SfCartesianChart(
          //zoomPanBehavior: ZoomPanBehavior(),
          legend: Legend(isVisible: true, position: LegendPosition.bottom),
          primaryXAxis:
              DateTimeAxis(intervalType: DateTimeIntervalType.minutes),
          primaryYAxis: NumericAxis(),
          enableAxisAnimation: false,

          series: [
            FastLineSeries<Ticker, DateTime>(
                color: color,
                markerSettings: const MarkerSettings(isVisible: true),
                onRendererCreated: (c) => chartSeriesController = c,
                name: widget.ticker.toUpperCase(),
                dataSource: currTickers,
                animationDuration: 0,
                xValueMapper: (t, index) => t.timestamp,
                yValueMapper: (t, index) => t.price)
          ],
        );
      },
    );
  }
}
