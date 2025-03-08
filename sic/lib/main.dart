import 'package:flutter/material.dart';
import 'package:sic/services/rotas.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Sic());
}

class Sic extends StatelessWidget {
  const Sic({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
