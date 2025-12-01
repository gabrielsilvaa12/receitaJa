import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
  Future<String?> register(String email, String password, String name) async {
    try {
      // 1. Cria a conta no Auth (Login/Senha)
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // 2. Pega o ID único que o Firebase gerou (UID)
      String uid = userCredential.user!.uid;

      // 3. AGORA SIM: Salva os dados no Banco de Dados (Firestore)
      await _firestore.collection('users').doc(uid).set({
        'email': email,
        'name': name,
        'createdAt': FieldValue.serverTimestamp(), // Data de criação
      });

      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return "Erro ao salvar no banco: $e";
    }
  }

  // Sair
  Future<void> logout() async {
    await _auth.signOut();
  }
}
