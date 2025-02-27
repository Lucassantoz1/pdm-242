import 'package:flutter/material.dart';
import 'pedidos_screen.dart';

class ClientesScreen extends StatelessWidget {
  final List<Map<String, String>> clientes = [
    {"nome": "João Silva", "email": "joao@email.com"},
    {"nome": "Maria Oliveira", "email": "maria@email.com"},
    {"nome": "Carlos Souza", "email": "carlos@email.com"},
    {"nome": "Ana Lima", "email": "ana@email.com"},
    {"nome": "Pedro Santos", "email": "pedro@email.com"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Clientes')),
      body: ListView.builder(
        itemCount: clientes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(clientes[index]["nome"]!, style: TextStyle(fontSize: 18)),
            subtitle: Text(clientes[index]["email"]!),
            leading: Icon(Icons.person),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PedidosScreen()),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
