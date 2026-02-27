import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());

  ChangeNotifierProvider(create: (context) => CartModel(), child: MyApp());
}

class CartModel extends ChangeNotifier {
  final List<String> _items = [];

  void add(String item) {
    _items.add(item);
    notifyListeners();
  }
  void remove(String item) {
    _items.remove(item);
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Architecture',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyCatalog(),
        '/cart': (context) => const MyCart(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
// membuat class catalog
class MyCatalog extends StatelessWidget {
  const MyCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    final products = ['Nasi Goreng','Sate Ayam','Es Teh','Ayam Bakar','Kopi'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index]),
            trailing: AddButton(item: products[index]),
          );
        },
      ),
    );
    
  }
}

// membuat class cart
class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
   // context.watch itu untuk mendengarkan perubahan pada model
   //setiap kali ada perubahan pada model, widget ini akan di rebuild
    var cart = context.watch<CartModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang Belanja'),
      ),
      
    );
  }
}

// membuat class AddButton
class AddButton extends StatelessWidget {
  final String item;
  const AddButton({required this.item, super.key});


  @override
  Widget build(BuildContext context) {
    final isInCart = context.select<CartModel, bool>((cart) => cart._items.contains(item));
    return TextButton(
      onPressed: isInCart
          ? null
          : () {
              // context.red itu untuk memanggil fungsi taanpa mendengarkan perubahan
              context.read<CartModel>().add(item);
            },
    child: isInCart ? const Icon(Icons.check, color: Colors.green,) : const Text('TAMBAH'),
    );
  }
}