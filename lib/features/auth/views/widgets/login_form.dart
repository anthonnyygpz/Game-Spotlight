import 'package:flutter/material.dart';
import 'package:game_tv/core/constants/app_routes.dart';
import 'package:game_tv/core/widgets/custom_text_form_field.dart';
import 'package:game_tv/features/auth/views/widgets/more_form_login.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatefulWidget {
  final VoidCallback onSwitch;
  const LoginForm({super.key, required this.onSwitch});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  void onSubmit() {
    context.go(AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 15,
              children: [
                Text(
                  'ACCESO A TU CUENTA',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 34,
                  ),
                ),

                CustomTextFormField(
                  label: 'CORREO ELECTRONICO / USUARIO',
                  prefixIcon: const Icon(Icons.email, color: Colors.grey),
                ),

                CustomTextFormField(
                  label: 'CONTRASEÑA',
                  isPassword: true,
                  prefixIcon: const Icon(Icons.lock_sharp, color: Colors.grey),
                ),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundBuilder: (context, state, child) {
                        return Ink(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Colors.purple, Colors.deepPurple],
                            ),
                          ),
                          child: child,
                        );
                      },
                    ),
                    onPressed: onSubmit,
                    child: const Text(
                      'ENTRAR',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),

                TextButton(
                  onPressed: () {},
                  child: const Text(
                    '¿Olvidaste tu contraseña?',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),

                TextButton(
                  onPressed: widget.onSwitch,
                  child: Text(
                    'CREAR NUEVA CUENTA',
                    style: TextStyle(
                      color: Colors.deepPurple.shade400,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Divider
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 1,
            height: double.infinity,
            color: Colors.deepPurple,
          ),
        ),

        // More form login
        Expanded(child: MoreFormLogin()),
      ],
    );
  }
}
