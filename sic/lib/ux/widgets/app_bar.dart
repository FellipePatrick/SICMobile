import 'package:flutter/material.dart';
import 'package:sic/rotas.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF0c6dfd),
      title: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.home);
        },
        child: const Text(
          'Aplicativo SIC',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
