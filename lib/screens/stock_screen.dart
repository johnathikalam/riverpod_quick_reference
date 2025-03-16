import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/stock_provider.dart';

class StockScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stockData = ref.watch(stockProvider);

    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Stock Price Ticker'))),
      body: Center(
        child: stockData.when(
          data: (stock) => Text(
            '${stock.name}: \$${stock.price.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          loading: () => CircularProgressIndicator(),
          error: (err, _) => Text('Error: $err'),
        ),
      ),
    );
  }
}