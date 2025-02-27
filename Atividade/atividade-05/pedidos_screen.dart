import 'package:flutter/material.dart';

class PedidosScreen extends StatelessWidget {
  final List<Map<String, dynamic>> pedidos = [
    {"cliente": "João Silva", "produto": "Smartphone Poco X5 Pro", "quantidade": 1},
    {"cliente": "Maria Oliveira", "produto": "Notebook Gamer", "quantidade": 1},
    {"cliente": "Carlos Souza", "produto": "Mouse Sem Fio", "quantidade": 2},
    {"cliente": "Ana Lima", "produto": "Teclado Mecânico", "quantidade": 1},
    {"cliente": "Pedro Santos", "produto": "Monitor 144Hz", "quantidade": 1},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pedidos')),
      body: ListView.builder(
        itemCount: pedidos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("${pedidos[index]["cliente"]} - ${pedidos[index]["produto"]}"),
            subtitle: Text("Quantidade: ${pedidos[index]["quantidade"]}"),
            leading: Icon(Icons.shopping_cart),
          );
        },
      ),
    );
  }
}
