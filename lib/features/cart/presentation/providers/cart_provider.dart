import 'package:flutter/foundation.dart';
import 'package:stateman_with_provider/features/cart/domain/entities/product.dart';
import 'package:stateman_with_provider/features/cart/domain/repositories/cart_repositories.dart';

class CartProvider extends ChangeNotifier {
  final CartRepositories _repository;
  CartProvider({required CartRepositories repository}) : _repository = repository;
  List<Product> get items => _repository.getCartItems();
  void addItem(Product product) {
    _repository.addItem(product);
    notifyListeners();
  }

  void removeAll() {
    _repository.removeAllItems();
    notifyListeners();
  }

  bool isInCart(String productId) => _repository.isItemInCart(productId);
}
