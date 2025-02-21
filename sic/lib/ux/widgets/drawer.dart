import 'package:sic/rotas.dart';
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
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.login);
            },
          ),
        ],
      ),
    );
  }
}
