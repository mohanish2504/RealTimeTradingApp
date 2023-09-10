part of 'ticker_listener_cubit.dart';

@immutable
sealed class TickerListenerState extends Equatable {}

final class TickerListenerInitial extends TickerListenerState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NewTicker extends TickerListenerState {
  final Ticker ticker;
  NewTicker(this.ticker);
  @override
  // TODO: implement props
  List<Object?> get props => [ticker];
}
