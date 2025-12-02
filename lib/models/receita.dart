class Receita {
  final String id;
  final String name;
  final String thumbUrl;
  final String instructions; // <--- Novo campo

  Receita({
    required this.id,
    required this.name,
    required this.thumbUrl,
    required this.instructions,
  });

  factory Receita.fromJson(Map<String, dynamic> json) {
    return Receita(
      id: json['idMeal'],
      name: json['strMeal'],
      thumbUrl: json['strMealThumb'],
      instructions: json['strInstructions'] ?? '', // <--- Pega da API
    );
  }

  factory Receita.fromMap(Map<String, dynamic> map) {
    return Receita(
      id: map['id'],
      name: map['name'],
      thumbUrl: map['thumbUrl'],
      instructions: map['instructions'], // <--- Pega do banco de dados
    );
  }
}
