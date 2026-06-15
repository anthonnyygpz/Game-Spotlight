import 'package:flutter/material.dart';

class ButtonCircleAvatar extends StatefulWidget {
  final double radius;
  final Color backgroundColor;
  final Color focusedBorderColor;
  final Widget child;
  final VoidCallback? onPressed;

  const ButtonCircleAvatar({
    super.key,
    this.radius = 15.0,
    this.backgroundColor = Colors.deepPurple,
    this.focusedBorderColor = Colors.white,
    required this.child,
    this.onPressed,
  });

  @override
  State<ButtonCircleAvatar> createState() => _FocusableCircleAvatarState();
}

class _FocusableCircleAvatarState extends State<ButtonCircleAvatar> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.circle,
      color: Colors.transparent,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: widget.onPressed ?? () {},
        onFocusChange: (hasFocus) {
          setState(() {
            _isFocused = hasFocus;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          // Añade un ligero padding interno cuando está en foco para separar el borde
          padding: EdgeInsets.all(_isFocused ? 3.0 : 0.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: _isFocused
                  ? widget.focusedBorderColor
                  : Colors.transparent,
              width: _isFocused ? 2.0 : 0.0,
            ),
            boxShadow: _isFocused
                ? [
                    BoxShadow(
                      color: widget.focusedBorderColor.withValues(alpha: 0.5),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ]
                : [],
          ),
          child: CircleAvatar(
            radius: widget.radius,
            backgroundColor: widget.backgroundColor,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
