import 'package:flutter/material.dart';
import 'package:sic/ux/widgets/app_bar.dart';
import 'package:sic/ux/widgets/drawer.dart';

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  final TextEditingController _nomeController =
      TextEditingController(text: "Seu Nome");
  final TextEditingController _senhaController = TextEditingController();
  final String _usuario = "usuario123"; // Simulação de usuário fixo
  final String _funcao = "Administrador"; // Simulação de função fixa
  bool _mostrarSenha = false; // Estado para exibir/ocultar a senha

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        // Permite rolagem na tela
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Perfil",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0c6dfd),
                ),
              ),
            ),
            const SizedBox(height: 30),

            _buildInputField("Nome", _nomeController, editable: true),
            const SizedBox(height: 15),

            _buildInputField("Usuário", TextEditingController(text: _usuario),
                editable: false),
            const SizedBox(height: 15),

            _buildInputField("Função", TextEditingController(text: _funcao),
                editable: false),
            const SizedBox(height: 15),

            _buildPasswordField(), // Campo de senha com ícone de visibilidade
            const SizedBox(height: 30),

            // Botão Salvar
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Dados salvos com sucesso!")),
                  );
                },
                icon: const Icon(Icons.save, size: 24),
                label: const Text(
                  "Salvar",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blueAccent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                ),
              ),
            ),
            const SizedBox(height: 30), // Espaço extra no final para rolagem
          ],
        ),
      ),
    );
  }

  // Função para criar campos de texto normais
  Widget _buildInputField(String label, TextEditingController controller,
      {bool editable = true}) {
    return TextField(
      controller: controller,
      enabled: editable,
      style: const TextStyle(color: Colors.black87, fontSize: 16),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
            color: Color(0xFF0c6dfd),
            fontSize: 18,
            fontWeight: FontWeight.w500),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF0c6dfd), width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF0c6dfd), width: 2),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }

  // Função para criar o campo de senha com ícone de visibilidade
  Widget _buildPasswordField() {
    return TextField(
      controller: _senhaController,
      obscureText: !_mostrarSenha,
      style: const TextStyle(color: Colors.black87, fontSize: 16),
      decoration: InputDecoration(
        labelText: "Senha", // Isso vai aparecer em cima do input
        labelStyle: const TextStyle(
            color: Color(0xFF0c6dfd),
            fontSize: 18,
            fontWeight: FontWeight.w500),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF0c6dfd), width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF0c6dfd), width: 2),
        ),
        filled: true,
        fillColor: Colors.white,
        suffixIcon: IconButton(
          icon: Icon(
            _mostrarSenha ? Icons.visibility : Icons.visibility_off,
            color: Color(0xFF0c6dfd),
          ),
          onPressed: () {
            setState(() {
              _mostrarSenha = !_mostrarSenha;
            });
          },
        ),
      ),
    );
  }
}
