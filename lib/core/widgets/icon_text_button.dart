import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  final Widget text;
  final Widget? icon;
  final Color backgroundColor;
  final Color focusedColor;
  final void Function()? onPressed;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossaxisalignment;
  final MainAxisSize mainAxisSize;

  const IconTextButton({
    super.key,
    required this.text,
    this.icon,
    this.backgroundColor = const Color(0xFF050812),
    this.focusedColor = Colors.deepPurple, // Resalte visual para la TV
    required this.onPressed,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossaxisalignment = CrossAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.min,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.focused)) {
            return focusedColor;
          }
          return backgroundColor;
        }),
        alignment: Alignment.centerLeft,
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        minimumSize: WidgetStateProperty.all(const Size(150, 40)),
      ),
      child: Row(
        mainAxisSize: mainAxisSize,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossaxisalignment,
        children: [
          icon ?? SizedBox.shrink(),
          const SizedBox(width: 10),
          Flexible(child: text),
        ],
      ),
    );
  }
}
