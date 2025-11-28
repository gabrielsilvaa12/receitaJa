import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onDestinationSelected;

  const Navbar({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    // Usando o NavigationBar moderno do Material 3
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        // Cor do indicador (a "bolinha" ou "pílula" ao redor do ícone selecionado)
        indicatorColor: const Color(0xFFF26B1D).withOpacity(0.2),
        labelTextStyle: MaterialStateProperty.all(
          const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ),
      child: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        backgroundColor:
            Colors.white, // Fundo branco para contrastar com o header escuro
        elevation: 5, // Sombra leve para destacar do conteúdo
        destinations: const [
          // Aba 1: API (Receitas)
          NavigationDestination(
            icon: Icon(Icons.restaurant_menu_outlined),
            selectedIcon: Icon(Icons.restaurant_menu, color: Color(0xFFF26B1D)),
            label: 'Receitas',
          ),

          // Aba 2: Firebase (Favoritos)
          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            selectedIcon: Icon(Icons.favorite, color: Color(0xFFF26B1D)),
            label: 'Favoritos',
          ),

          // Aba 3: Nativo (Perfil)
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person, color: Color(0xFFF26B1D)),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
