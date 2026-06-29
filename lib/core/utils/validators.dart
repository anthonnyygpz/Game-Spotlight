// lib/utils/validators.dart

/// Colección de validadores para [TextFormField].
///
/// Cada método retorna un [FormFieldValidator<String>] — es decir,
/// una función `String? Function(String?)` — listo para pasarse
/// directamente al parámetro `validator` de un [TextFormField].
///
/// Uso básico:
/// ```dart
/// TextFormField(
///   validator: Validators.required(label: 'Nombre'),
/// )
/// ```
///
/// Composición con [Validators.compose]:
/// ```dart
/// TextFormField(
///   validator: Validators.compose([
///     Validators.required(label: 'Correo'),
///     Validators.email(),
///   ]),
/// )
/// ```

import 'package:flutter/foundation.dart';

typedef FormFieldValidator = String? Function(String? value);

abstract final class Validators {
  Validators._();

  // ---------------------------------------------------------------------------
  // Básicos
  // ---------------------------------------------------------------------------

  /// El campo no puede estar vacío.
  static FormFieldValidator required({String label = 'Este campo'}) {
    return (String? value) {
      if (value == null || value.trim().isEmpty) {
        return '$label es obligatorio.';
      }
      return null;
    };
  }

  // ---------------------------------------------------------------------------
  // Longitud
  // ---------------------------------------------------------------------------

  /// Longitud mínima de caracteres.
  static FormFieldValidator minLength(int min, {String? message}) {
    return (String? value) {
      if (value == null || value.trim().length < min) {
        return message ?? 'Debe tener al menos $min caracteres.';
      }
      return null;
    };
  }

  /// Longitud máxima de caracteres.
  static FormFieldValidator maxLength(int max, {String? message}) {
    return (String? value) {
      if (value != null && value.trim().length > max) {
        return message ?? 'No puede exceder $max caracteres.';
      }
      return null;
    };
  }

  /// Rango de longitud.
  static FormFieldValidator lengthBetween(int min, int max, {String? message}) {
    return (String? value) {
      final length = value?.trim().length ?? 0;
      if (length < min || length > max) {
        return message ?? 'Debe tener entre $min y $max caracteres.';
      }
      return null;
    };
  }

  // ---------------------------------------------------------------------------
  // Formatos comunes
  // ---------------------------------------------------------------------------

  /// Correo electrónico válido.
  static FormFieldValidator email({String? message}) {
    return (String? value) {
      if (value == null || value.trim().isEmpty) return null;
      final regex = RegExp(
        r'^[a-zA-Z0-9._%+\-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}$',
      );
      if (!regex.hasMatch(value.trim())) {
        return message ?? 'Ingresa un correo electrónico válido.';
      }
      return null;
    };
  }

  /// Número de teléfono (7–15 dígitos, admite +, espacios y guiones).
  static FormFieldValidator phone({String? message}) {
    return (String? value) {
      if (value == null || value.trim().isEmpty) return null;
      final regex = RegExp(r'^\+?[\d\s\-]{7,15}$');
      if (!regex.hasMatch(value.trim())) {
        return message ?? 'Ingresa un número de teléfono válido.';
      }
      return null;
    };
  }

  /// URL válida (http o https).
  static FormFieldValidator url({String? message}) {
    return (String? value) {
      if (value == null || value.trim().isEmpty) return null;
      final uri = Uri.tryParse(value.trim());
      final isValid =
          uri != null && (uri.scheme == 'http' || uri.scheme == 'https');
      if (!isValid) {
        return message ?? 'Ingresa una URL válida (http:// o https://).';
      }
      return null;
    };
  }

  // ---------------------------------------------------------------------------
  // Numéricos
  // ---------------------------------------------------------------------------

  /// Solo dígitos.
  static FormFieldValidator numeric({String? message}) {
    return (String? value) {
      if (value == null || value.trim().isEmpty) return null;
      if (double.tryParse(value.trim()) == null) {
        return message ?? 'Ingresa solo valores numéricos.';
      }
      return null;
    };
  }

