---
name: nueva_feature
description: >
  Úsala cuando el usuario pida crear una nueva feature desde cero.
  Triggers: "crea la feature X", "nueva feature Y", "agrega la pantalla Z".
  NO usar para agregar controllers o models a features ya existentes.
---

# Nueva Feature

## Cuándo usarla
- El usuario pide crear una feature que no existe aún en `lib/features/`
- NO usar para modificar features existentes ni crear controllers/models sueltos

## Pasos

1. **Verificar** que no exista una carpeta con ese nombre en `lib/features/`.
   - Si existe → detente y notifica. No continúes.
   - Si no existe → continúa.

2. Crea la carpeta principal: `lib/features/<nombre>/`

3. Dentro crea estas 3 subcarpetas:
   - `controllers/`
   - `models/`
   - `views/`

4. Ve a `lib/features/<nombre>/views/` y crea el archivo `<nombre>_view.dart`

5. El contenido del archivo debe ser:

```dart
    import 'package:flutter/material.dart';

    class <NombreEnPascalCase>Screen extends StatelessWidget {
      const <NombreEnPascalCase>Screen({super.key});

      @override
      Widget build(BuildContext context) {
        return const Scaffold();
      }
    }
```

   Donde `<NombreEnPascalCase>` es el nombre de la feature en PascalCase.
   Ejemplo: feature `user_profile` → clase `UserProfileView`
