import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final Color defaultColor;
  final Color focusedColor;

  const CustomIconButton({
    super.key,
    this.icon = Icons.search,
    this.onPressed,
    this.defaultColor = Colors.grey,
    this.focusedColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ?? () {},
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.resolveWith<Color>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.focused)) {
            return focusedColor;
          }
          return defaultColor;
        }),
        backgroundColor: WidgetStateProperty.resolveWith<Color?>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.focused)) {
            return focusedColor.withValues(alpha: 0.2); // Resplandor de fondo
          }
          return Colors.transparent;
        }),
        iconSize: WidgetStateProperty.resolveWith<double>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.focused))
            return 32.0; // Ligero aumento de tamaño
          return 24.0;
        }),
      ),
      icon: Icon(icon),
    );
  }
}
