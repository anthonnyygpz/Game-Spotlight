import 'package:game_tv/features/home/models/game_item.dart';

class HomeRowData {
  final String category;
  final List<GameItem> items;
  final String? targetRoute;

  HomeRowData({required this.category, required this.items, this.targetRoute});
}
