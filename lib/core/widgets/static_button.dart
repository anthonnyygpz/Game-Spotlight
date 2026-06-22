import 'package:flutter/material.dart';

class StaticButton extends StatelessWidget {
  final IconData? icon;
  final String label;
  final bool isPrimary;

  const StaticButton({
    super.key,
    this.icon,
    required this.label,
    required this.isPrimary,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isPrimary ? 20 : 16,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: isPrimary
            ? colorScheme.primary
            : colorScheme.onPrimary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
        border: isPrimary ? null : Border.all(color: colorScheme.onTertiary),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[Icon(icon, size: 18), const SizedBox(width: 8)],
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isPrimary ? FontWeight.w700 : FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}
