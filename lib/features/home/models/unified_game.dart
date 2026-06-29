import 'package:game_tv/core/domain/categories/entity/category_entity.dart';
import 'package:game_tv/core/domain/trailers/entities/trailer_entity.dart';

class UnifiedGame {
  final String id;
  final String title;
  final String slug;
  final String? sinopsis;
  final String? fechaLanzamiento;
  final String? desarrollador;
  final String? editor;
  final String? imagenPortada;
  final String? bannerUrl;
  final String? estado;
  final String? destacado;
  final String? createdAt;
  final String? updatedAt;
  final List<TrailerEntity> trailers;
  final CategoryEntity? category;

  UnifiedGame({
    required this.id,
    required this.title,
    required this.slug,
    required this.sinopsis,
    required this.fechaLanzamiento,
    required this.desarrollador,
    required this.editor,
    required this.imagenPortada,
    required this.bannerUrl,
    required this.estado,
    required this.destacado,
    required this.createdAt,
    required this.updatedAt,
    required this.trailers,
    required this.category,
  });
}
