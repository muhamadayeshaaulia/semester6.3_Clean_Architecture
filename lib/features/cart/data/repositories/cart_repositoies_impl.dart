import 'package:stateman_with_provider/features/cart/domain/repositories/cart_repositories.dart';
import 'package:stateman_with_provider/features/cart/domain/entities/product.dart';

class CartRepositoriesImpl implements CartRepositories {
  final List<Product> _items = [];
  @override
  List<Product> getCartItems() => List.unmodifiable(_items);
  @override
  void addItem(Product product) => _items.add(product);
  @override
  void removeAllItems() => _items.clear();
  @override 
  bool isItemInCart(String productid) =>
   _items.any((p) => p.id == productid);
}