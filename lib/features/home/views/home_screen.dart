import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tv/core/constants/app_routes.dart';
import 'package:game_tv/core/providers/navigation/navigation_notifier.dart';
import 'package:game_tv/core/widgets/base_scaffold.dart';
import 'package:game_tv/core/widgets/content_row.dart';
import 'package:game_tv/features/home/models/game_item.dart';
import 'package:game_tv/features/home/views/widgets/hero_banner.dart';
import 'package:go_router/go_router.dart';

const _heroSlides = [
  GameItem(
    id: 21,
    title: 'ECLIPSE\nREBIRTH',
    subtitle: 'UN MUNDO CAE. UN HÉROE SE LEVANTA.',
    gradientStart: Color(0xFF1A0A3A),
    gradientEnd: Color(0xFF0D1B4A),
    badge: 'NUEVO LANZAMIENTO',
    date: '24 MAY 2024',
  ),
  GameItem(
    id: 22,
    title: 'NOVA\nFRONTIER',
    subtitle: 'EXPLORA LOS LÍMITES DEL UNIVERSO.',
    gradientStart: Color(0xFF1A2A0A),
    gradientEnd: Color(0xFF0A1A2A),
    date: '07 JUN 2024',
  ),
  GameItem(
    id: 23,
    title: 'NEON\nDISTRICT',
    subtitle: 'LA CIUDAD NUNCA DUERME.',
    gradientStart: Color(0xFF0A1A3A),
    gradientEnd: Color(0xFF2A0A1A),
    date: '21 JUN 2024',
  ),
];

const _newReleases = [
  GameItem(
    id: 1,
    title: 'DUST\nSTORMS',
    subtitle: 'ACCIÓN',
    gradientStart: Color(0xFF3A2A0A),
    gradientEnd: Color(0xFF2A1A0A),
  ),
  GameItem(
    id: 2,
    title: 'DEEP\nSEA',
    subtitle: 'SURVIVAL',
    gradientStart: Color(0xFF0A1A3A),
    gradientEnd: Color(0xFF0A0A2A),
  ),
  GameItem(
    id: 3,
    title: 'GALACTIC\nRUN',
    subtitle: 'SCI-FI',
    gradientStart: Color(0xFF1A0A3A),
    gradientEnd: Color(0xFF0A0A2A),
  ),
  GameItem(
    id: 4,
    title: 'FOREST\nKEEPER',
    subtitle: 'PUZZLE',
    gradientStart: Color(0xFF0A3A0A),
    gradientEnd: Color(0xFF0A1A0A),
  ),
  GameItem(
    id: 5,
    title: 'BLOOD\nMOON',
    subtitle: 'HORROR',
    gradientStart: Color(0xFF3A0A0A),
    gradientEnd: Color(0xFF1A0A0A),
  ),
];

const _topRated = [
  GameItem(
    id: 6,
    title: 'ELDEN\nSHADOW',
    subtitle: 'RPG DE ACCIÓN',
    gradientStart: Color(0xFF2A2A0A),
    gradientEnd: Color(0xFF1A1A0A),
    badge: '★ 9.8',
  ),
  GameItem(
    id: 7,
    title: 'VOID\nWALKER',
    subtitle: 'SHOOTER TÁCTICO',
    gradientStart: Color(0xFF0A0A3A),
    gradientEnd: Color(0xFF1A0A2A),
    badge: '★ 9.5',
  ),
  GameItem(
    id: 8,
    title: 'CRYSTAL\nSAGA',
    subtitle: 'RPG CLÁSICO',
    gradientStart: Color(0xFF0A2A2A),
    gradientEnd: Color(0xFF0A1A1A),
    badge: '★ 9.3',
  ),
  GameItem(
    id: 9,
    title: 'IRON\nFORTRESS',
    subtitle: 'ESTRATEGIA',
    gradientStart: Color(0xFF2A1A0A),
    gradientEnd: Color(0xFF1A1A0A),
    badge: '★ 9.1',
  ),
  GameItem(
    id: 10,
    title: 'PHANTOM\nGATE',
    subtitle: 'AVENTURA',
    gradientStart: Color(0xFF1A0A3A),
    gradientEnd: Color(0xFF0A0A2A),
    badge: '★ 9.0',
  ),
];

