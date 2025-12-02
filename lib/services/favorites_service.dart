import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logo/models/receita.dart';
import 'package:logo/services/notifications_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FavoritesService extends ChangeNotifier {
  static final FavoritesService instance = FavoritesService._internal();
  factory FavoritesService() => instance;
  FavoritesService._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<Receita> _favorites = [];
  List<Receita> get favorites => _favorites;

  void startListening() {
    final user = _auth.currentUser;
    if (user != null) {
      _firestore
          .collection('users')
          .doc(user.uid)
          .collection('favorites')
          .snapshots()
          .listen((snapshot) {
            _favorites = snapshot.docs.map((doc) {
              return Receita.fromMap(
                doc.data(),
              ); // Certifique-se que Receita tem fromMap
            }).toList();
            notifyListeners();
          });
    }
  }

  Future<void> toggleFavorite(Receita receita) async {
    final user = _auth.currentUser;
    if (user == null) return;

    final docRef = _firestore
        .collection('users')
        .doc(user.uid)
        .collection('favorites')
        .doc(receita.id.toString());

    if (isFavorite(receita)) {
      // Remove do Firestore
      await docRef.delete();
    } else {
      await docRef.set({
        'id': receita.id,
        'name': receita.name,
        'instructions': receita.instructions,
        'thumbUrl': receita.thumbUrl,
      });

      // Dispara a notificação local que você criou
      NotificationService().showLocalNotification(
        "Oba! Receita Salva 😋",
        "Você salvou '${receita.name}' no Favoritos!",
      );
    }
    // Não precisa de notifyListeners() aqui pois o listener do snapshot já fará isso
  }

  bool isFavorite(Receita receita) {
    return _favorites.any((r) => r.id == receita.id);
  }
}
