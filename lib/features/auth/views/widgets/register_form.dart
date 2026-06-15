import 'package:flutter/material.dart';
import 'package:game_tv/core/widgets/custom_text_form_field.dart';

class RegisterForm extends StatelessWidget {
  final VoidCallback onSwitch;
  const RegisterForm({super.key, required this.onSwitch});

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
                  'REGISTRAR UNA NUEVA CUENTA',
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
                    onPressed: () {},
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
                  onPressed: onSwitch,
                  child: Text(
                    'YA TIENES CUENTA',
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
      ],
    );
  }
}
