import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Verifica se tem usuário logado em tempo real
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Pega o usuário atual (para saber o email na ProfilePage)
  User? get currentUser => _auth.currentUser;

  // Login
  Future<String?> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null; // Sucesso
    } on FirebaseAuthException catch (e) {
      return e.message; // Erro (ex: senha errada)
    } catch (e) {
      return "Erro desconhecido: $e";
    }
  }

  // Cadastro
  Future<String?> register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // Sucesso
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return "Erro desconhecido: $e";
    }
  }

  // Sair
  Future<void> logout() async {
    await _auth.signOut();
  }
}
