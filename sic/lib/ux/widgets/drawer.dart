import 'package:sic/services/rotas.dart';
import 'package:sic/ux/widgets/drawer_header.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeaderWidget(),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Página Inicial'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.home);
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Perfil'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.perfil);
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt_outlined),
            title: const Text('Processar Imagem'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.processo);
            },
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('Tutorial'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.tutorial);
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Sair'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.login);
            },
          ),
        ],
      ),
    );
  }
}
