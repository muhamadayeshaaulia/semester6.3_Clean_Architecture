import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stateman_with_provider/features/cart/domain/entities/product.dart';
import 'package:stateman_with_provider/features/cart/presentation/providers/cart_provider.dart';

class AddButtonWidget extends StatelessWidget {
  final Product product;
  const AddButtonWidget({required this.product, super.key});
  @override
  Widget build(BuildContext context) {
    final isInCart = context.select<CartProvider, bool>(
      (provider) => provider.isInCart(product.id),
    );
    return TextButton(
      onPressed: isInCart
          ? null
          : () {
              context.read<CartProvider>().addItem(product);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${product.name} ditambahkan ke keranjang'),
                  action: SnackBarAction(
                    label: 'Lihat Keranjang', 
                    onPressed: () => Navigator.pushNamed(
                      context, '/cart')),
                ),
              );
            },
      child: isInCart
          ? const Icon(Icons.check, color: Colors.green)
          : const Text('TAMBAH'),
    );
  }
}
