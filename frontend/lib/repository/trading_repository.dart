import 'package:dio/dio.dart';
import 'package:frontend/urls.dart';

abstract class _TickerRepositoryInterface {
  Future<List<String>?> fetchTickers();
}



class TickerRepository implements _TickerRepositoryInterface {
  final Dio _dio = Dio(); // Initialize Dio with default settings

  @override
  Future<List<String>?> fetchTickers() async {
    try {
      final response = await _dio.get(
          urlBuilder(paths: ['tickers'])); // Replace with your actual API URL
      if (response.statusCode == 200) {
        final List<dynamic> tickerData = response.data;
        final List<String> tickers =
            tickerData.map((item) => item.toString()).toList();
        return tickers;
      } else {
        throw Exception('Failed to fetch tickers: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch tickers: $e');
    }
  }
}
