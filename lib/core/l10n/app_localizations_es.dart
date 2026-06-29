// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get errorConnection =>
      'No se pudo conectar al servidor. Comprueba tu internet.';

  @override
  String get errorInvalidLogin =>
      'El correo o la contraseña proporcionados son incorrectos.';
}
