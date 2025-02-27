import 'dart:convert';
import 'package:http/http.dart' as http;

class CoinGeckoAPI {
  final String baseUrl = "https://api.coingecko.com/api/v3";

  Future<List<Map<String, dynamic>>> fetchCryptos() async {
    final response = await http.get(Uri.parse('$baseUrl/coins/markets?vs_currency=usd'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((coin) => {
        "id": coin["id"],
        "nome": coin["name"],
        "simbolo": coin["symbol"].toUpperCase(),
        "preco": coin["current_price"],
        "variacao_24h": coin["price_change_percentage_24h"],
        "imagem": coin["image"]
      }).toList();
    } else {
      throw Exception("Erro ao buscar criptomoedas");
    }
  }
}
