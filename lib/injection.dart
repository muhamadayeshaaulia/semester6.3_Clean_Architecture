import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:stateman_with_provider/features/cart/data/repositories/cart_repositoies_impl.dart';
import 'package:stateman_with_provider/features/cart/presentation/providers/cart_provider.dart';
import 'package:stateman_with_provider/main.dart';

Widget buildApp() {
  final cartRepository = CartRepositoriesImpl();

  return ChangeNotifierProvider(
    create: (_) => CartProvider(repository: cartRepository),
    child: const MyApp(),
  );
}

void main() => runApp(buildApp());
