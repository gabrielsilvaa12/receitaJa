import 'package:flutter/material.dart';
import 'package:receitaja/components/header.dart';
import 'package:receitaja/components/navbar.dart';
import 'package:receitaja/pages/favorites_page.dart';
import 'package:receitaja/pages/home_page.dart';
import 'package:receitaja/pages/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _paginaSelecionada = 0;

  // Aqui "carregamos" as 3 páginas que criamos acima
  final List<Widget> _telas = [
    const HomePage(), // Índice 0
    const FavoritesPage(), // Índice 1
    const ProfilePage(), // Índice 2
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Nosso Header Personalizado (Fixo no topo)
      appBar: Header(),

      // O corpo muda dinamicamente conforme a seleção
      body: _telas[_paginaSelecionada],

      // Nosso NavBar Personalizado (Fixo embaixo)
      bottomNavigationBar: Navbar(
        selectedIndex: _paginaSelecionada,
        onDestinationSelected: (index) {
          setState(() {
            _paginaSelecionada = index;
          });
        },
      ),
    );
  }
}
