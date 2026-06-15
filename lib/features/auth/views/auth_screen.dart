import 'package:flutter/material.dart';
import 'package:game_tv/features/auth/views/widgets/login_form.dart';
import 'package:game_tv/features/auth/views/widgets/register_form.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isRegister = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/portada.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.deepPurple.shade600, width: 2),
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),

              transitionBuilder: (child, animation) {
                final isEntering =
                    (child.key == const ValueKey('register') && isRegister) ||
                    (child.key == const ValueKey('login') && !isRegister);

                final begin = isEntering
                    ? const Offset(1.2, 0)
                    : const Offset(-1.2, 0);

                final offsetAnimation =
                    Tween<Offset>(begin: begin, end: Offset.zero).animate(
                      CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeInOutCubic,
                      ),
                    );

                return SlideTransition(position: offsetAnimation, child: child);
              },
              child: isRegister
                  ? RegisterForm(
                      key: const ValueKey('Register'),
                      onSwitch: () => setState(() => isRegister = false),
                    )
                  : LoginForm(
                      key: const ValueKey('Login'),
                      onSwitch: () => setState(() => isRegister = true),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
