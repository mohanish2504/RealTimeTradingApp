import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:frontend/models/ticker.dart';
import 'package:frontend/urls.dart';
import 'package:meta/meta.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'ticker_listener_state.dart';

class TickerListenerCubit extends Cubit<TickerListenerState> {
  final String ticker;
  WebSocketChannel? _tickerChannel;
  TickerListenerCubit(this.ticker) : super(TickerListenerInitial()) {
    _listen();
  }

  void _listen() {
    _tickerChannel = WebSocketChannel.connect(
        Uri.parse(wsUrlBuilder(paths: ['trades', ticker])));
    _tickerChannel?.stream.listen((event) {
      // debugPrint(event.runtimeType.toString());
      Ticker? ticker = Ticker.fromJson(jsonDecode(event));
      if (ticker != null) {
        emit(NewTicker(ticker));
      }
    });
  }

  void closeConnection() {
    _tickerChannel?.sink.close();
  }

  @override
  Future<void> close() {
    // TODO: implement close
    closeConnection();
    return super.close();
  }
}
