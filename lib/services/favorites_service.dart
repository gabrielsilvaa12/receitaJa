import 'package:flutter/material.dart';
import 'package:receitaja/models/receita.dart';

class FavoritesService extends ChangeNotifier {
  // Singleton (Garanta que só existe uma lista no app todo)
  static final FavoritesService instance = FavoritesService._internal();
  factory FavoritesService() => instance;
  FavoritesService._internal();

  final List<Receita> _favorites = [];

  List<Receita> get favorites => _favorites;

  // Adiciona ou Remove
  void toggleFavorite(Receita Receita) {
    if (isFavorite(Receita)) {
      _favorites.removeWhere((r) => r.id == Receita.id);
    } else {
      _favorites.add(Receita);
    }
    notifyListeners(); // Avisa o app que mudou
  }

  // Verifica se já é favorito
  bool isFavorite(Receita Receita) {
    return _favorites.any((r) => r.id == Receita.id);
  }
}
