import 'package:flutter/material.dart';
import 'package:sic/ux/widgets/action_button.dart';
import 'package:sic/ux/widgets/drawer_header.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF0c6dfd),
        title: const Text(
          '',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {},
          ),
        ],
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
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
              onPressed: () {},
            ),
            const SizedBox(height: 30),
            ActionButton(
              icon: Icons.help_outline,
              label: "Tutorial",
              backgroundColor: Colors.white,
              textColor: Color(0xFF0c6dfd),
              onPressed: () {},
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
        onPressed: () {},
        backgroundColor: Color(0xFF0c6dfd),
        child: const Icon(Icons.biotech, color: Colors.white),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeaderWidget(),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Página Inicial'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Perfil'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configurações'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Sair'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
