import 'package:flutter/material.dart';
import 'package:sic/services/rotas.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF0c6dfd),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 5,
        ),
        onPressed: () {
          // Lógica do login aquionTap: () {
          Navigator.pushNamed(context, AppRoutes.home);
        },
        child: const Text(
          "Entrar",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
