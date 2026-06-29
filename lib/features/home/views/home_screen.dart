import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tv/core/models/row_data.dart';
import 'package:game_tv/core/providers/navigation/navigation_notifier.dart';
import 'package:game_tv/core/widgets/async_ui_builder.dart';
import 'package:game_tv/core/widgets/game_content_screen.dart';
import 'package:game_tv/core/widgets/loading_expressive.dart';
import 'package:game_tv/features/home/models/unified_game.dart';
import 'package:game_tv/features/home/providers/home_aggregator_provider.dart';
import 'package:game_tv/features/home/views/widgets/hero_banner.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final aggregatorAsync = ref.watch(homeAggregatorProvider);

    return AsyncUIBuilder(
      asyncValue: aggregatorAsync,
      builder: (games) {
        if (games.isEmpty) const LoadingExpressive();

        return _HomeContent(games: games);
      },
    );
  }
}

class _HomeContent extends ConsumerWidget {
  final List<UnifiedGame> games;

  const _HomeContent({required this.games});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationState = ref.watch(navigationProvider);
    final upcomingGames = ref.watch(upcomingGamesProvider);

    final rowsConfig = _buildRowsConfig(games, upcomingGames);
    final heroGames = rowsConfig[0].items;
    final safeHeroIndex = _computeSafeHeroIndex(
      heroGames: heroGames,
      rawIndex: navigationState.heroSlideIndex,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _precacheHeroImages(context, heroGames);
    });

    return GameContentScreen(
      rowsConfig: rowsConfig,
      headerSliverRowIndex: 0,
      headerSliver: HeroBanner(
        currentIndex: safeHeroIndex,
        isFocused: navigationState.row == 0 && navigationState.col >= 0,
        heroSlides: heroGames,
      ),
    );
  }

  List<RowData> _buildRowsConfig(
    List<UnifiedGame> games,
    List<UnifiedGame> upcomingGames,
  ) => [
    RowData(title: 'HERO', items: games.take(5).toList()),
    RowData(title: 'PROXIMOS LANZAMIENTOS', items: upcomingGames),
    RowData(title: 'TODAS LAS TRANSMISIONES', items: games),
  ];

  int _computeSafeHeroIndex({
    required List<UnifiedGame> heroGames,
    required int rawIndex,
  }) {
    if (heroGames.isEmpty) return 0;
    return rawIndex.clamp(0, heroGames.length - 1);
  }

  void _precacheHeroImages(BuildContext context, List<UnifiedGame> heroGames) {
    for (final game in heroGames) {
      if (game.bannerUrl != null) {
        precacheImage(CachedNetworkImageProvider(game.bannerUrl!), context);
      }
    }
  }
}
