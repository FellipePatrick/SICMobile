import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isPassword;

  const InputField({
    super.key,
    required this.label,
    required this.icon,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      cursorColor: const Color(0xFF0c6dfd), // Cor do cursor ao digitar
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
            color: Color.fromARGB(255, 91, 95, 101)), // Cor do label
        prefixIcon: Icon(icon, color: const Color(0xFF0c6dfd)),
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
              color: Color(0xFF0c6dfd), width: 2), // Borda azul ao focar
        ),
      ),
    );
  }
}
