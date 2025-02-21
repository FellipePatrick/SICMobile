import 'package:flutter/material.dart';
import 'package:sic/rotas.dart';
import 'package:sic/ux/widgets/action_button.dart';
import 'package:sic/ux/widgets/app_bar.dart';
import 'package:sic/ux/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Row(
              children: [
                const Icon(
                  Icons.people_outline,
                  color: Color(0xFF0c6dfd),
                  size: 30,
                ),
                const SizedBox(width: 10),
                const Text(
                  "Bem-vindo ao SIC",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0c6dfd),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Sistema Inteligente de Classificação de Zoonoses\n",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF0c6dfd),
              ),
            ),
            const SizedBox(height: 40),
            ActionButton(
              icon: Icons.camera_alt_outlined,
              label: "Processar Imagem",
              backgroundColor: Color(0xFF0c6dfd),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.processo);
              },
            ),
            const SizedBox(height: 30),
            ActionButton(
              icon: Icons.help_outline,
              label: "Tutorial",
              backgroundColor: Colors.white,
              textColor: Color(0xFF0c6dfd),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.tutorial);
              },
            ),
            const SizedBox(height: 60),
            Center(
              child: Image.asset(
                'img/cardImage.png',
                fit: BoxFit.contain,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.processo);
        },
        backgroundColor: Color(0xFF0c6dfd),
        child: const Icon(Icons.biotech, color: Colors.white),
      ),
    );
  }
}
