import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Core do Firebase
import 'package:google_fonts/google_fonts.dart'; // Fontes
import 'package:receitaja/auth_gate.dart'; // O "Porteiro"

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // INICIALIZAÇÃO MANUAL:
  // Ele vai procurar os arquivos de configuração nativos automaticamente.
  await Firebase.initializeApp();

  runApp(const ReceitaJaApp());
}

class ReceitaJaApp extends StatelessWidget {
  const ReceitaJaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ReceitaJá',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFF26B1D),
          primary: const Color(0xFFF26B1D),
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF2C2C2C),
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: const Color(0xFFFAFAFA),
      ),

      home: const AuthGate(),
    );
  }
}
