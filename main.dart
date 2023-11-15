import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Godrej',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Godrej'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Promosi'),
            Tab(text: 'Terlaris'),
            Tab(text: 'Semua Produk'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          PromotionsPage(),
          BestSellersPage(),
          AllProductsPage(),
        ],
      ),
    );
  }
}

class AllProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Produk Terlaris
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Seluruh Produk',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GroceryItemCard(
                  itemName: 'WONDER FUEL Gas Portable 220g',
                  price: 'Rp 24.300',
                  imageUrl: 'assets/WONDER.jpg',
                ),
                GroceryItemCard(
                  itemName: 'Stella Car Perfume Pengharum Mobil Musk...',
                  price: 'Rp 41.500',
                  imageUrl: 'assets/STELLAMUSK.jpg',
                ),
                GroceryItemCard(
                  itemName: 'Stella Car Perfume Pengharum Mobil Energ...',
                  price: 'Rp 41.500',
                  imageUrl: 'assets/STELLAENRG.jpg',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PromotionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(
          'Promosi',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class BestSellersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Terlaris',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('1. WONDER FUEL Gas Portable 220g'),
          Text('2. Stella Car Perfume Pengharum Mobil Musk...'),
          Text('3. Stella Car Perfume Pengharum Mobil Energ...'),
        ],
      ),
    );
  }
}

class GroceryItemCard extends StatelessWidget {
  final String itemName;
  final String price;
  final String imageUrl;

  const GroceryItemCard({
    Key? key,
    required this.itemName,
    required this.price,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imageUrl,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemName,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  price,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {},
            child: Text('Tambah ke Keranjang'),
          ),
        ],
      ),
    );
  }
}
