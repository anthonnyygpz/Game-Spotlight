# Game-Spotlight

¡Bienvenido a **Game-Spotlight**! Este es un proyecto de Flutter diseñado con las mejores prácticas arquitectónicas para garantizar escalabilidad, mantenibilidad y un código limpio.

## 🏗️ Arquitectura del Proyecto

El proyecto sigue una arquitectura **Feature-First** (orientada a funcionalidades), lo que significa que el código se organiza alrededor de las características de la aplicación en lugar de por tipos de archivos técnicos. Esto facilita la colaboración y el escalado a medida que el proyecto crece.

Herramientas y librerías principales:
- **Gestión de Estado (State Management):** `flutter_riverpod`
- **Enrutamiento (Routing):** `go_router`
- **UI & Tipografía:** `google_fonts`, `dpad` (para navegación direccional, muy útil en interfaces de TV) y `pretty_qr_code`.

### Estructura de Directorios

La estructura principal del código se encuentra en el directorio `/lib`:

```text
lib/
 ├── core/              # Código transversal y compartido por toda la app
 │   ├── constants/     # Constantes globales (colores, temas, strings, assets)
 │   ├── routes/        # Configuración de enrutamiento con go_router
 │   └── widgets/       # Componentes visuales reutilizables (botones genéricos, loaders, etc.)
 │
 ├── features/          # Funcionalidades específicas y aisladas de la app
 │   ├── auth/          # Lógica, estado y pantallas de autenticación
 │   └── home/          # Lógica, estado y pantallas principales (Dashboard/Home)
 │
 ├── app.dart           # Configuración base del framework (MaterialApp/CupertinoApp, Themes)
 └── main.dart          # Punto de entrada de la aplicación (runApp y ProviderScope)
```

#### ¿Cómo localizar y modificar el código?
Si necesitas realizar un cambio o resolver un bug, hazte la siguiente pregunta: **¿Esto pertenece a una funcionalidad específica o es algo global?**
1. **Componentes Globales:** Si quieres modificar un botón que se usa en toda la app o agregar un nuevo color a la paleta, debes ir a `lib/core/`.
2. **Modificaciones Específicas:** Si hay un error en el inicio de sesión, debes buscar exclusivamente dentro de `lib/features/auth/`.
3. **Nuevas Pantallas:** Si creas una pantalla nueva, debes registrar su ruta en `lib/core/routes/`.

---

## 🚀 Guía de Instalación y Ejecución

Para configurar y levantar este proyecto en tu entorno local, sigue estos pasos:

### 1. Pre-requisitos
Asegúrate de cumplir con los siguientes requisitos en tu máquina:
- [Flutter SDK](https://docs.flutter.dev/get-started/install) configurado (requiere versión Dart SDK `^3.12.1`).
- IDE recomendado: **VS Code** o **Android Studio** con las extensiones de Flutter y Dart.
- Un dispositivo físico conectado (recomendado TV o dispositivo con pad direccional) o un emulador de Android/iOS en ejecución.

### 2. Preparar el entorno
Si acabas de clonar el repositorio, navega a la raíz del proyecto y descarga todas las dependencias definidas en el archivo `pubspec.yaml`:
```bash
# Navegar al proyecto
cd Game-Spotlight 

# Obtener dependencias de pub.dev
flutter pub get
```

### 3. Ejecutar la aplicación
Compila y despliega la aplicación en el dispositivo activo:
```bash
flutter run
```

---

## 🛠️ ¿Cómo añadir una nueva Funcionalidad (Feature)?

Para mantener la salud de la arquitectura, cuando necesites agregar una nueva área a la aplicación (por ejemplo, una pantalla de `settings` o `profile`):

1. **Crear el módulo:** Crea una nueva subcarpeta dentro de `lib/features/` llamada `settings`.
2. **Separación de responsabilidades:** Dentro de tu nueva feature, te recomendamos dividir el código internamente (Ej. Arquitectura limpia o por capas simples):
   - `presentation/`: Archivos de interfaz gráfica (`screens`, `widgets` exclusivos de esta feature).
   - `providers/` o `controllers/`: Lógica de estado usando Riverpod.
   - `models/`: Clases de datos.
3. **Enrutamiento:** Una vez terminada la vista principal de la feature, regístrala en el manejador de rutas en `lib/core/routes/`.
4. **Estado:** Utiliza `ConsumerWidget` o `ConsumerState` provistos por Riverpod para escuchar o modificar el estado de manera reactiva.

> 💡 *Tip de Arquitecto: Mantén las dependencias entre features al mínimo. Un módulo en `features/home` no debería depender directamente de implementaciones internas de `features/auth`. Comunícalos a través del estado global o el enrutamiento.*

---

## 🤝 ¿Cómo colaborar en este proyecto?

Para asegurar un desarrollo limpio y sin conflictos, sigue estas pautas al contribuir:

### 1. Estrategia de Ramas (Git Branching)
Nunca trabajes directamente en la rama `main` o principal. Utiliza ramas separadas con los siguientes prefijos:
- `feature/` : Para añadir nuevas funcionalidades (Ej: `feature/pantalla-ajustes`)
- `fix/` : Para resolver errores y bugs (Ej: `fix/crash-al-inicio`)
- `refactor/` : Para mejorar el código sin cambiar su comportamiento.
- `docs/` : Para tareas de documentación.

```bash
git checkout -b feature/nombre-de-tu-funcionalidad
```

### 2. Convenciones de Commits (Conventional Commits)
Mantén un historial de git limpio y legible utilizando el estándar **Conventional Commits**:
- `feat:` Nueva característica.
- `fix:` Corrección de bug.
- `docs:` Cambios solo en la documentación.
- `style:` Cambios que no afectan el significado del código (espacios, formateo, etc.).
- `refactor:` Un cambio en el código que ni corrige un bug ni añade una característica.
- `chore:` Tareas de mantenimiento o actualización de dependencias.

**Ejemplo:**
```bash
git commit -m "feat: agregar nuevo botón de cerrar sesión"
```

### 3. Flujo de Pull Requests (PR)
- Una vez finalizada tu tarea, haz push de tu rama al repositorio remoto.
- Abre un **Pull Request (PR)** hacia la rama principal.
- Proporciona una descripción clara en el PR indicando qué problema resuelves o qué característica añades.
- Solicita revisión (Code Review) de otro integrante del equipo. No hagas *merge* directo de tus propios cambios.

### 4. Estilo de Código y Análisis
Antes de enviar tu código para revisión, es importante que pase las reglas de linting recomendadas por Flutter. Ejecuta estos comandos localmente:

```bash
# Dar formato al código fuente
dart format .

# Comprobar que no hay errores ni advertencias de sintaxis/estilo
flutter analyze
```
