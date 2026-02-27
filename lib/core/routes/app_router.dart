import 'package:flutter/material.dart';
import 'package:stateman_with_provider/features/cart/presentation/pages/catalog_page.dart';


class AppRouter {
  static const String catalogRoute = '/';
  static const String cartRoute = '/cart';
  static Map<String, WidgetBuilder> get routes => {
    catalogRoute: (context) => const CatalogPage(),
    cartRoute: (context) => const MyCart(),
  };
}