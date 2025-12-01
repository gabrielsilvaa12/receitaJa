import 'package:dio/dio.dart';
import 'package:logo/models/receita.dart';

class ReceitaService {
  final Dio _dio = Dio();

  Future<List<Receita>> getReceitas() async {
    try {
      final response = await _dio.get(
        'https://www.themealdb.com/api/json/v1/1/search.php?s=',
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['meals'];

        return data.map((json) => Receita.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      print("Erro ao buscar receitas: $e");
      return [];
    }
  }
}
