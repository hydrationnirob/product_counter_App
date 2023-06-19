import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final List<int> counters;

  const CartPage({Key? key, required this.counters}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    int totalCount = widget.counters.reduce((a, b) => a + b);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Center(
        child: Text('Your Total is $totalCount', style: const TextStyle(fontSize: 30)),
      ),
    );
  }
}
