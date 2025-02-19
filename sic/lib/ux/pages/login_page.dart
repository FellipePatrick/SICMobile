import 'package:flutter/material.dart';
import '../widgets/input_field.dart';
import '../widgets/login_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isChecked = true; // Variável que controla o estado do checkbox

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0c6dfd), // Fundo azul
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 15,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            width: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),

                /// Ícone de zoonose
                Icon(Icons.biotech, size: 80, color: Color(0xFF0c6dfd)),

                const SizedBox(height: 10),

                /// Novo título estilizado
                const Text(
                  "Acesse o SIC",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0c6dfd),
                  ),
                ),

                /// Novo subtítulo
                const Text(
                  "Sistema Inteligente de Classificação de Zoonoses",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF0c6dfd),
                  ),
                ),

                const SizedBox(height: 20),

                InputField(label: "Usuário", icon: Icons.person),
                const SizedBox(height: 15),
                InputField(label: "Senha", icon: Icons.lock, isPassword: true),
                const SizedBox(height: 10),

                /// Lembre-se de mim
                Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      activeColor: Color(0xFF0c6dfd),
                      onChanged: (value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                    ),
                    const Text("Lembre-se de mim"),
                  ],
                ),

                const SizedBox(height: 20),
                LoginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
