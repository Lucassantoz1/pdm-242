import 'package:flutter/material.dart';
import 'screens/produtos_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gestão de Vendas',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ProdutosScreen(),
    );
  }
}
