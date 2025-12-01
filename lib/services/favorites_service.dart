import 'package:flutter/material.dart';
import 'package:logo/models/receita.dart';
import 'package:logo/services/notifications_service.dart';

class FavoritesService extends ChangeNotifier {
  static final FavoritesService instance = FavoritesService._internal();
  factory FavoritesService() => instance;
  FavoritesService._internal();

  final List<Receita> _favorites = [];

  List<Receita> get favorites => _favorites;

  void toggleFavorite(Receita receita) {
    if (isFavorite(receita)) {
      _favorites.removeWhere((r) => r.id == receita.id);
    } else {
      _favorites.add(receita);

      // Chama nosso serviço novo
      NotificationService().showLocalNotification(
        "Oba! Receita Salva 😋",
        "Você adicionou '${receita.name}' aos seus favoritos.",
      );
    }
    notifyListeners();
  }

  bool isFavorite(Receita receita) {
    return _favorites.any((r) => r.id == receita.id);
  }
}
