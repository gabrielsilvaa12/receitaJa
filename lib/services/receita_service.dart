import 'package:dio/dio.dart';
import 'package:receitaja/models/receita.dart';

class ReceitaService {
  final Dio _dio = Dio();

  // Busca receitas de comida variadas
  Future<List<Receita>> getReceitas() async {
    try {
      // Endpoint de busca (se deixar vazio '?s=', ele traz várias aleatórias/populares)
      final response = await _dio.get(
        'https://www.themealdb.com/api/json/v1/1/search.php?s=',
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['meals'];

        // Transforma a lista de JSON em lista de objetos Receita
        return data.map((json) => Receita.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      print("Erro ao buscar receitas: $e");
      return []; // Em caso de erro, retorna lista vazia para não quebrar o app
    }
  }
}
