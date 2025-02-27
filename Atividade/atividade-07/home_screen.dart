import 'package:flutter/material.dart';
import '../services/coin_gecko_api.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CoinGeckoAPI api = CoinGeckoAPI();
  List<Map<String, dynamic>> cryptos = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      List<Map<String, dynamic>> data = await api.fetchCryptos();
      setState(() {
        cryptos = data.take(3).toList();
      });
    } catch (e) {
      print("Erro: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Escolha uma Criptomoeda")),
      body: cryptos.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: cryptos.length,
              itemBuilder: (context, index) {
                final crypto = cryptos[index];
                return ListTile(
                  leading: Image.network(crypto["imagem"], width: 40, height: 40),
                  title: Text(crypto["nome"]),
                  subtitle: Text("Preço: \$${crypto["preco"]}"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(crypto: crypto),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
