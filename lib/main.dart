import 'package:flutter/material.dart';

import 'CartPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List App',

      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const ProductList(title: 'Product List App'),
    );
  }
}

class ProductList extends StatefulWidget {
  const ProductList({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<int> counters = [0, 0, 0, 0, 0, 0, 0, 0];
  String product1 = "IPhone 14 pro";
  String product2 = "Iphone 13 pro";
  String product3 = "Samsung Galaxy";
  String product4 = "Redmi note 11";
  String product5 = "Iphone 12 pro";
  String product6 = "Nokia 12";
  String product7 = "Iphone 11";
  String product8 = "Walton g410";

  void incrementCounter(int index) {
    setState(() {
      counters[index]++;
      if (counters[index] == 5) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Alert'),
              content: Text('Congratulations! You bought 5 ${getProductTitle(index)}!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    });
  }

  String getProductTitle(int index) {
    switch (index) {
      case 0:
        return product1;
      case 1:
        return product2;
      case 2:
        return product3;
      case 3:
        return product4;
      case 4:
        return product5;
      case 5:
        return product6;
      case 6:
        return product7;
      case 7:
        return product8;
      default:
        return '';
    }
  }

  void navigateToCartPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartPage(counters: counters),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text('Product List'),
        centerTitle: true,

      ),
      body: ListView.builder(
        itemCount: counters.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(
              counters[index].toString(),
              style: const TextStyle(fontSize: 30),
            ),
            trailing: ElevatedButton(
              onPressed: () {
                incrementCounter(index);
              },
              child: const Text('Add'),
            ),
            title: Text(getProductTitle(index)),
            subtitle: const Text('45.00Tk'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToCartPage,
        child: const Icon(Icons.shopping_cart),

      )
    );
  }
}

