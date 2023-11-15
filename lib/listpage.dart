import 'package:flutter/material.dart';
import 'package:login_dataproduk/main.dart';

class Product {
  final String name;
  final String price;

  Product({required this.name, required this.price});
}

class HalDua extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 135, 161, 244),
          shadowColor: Colors.grey,
          leading: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Halsatu()),
                );
              },
            ),
          ),
          title: Text(
            'Data Produk',
            style: TextStyle(fontFamily: 'Poppins'),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: IconButton(
                icon: Icon(Icons.refresh_rounded),
                onPressed: () {},
              ),
            ),
          ],
          elevation: 18,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Filter Produk',
                    style: TextStyle(fontSize: 15, fontFamily: 'Poppins'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: IconButton(
                    icon: Icon(Icons.close_rounded),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
        body: ProductListPage(),
      ),
    );
  }
}

class ProductListPage extends StatelessWidget {
  final List<Product> products = [
    Product(name: 'Guava Juice', price: '25.000'),
    Product(name: 'Apple Juice', price: '27.000'),
    Product(name: 'Milkshake Strawberry', price: '20.000'),
    Product(name: 'Milkshake Chocolate', price: '21.000'),
    Product(name: 'Milkshake Vanilla', price: '21.000'),
    Product(name: 'Americano', price: '30.000'),
    Product(name: 'Cappuccino', price: '18.000'),
    Product(name: 'Coffee Latte', price: '22.000'),
    Product(name: 'Frappuccino', price: '28.000'),
    Product(name: 'Tea', price: '15.000'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        final formattedPrice =
            'Rp. ' + product.price.replaceAll('.', '') + ',-';
        final productNumber = (index + 1).toString();

        return Card(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: ListTile(
            leading: Container(
              width: 30,
              height: double.infinity,
              alignment: Alignment.center,
              child: Text(
                productNumber,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
              ),
            ),
            title: Text(
              product.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              formattedPrice,
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            ),
          ),
        );
      },
    );
  }
}

void main() {
  runApp(HalDua());
}
