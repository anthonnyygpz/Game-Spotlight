import 'package:game_tv/core/domain/games/entities/game_entity.dart';
import 'package:game_tv/core/domain/trailers/entities/trailer_entity.dart';

class GameAggregatorData {
  final GameEntity game;
  final TrailerEntity trailer;

  GameAggregatorData({required this.game, required this.trailer});
}
