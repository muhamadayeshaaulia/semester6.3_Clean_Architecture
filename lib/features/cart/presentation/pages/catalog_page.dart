import 'package:flutter/material.dart';
import 'package:stateman_with_provider/core/routes/app_router.dart';
import 'package:stateman_with_provider/features/cart/domain/entities/product.dart';
import 'package:stateman_with_provider/features/cart/presentation/widgets/add_button_widget.dart';
class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  static final List<Product> _products = [
    Product(id: '1', name: 'Nasi Goreng', price: 15000),
    Product(id: '2', name: 'Sate Ayam', price: 20000),
    Product(id: '3', name: 'Es Teh', price: 5000),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Makanan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, AppRouter.cartRoute),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(_products[index].name),
          subtitle: Text('Rp ${_products[index].price}'),
          trailing: AddButtonWidget(product: _products[index]),
        ),
      ),
    );
  }
}
