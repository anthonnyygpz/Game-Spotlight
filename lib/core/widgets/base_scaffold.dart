import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tv/core/constants/menu_items.dart';
import 'package:game_tv/core/providers/navigation/navigation_notifier.dart';
import 'package:game_tv/core/widgets/sidebar.dart';
import 'package:go_router/go_router.dart';

class BaseScaffold extends ConsumerStatefulWidget {
  const BaseScaffold({
    super.key,
    required this.child,
    required this.rowItemCounts,
    this.onContentSelect,
    this.keyHandler,
  });

  final Widget child;
  final List<int> rowItemCounts;
  final void Function(int row, int col)? onContentSelect;
  final KeyEventResult Function(KeyEvent event)? keyHandler;

  @override
  ConsumerState<BaseScaffold> createState() => _LayoutState();
}

class _LayoutState extends ConsumerState<BaseScaffold> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _focusNode.requestFocus();
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

    // 1. Primero el handler externo (Settings, etc.)
    if (widget.keyHandler != null) {
      final result = widget.keyHandler!(event);
      if (result == KeyEventResult.handled) return KeyEventResult.handled;
    }

    // 2. Fallback: navegación global del sidebar
    final key = event.logicalKey;
    final state = ref.read(navigationProvider);
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
        widget.onContentSelect?.call(state.row, state.col);
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
        onKeyEvent: _handleKey,
        child: Stack(
          children: [
            Positioned.fill(left: 175, child: widget.child),
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              width: 175,
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: RepaintBoundary(child: Sidebar(selectedIndex: navIndex)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