const _trailers = [
  GameItem(
    id: 11,
    title: 'ECLIPSE\nREBIRTH',
    subtitle: 'TRÁILER DE LANZAMIENTO',
    gradientStart: Color(0xFF2A1A5A),
    gradientEnd: Color(0xFF0D1040),
    badge: 'NUEVO',
  ),
  GameItem(
    id: 12,
    title: 'NOVA\nFRONTIER',
    subtitle: 'GAMEPLAY OVERVIEW',
    gradientStart: Color(0xFF3A1A0A),
    gradientEnd: Color(0xFF1A0A20),
  ),
  GameItem(
    id: 13,
    title: 'NEON\nDISTRICT',
    subtitle: 'HISTORIA Y MUNDO',
    gradientStart: Color(0xFF0A2A3A),
    gradientEnd: Color(0xFF1A0A30),
  ),
  GameItem(
    id: 14,
    title: 'WHISPERS\nOF NATURE',
    subtitle: 'TRÁILER CINEMÁTICO',
    gradientStart: Color(0xFF0A3A1A),
    gradientEnd: Color(0xFF1A2A0A),
  ),
  GameItem(
    id: 15,
    title: 'ARENA\nKINGS',
    subtitle: 'TRÁILER OFICIAL',
    gradientStart: Color(0xFF3A2A0A),
    gradientEnd: Color(0xFF2A0A0A),
  ),
];

const _upcoming = [
  GameItem(
    id: 16,
    title: 'CYBERLINE\n2077',
    subtitle: '',
    gradientStart: Color(0xFF0A1A3A),
    gradientEnd: Color(0xFF1A0A4A),
    date: '07 JUN 2024',
  ),
  GameItem(
    id: 17,
    title: 'ARENA\nKINGS',
    subtitle: '',
    gradientStart: Color(0xFF3A1A0A),
    gradientEnd: Color(0xFF2A0A10),
    date: '21 JUN 2024',
  ),
  GameItem(
    id: 18,
    title: 'STARFALL\nLEGACY',
    subtitle: '',
    gradientStart: Color(0xFF0A2A3A),
    gradientEnd: Color(0xFF0A1A2A),
    date: '05 JUL 2024',
  ),
  GameItem(
    id: 19,
    title: 'MONSTER\nHUNTERS',
    subtitle: '',
    gradientStart: Color(0xFF2A0A3A),
    gradientEnd: Color(0xFF1A0A20),
    date: '19 JUL 2024',
  ),
  GameItem(
    id: 20,
    title: 'LAST OASIS\nONLINE',
    subtitle: '',
    gradientStart: Color(0xFF0A3A1A),
    gradientEnd: Color(0xFF1A2A0A),
    date: '02 AGO 2024',
  ),
];

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(navigationProvider);
    final controller = ref.read(navigationProvider.notifier);

    return BaseScaffold(
      rowItemCounts: [
        _heroSlides.length,
        _trailers.length,
        _upcoming.length,
        _topRated.length,
        _newReleases.length,
      ],
      onContentSelect: (row, col) {
        GameItem? selectedGame;

        switch (row) {
          case 0: // Hero Banner
            selectedGame = _heroSlides[col];
            break;
          case 1: // Trailers
            selectedGame = _trailers[col];
            break;
          case 2: // Upcoming
            selectedGame = _upcoming[col];
            break;
          case 3: // Top Rated
            selectedGame = _topRated[col];
            break;
          case 4: // New Releases
            selectedGame = _newReleases[col];
            break;
          // ... etc
        }

        if (selectedGame != null) {
          debugPrint('Juego seleccionado: ${selectedGame.title}');
          context.push('${AppRoutes.gameContent}/${selectedGame.id}');
        }
      },
      child: CustomScrollView(
        controller: controller.mainScroll,
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          // Fila 0: Hero
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: HeroBanner(
                currentIndex: state.heroSlideIndex,
                isFocused: state.row == 0 && state.col >= 0,
                heroSlides: _heroSlides,
              ),
            ),
          ),

          // Fila 1: Trailers
          SliverToBoxAdapter(
            child: ContentRow(
              title: 'TRAILERS ESPECIALES',
              items: _trailers,
              cardWidth: 220,
              cardHeight: 130,
              showPlayButton: true,
              focusedCol: state.row == 1 ? state.col : -1,
              scrollController: controller.rowScrolls[0],
            ),
          ),

          // Fila 2: Próximos lanzamientos
          SliverToBoxAdapter(
            child: ContentRow(
              title: 'PRÓXIMOS LANZAMIENTOS',
              items: _upcoming,
              cardWidth: 210,
              cardHeight: 120,
              showDate: true,
              trailingLabel: 'VER TODOS',
              focusedCol: state.row == 2 ? state.col : -1,
              scrollController: controller.rowScrolls[1],
            ),
          ),

          // Fila 3: Mejor valorados
          SliverToBoxAdapter(
            child: ContentRow(
              title: 'MEJOR VALORADOS',
              items: _topRated,
              cardWidth: 210,
              cardHeight: 120,
              showBadgeTop: true,
              focusedCol: state.row == 3 ? state.col : -1,
              scrollController: controller.rowScrolls[2],
            ),
          ),

          // Fila 4: Nuevos lanzamientos
          SliverToBoxAdapter(
            child: ContentRow(
              title: 'NUEVOS LANZAMIENTOS',
              items: _newReleases,
              cardWidth: 210,
              cardHeight: 120,
              focusedCol: state.row == 4 ? state.col : -1,
              scrollController: controller.rowScrolls[3],
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
    );
  }
}
