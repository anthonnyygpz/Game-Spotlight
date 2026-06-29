import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tv/core/domain/games/entities/game_entity.dart';
import 'package:game_tv/core/domain/trailers/entities/trailer_entity.dart';
import 'package:game_tv/core/providers/games/games_provider.dart';
import 'package:game_tv/core/providers/trailers/trailers_provider.dart';
import 'package:game_tv/features/game_details/models/game_aggregator_data.dart';

final gameAggregatorProvider = FutureProvider.family<GameAggregatorData, String>(
  (ref, id) async {
    // Al leer el '.future', obtenemos el Future subyacente sin bloquear el hilo
    final gameFuture = ref.watch(gameDetailsProvider(id).future);
    final trailerFuture = ref.watch(trailerDetailsProvider(id).future);
    // Puede agregar peticiones infinitas aquí (logros, reviews, dlc...)

    // Future.wait ejecuta todo en paralelo y espera a que todos terminen
    final results = await Future.wait([gameFuture, trailerFuture]);

    return GameAggregatorData(
      game: results[0] as GameEntity,
      trailer: results[1] as TrailerEntity,
    );
  },
);