  /// Valor mínimo numérico.
  static FormFieldValidator min(num minValue, {String? message}) {
    return (String? value) {
      if (value == null || value.trim().isEmpty) return null;
      final parsed = num.tryParse(value.trim());
      if (parsed == null || parsed < minValue) {
        return message ?? 'El valor mínimo es $minValue.';
      }
      return null;
    };
  }

  /// Valor máximo numérico.
  static FormFieldValidator max(num maxValue, {String? message}) {
    return (String? value) {
      if (value == null || value.trim().isEmpty) return null;
      final parsed = num.tryParse(value.trim());
      if (parsed == null || parsed > maxValue) {
        return message ?? 'El valor máximo es $maxValue.';
      }
      return null;
    };
  }

  // ---------------------------------------------------------------------------
  // Contraseña
  // ---------------------------------------------------------------------------

  /// Contraseña segura:
  /// - Mínimo 8 caracteres.
  /// - Al menos una mayúscula, una minúscula, un dígito y un carácter especial.
  static FormFieldValidator strongPassword({String? message}) {
    return (String? value) {
      if (value == null || value.isEmpty) return null;
      final hasUpper = RegExp(r'[A-Z]').hasMatch(value);
      final hasLower = RegExp(r'[a-z]').hasMatch(value);
      final hasDigit = RegExp(r'\d').hasMatch(value);
      final hasSpecial = RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value);
      final isLongEnough = value.length >= 8;

      if (!isLongEnough || !hasUpper || !hasLower || !hasDigit || !hasSpecial) {
        return message ??
            'La contraseña debe tener mín. 8 caracteres, '
                'mayúscula, minúscula, número y carácter especial.';
      }
      return null;
    };
  }

  /// Confirma que el valor coincide con otro campo (ej. repetir contraseña).
  ///
  /// ```dart
  /// final _passwordController = TextEditingController();
  ///
  /// TextFormField(
  ///   validator: Validators.matchField(
  ///     getValue: () => _passwordController.text,
  ///     message: 'Las contraseñas no coinciden.',
  ///   ),
  /// )
  /// ```
  static FormFieldValidator matchField({
    required String Function() getValue,
    String? message,
  }) {
    return (String? value) {
      if (value != getValue()) {
        return message ?? 'Los valores no coinciden.';
      }
      return null;
    };
  }

  // ---------------------------------------------------------------------------
  // Expresión regular personalizada
  // ---------------------------------------------------------------------------

  /// Valida contra una expresión regular arbitraria.
  ///
  /// ```dart
  /// // Solo letras (sin espacios ni números)
  /// TextFormField(
  ///   validator: Validators.pattern(
  ///     RegExp(r'^[a-zA-ZáéíóúÁÉÍÓÚñÑ]+$'),
  ///     message: 'Solo se permiten letras.',
  ///   ),
  /// )
  /// ```
  static FormFieldValidator pattern(RegExp regex, {String? message}) {
    return (String? value) {
      if (value == null || value.trim().isEmpty) return null;
      if (!regex.hasMatch(value.trim())) {
        return message ?? 'El formato no es válido.';
      }
      return null;
    };
  }

  // ---------------------------------------------------------------------------
  // Composición
  // ---------------------------------------------------------------------------

  /// Encadena varios validadores: el primero que falle retorna su mensaje.
  ///
  /// ```dart
  /// TextFormField(
  ///   validator: Validators.compose([
  ///     Validators.required(label: 'Correo'),
  ///     Validators.email(),
  ///   ]),
  /// )
  /// ```
  static FormFieldValidator compose(List<FormFieldValidator> validators) {
    return (String? value) {
      for (final validator in validators) {
        final error = validator(value);
        if (error != null) return error;
      }
      return null;
    };
  }

  /// Igual que [compose] pero ejecuta **todos** los validadores y retorna
  /// todos los mensajes de error concatenados.
  ///
  /// Útil cuando quieres mostrar múltiples errores a la vez.
  @visibleForTesting
  static FormFieldValidator composeAll(
    List<FormFieldValidator> validators, {
    String separator = '\n',
  }) {
    return (String? value) {
      final errors = validators
          .map((v) => v(value))
          .whereType<String>()
          .toList(growable: false);
      return errors.isEmpty ? null : errors.join(separator);
    };
  }
}
