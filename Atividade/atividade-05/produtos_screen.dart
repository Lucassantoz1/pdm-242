import 'package:flutter/material.dart';
import 'clientes_screen.dart';

class ProdutosScreen extends StatelessWidget {
  final List<Map<String, dynamic>> produtos = [
    {"nome": "Smartphone Poco X5 Pro", "preco": 1899.99},
    {"nome": "Notebook Gamer", "preco": 5999.99},
    {"nome": "Mouse Sem Fio", "preco": 199.99},
    {"nome": "Teclado Mecânico", "preco": 349.99},
    {"nome": "Monitor 144Hz", "preco": 1299.99},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Produtos')),
      body: ListView.builder(
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title:
                Text(produtos[index]["nome"], style: TextStyle(fontSize: 18)),
            subtitle:
                Text("R\$ ${produtos[index]["preco"].toStringAsFixed(2)}"),
            leading: Icon(Icons.shopping_bag),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ClientesScreen()),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
