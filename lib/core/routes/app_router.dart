import 'package:flutter/material.dart';
import 'package:stateman_with_provider/main.dart';

class AppRouter {
  static const String catalogRoute = '/';
  static const String cartRoute = '/cart';
  static Map<String, WidgetBuilder> get routes => {
    catalogRoute: (context) => const MyCatalog(),
    cartRoute: (context) => const MyCart(),
  };
}