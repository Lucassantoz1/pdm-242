﻿# atividade-06

Alterar a mensagem do SnackBar quandoo botão BUY é pressionado.

Deve ser mostrado uma mensagem com os itens selecionados da seguinte forma:

Item 1 - $ 10 + Item 4 - $ 20 = Total $ 30

Evidenciar o código alterado no Github e o print da tela do Snackbar com o nome do aluno na aplicação.


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shopper/models/cart.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: Theme.of(context).textTheme.displayLarge),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.yellow,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: _CartList(),
              ),
            ),
            const Divider(height: 4, color: Colors.black),
            _CartTotal()
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.titleLarge;
    // This gets the current state of CartModel and also tells Flutter
    // to rebuild this widget when CartModel notifies listeners (in other words,
    // when it changes).
    var cart = context.watch<CartModel>();

    return ListView.builder(
      itemCount: cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.done),
        trailing: IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: () {
            cart.remove(cart.items[index]);
          },
        ),
        title: Text(
          cart.items[index].name,
          style: itemNameStyle,
        ),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hugeStyle =
        Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 48);

    return SizedBox(
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Another way to listen to a model's change is to include
            // the Consumer widget. This widget will automatically listen
            // to CartModel and rerun its builder on every change.
            //
            // The important thing is that it will not rebuild
            // the rest of the widgets in this build method.
            Consumer<CartModel>(
                builder: (context, cart, child) =>
                    Text('\$${cart.totalPrice}', style: hugeStyle)),
            const SizedBox(width: 24),
            FilledButton(
              onPressed: () {
    var cart = context.read<CartModel>();  // Usando 'read' corretamente para evitar rebuilds desnecessários.

    if (cart.items.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Seu carrinho está vazio!')),
      );
      return;
    }

    // Criar a lista de itens formatada
    String resumoCompra = cart.items
        .map((item) => '${item.name} - \$${item.price.toStringAsFixed(2)}')
        .join(' + ');

    // Calcular o total
    double total = cart.items.fold(0, (sum, item) => sum + item.price);

    // Criar a mensagem final
    String mensagem = '$resumoCompra = Total \$${total.toStringAsFixed(2)}';

    // Exibir no SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
        duration: Duration(seconds: 3),
      ),
    );
  },
  style: TextButton.styleFrom(
    foregroundColor: Theme.of(context).primaryColor,
  ),
  child: const Text('BUY'),
),
          ],
        ),
      ),
    );
  }
}
