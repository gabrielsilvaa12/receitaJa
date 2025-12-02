import 'package:flutter/material.dart';
import 'package:logo/models/receita.dart';
import 'package:logo/pages/details_page.dart';
import 'package:logo/services/receita_service.dart';
import 'package:logo/services/favorites_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ReceitaService _service = ReceitaService();
  late Future<List<Receita>> _receitasFuture;

  @override
  void initState() {
    super.initState();
    _receitasFuture = _service.getReceitas();
    FavoritesService.instance.startListening();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Receita>>(
      future: _receitasFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: Color(0xFFF26B1D)),
          );
        }

        if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("Nenhuma receita encontrada."));
        }

        final receitas = snapshot.data!;

        return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: receitas.length,
          itemBuilder: (context, index) {
            final receita = receitas[index];
            return _buildReceitaCard(receita);
          },
        );
      },
    );
  }

  Widget _buildReceitaCard(Receita receita) {
    // Corrigido parênteses
    final favoritesService = FavoritesService();

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReceitaDetailsPage(receita: receita),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.network(
                  receita.thumbUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Container(color: Colors.grey[200]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      receita.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  ListenableBuilder(
                    listenable: favoritesService,
                    builder: (context, _) {
                      final isFav = favoritesService.isFavorite(
                        receita,
                      ); // Corrigido
                      return GestureDetector(
                        onTap: () => favoritesService.toggleFavorite(
                          receita,
                        ), // Corrigido
                        child: Icon(
                          isFav ? Icons.favorite : Icons.favorite_border,
                          size: 20,
                          color: isFav ? const Color(0xFFF26B1D) : Colors.grey,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
