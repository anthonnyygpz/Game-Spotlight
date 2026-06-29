import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tv/core/widgets/async_ui_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

// Asumiendo que tiene un provider que retorna List<GenreModel>

class GenresScreen extends ConsumerWidget {
  const GenresScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genresAsync = ref.watch(genresListProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.black, // O su fondo base del theme
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Encabezado consistente con GameDetailsScreen
          Padding(
            padding: const EdgeInsets.fromLTRB(35, 35, 35, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    Text(
                      'Explorar por',
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        color: colorScheme.onSecondary,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: colorScheme.primary.withValues(alpha: 0.3),
                        thickness: 0.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'GÉNEROS',
                  style: TextStyle(
                    fontFamily: 'Azonix',
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          // Cuerpo principal con manejo de asincronía
          Expanded(
            child: AsyncUIBuilder(
              asyncValue: genresAsync,
              builder: (genresList) {
                if (genresList.isEmpty) {
                  return Center(
                    child: Text(
                      'No hay géneros disponibles',
                      style: GoogleFonts.montserrat(color: Colors.white),
                    ),
                  );
                }

                return GridView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 35,
                    vertical: 10,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, // Ajustable según el tamaño de su TV
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 16 / 9,
                  ),
                  itemCount: genresList.length,
                  itemBuilder: (context, index) {
                    final genre = genresList[index];

                    return GenreTvCard(
                      genreName: genre.name,
                      imageUrl: genre.coverUrl ?? '', // URL de su backend
                      gameCount: genre.totalGames,
                      onTap: () {
                        // Navegación a la lista de juegos filtrada
                        context.push('/genre/${genre.id}');
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
