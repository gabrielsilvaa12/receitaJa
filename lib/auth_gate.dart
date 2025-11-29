import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:receitaja/pages/login_page.dart';
import 'package:receitaja/pages/main_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Se estiver logado, entra no App
        if (snapshot.hasData) {
          return const MainPage();
        }

        // Se não, vai pro Login
        return const LoginPage();
      },
    );
  }
}
