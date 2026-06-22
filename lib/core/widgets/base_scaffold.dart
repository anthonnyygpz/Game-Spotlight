import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tv/core/constants/menu_items.dart';
import 'package:game_tv/core/providers/navigation/navigation_notifier.dart';
import 'package:game_tv/core/widgets/sidebar.dart';
import 'package:go_router/go_router.dart';

class BaseScaffold extends ConsumerStatefulWidget {
  final Widget child;
  final List<int> rowItemCounts;
  final void Function(int row, int col)? onContentSelect;

  const BaseScaffold({
    super.key,
    required this.child,
    required this.rowItemCounts,
    this.onContentSelect,
  });

  @override
  ConsumerState<BaseScaffold> createState() => _LayoutState();
}

class _LayoutState extends ConsumerState<BaseScaffold> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    // Aseguramos el foco un milisegundo después de renderizar la pantalla
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _focusNode.requestFocus();
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  KeyEventResult _handleKey(KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }

    final key = event.logicalKey;
    final state = ref.watch(navigationProvider);
    final controller = ref.read(navigationProvider.notifier);

    if (key == LogicalKeyboardKey.arrowDown) {
      controller.moveRow(1, widget.rowItemCounts);
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.arrowUp) {
      controller.moveRow(-1, widget.rowItemCounts);
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.arrowRight) {
      controller.moveCol(1, widget.rowItemCounts);
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.arrowLeft) {
      controller.moveCol(-1, widget.rowItemCounts);
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.select || key == LogicalKeyboardKey.enter) {
      if (state.col == -1) {
        controller.syncActiveRoute();
        Future.delayed(Duration.zero, () {
          if (context.mounted) {
            context.go(globalNavItems[state.navIndex].route);
          }
        });
      } else {
        if (widget.onContentSelect != null) {
          widget.onContentSelect!(state.row, state.col);
        }
      }
      return KeyEventResult.handled;
    }

    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    final navIndex = ref.watch(navigationProvider.select((s) => s.navIndex));
    final currentRoute = GoRouterState.of(context).uri.toString();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        ref.read(navigationProvider.notifier).syncWithRoute(currentRoute);
      }
    });

    return Scaffold(
      body: KeyboardListener(
        focusNode: _focusNode,
        autofocus: true,
        onKeyEvent: (event) => _handleKey(event),
        child: Row(
          children: [
            // Sidebar
            RepaintBoundary(child: Sidebar(selectedIndex: navIndex)),
            // Contenido
            Expanded(child: widget.child),
          ],
        ),
      ),
    );
  }
}
