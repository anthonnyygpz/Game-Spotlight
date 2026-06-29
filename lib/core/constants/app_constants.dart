/// Constantes globales de layout usadas en múltiples partes de la app.
///
/// Centralizar aquí evita inconsistencias entre valores hardcodeados dispersos.
/// Ejemplo anterior: NavigationNotifier usaba 222.0 pero ContentRow recibía 210.
class AppConstants {
  AppConstants._();

  // ── Tarjetas de contenido ──────────────────────────────────────────────────

  /// Ancho estándar de una GameCard en las filas de contenido.
  static const double cardWidth = 210.0;

  static const double cardHeight = 120.0;

  static const double cardScrollExtent = cardWidth + 12.0;
}
