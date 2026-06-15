import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  final Widget text;
  final Widget icon;
  final Color backgroundColor;
  final Color focusedColor;
  final void Function()? onPressed;

  const IconTextButton({
    super.key,
    required this.text,
    required this.icon,
    this.backgroundColor = const Color(0xFF050812),
    this.focusedColor = Colors.deepPurple, // Resalte visual para la TV
    required this.onPressed,
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
        // elevation: WidgetStateProperty.resolveWith<double>((
        //   Set<WidgetState> states,
        // ) {
        //   if (states.contains(WidgetState.focused)) return 5.0;
        //   return 2.0;
        // }),
        alignment: Alignment.centerLeft,
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        minimumSize: WidgetStateProperty.all(const Size(150, 40)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(width: 10),
          Flexible(child: text),
        ],
      ),
    );
  }
}
