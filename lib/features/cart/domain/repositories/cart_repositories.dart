import 'package:stateman_with_provider/features/cart/domain/entities/product.dart';

abstract class CartRepositories {
  List<Product> getCartItems();
  void addItem(Product product);
  void removeAllItems();
  bool isItemInCart(String productid);
}
