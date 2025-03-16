import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Stock {
  final String name;
  final double price;

  Stock({required this.name, required this.price});
}
// Random price generator
final _random = Random();

// StreamProvider for stock price updates
final stockProvider = StreamProvider.autoDispose<Stock>((ref) {
  return Stream<Stock>.periodic(Duration(seconds: 1), (count) {
    return Stock(
      name: 'AAPL',
      price: 100 + _random.nextDouble() * 20,
    );
  });
});
