import 'package:flutter/material.dart';
import 'package:logo/components/header.dart';
import 'package:logo/components/navbar.dart';
import 'package:logo/pages/favorites_page.dart';
import 'package:logo/pages/home_page.dart';
import 'package:logo/pages/profile_page.dart';

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
      appBar: Header(),

      body: _telas[_paginaSelecionada],

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
