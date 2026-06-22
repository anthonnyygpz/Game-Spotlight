import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TvButton extends StatefulWidget {
  final String? label;
  final IconData? icon;
  final double iconSize;
  final double textSize;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final VoidCallback onPressed;

  const TvButton({
    super.key,
    this.label,
    this.icon,
    this.iconSize = 11,
    this.textSize = 8,
    this.width,
    this.height,
    this.padding,
    required this.onPressed,
  });

  @override
  State<TvButton> createState() => _TvButtonState();
}

class _TvButtonState extends State<TvButton> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Focus(
      autofocus: true,
      onFocusChange: (hasFocus) {
        setState(() {
          _isFocused = hasFocus;
        });
      },
      onKeyEvent: (node, event) {
        if (event is KeyDownEvent &&
            (event.logicalKey == LogicalKeyboardKey.select ||
                event.logicalKey == LogicalKeyboardKey.enter ||
                event.logicalKey == LogicalKeyboardKey.gameButtonA)) {
          widget.onPressed();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedScale(
          scale: _isFocused ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 150),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: widget.width,
            height: widget.height,
            padding:
                widget.padding ??
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: _isFocused
                  ? colorScheme.primary
                  : colorScheme.surface.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: _isFocused ? Colors.white : colorScheme.primary,
                width: 2,
              ),
              boxShadow: _isFocused
                  ? [
                      BoxShadow(
                        color: colorScheme.primary.withValues(alpha: 0.5),
                        blurRadius: 15,
                        spreadRadius: 2,
                      ),
                    ]
                  : [],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.icon != null) ...[
                  Icon(
                    widget.icon!,
                    color: Colors.white,
                    size: widget.iconSize,
                  ),
                  const SizedBox(width: 5),
                ],
                if (widget.label != null)
                  Text(
                    widget.label!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: widget.textSize,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
