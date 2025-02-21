import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sic/rotas.dart';
import 'package:sic/ux/widgets/app_bar.dart';
import 'package:sic/ux/widgets/drawer.dart';

class TutorialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Text(
              "Tipos de Imagens para Análise",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              "O sistema recebe dois tipos de imagens para análise: \n\n"
              "🔍 Imagens com zoom: Imagens direto do microscópio.\n\n"
              "📷 Imagens sem zoom: Imagens retiradas com suporte no microscópio.",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildOptionButton(
                  context,
                  Icons.zoom_in,
                  "Com Zoom",
                  Colors.blueAccent,
                  [
                    'img/imgComzoom1.jpeg',
                    'img/imgComzoom2.jpeg',
                    'img/imgComzoom3.jpeg'
                  ], // Lista de imagens com zoom
                ),
                const SizedBox(width: 20),
                _buildOptionButton(
                  context,
                  Icons.zoom_out,
                  "Sem Zoom",
                  Colors.green,
                  [
                    'img/imgSemzoom1.jpeg',
                    'img/imgSemzoom2.jpeg',
                    'img/imgSemzoom3.jpeg'
                  ], // Lista de imagens sem zoom
                ),
              ],
            ),
            const SizedBox(height: 20),
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
        backgroundColor: const Color(0xFF0c6dfd),
        child: const Icon(Icons.biotech, color: Colors.white),
      ),
    );
  }

  Widget _buildOptionButton(
    BuildContext context,
    IconData icon,
    String label,
    Color color,
    List<String> imagePaths,
  ) {
    return ElevatedButton.icon(
      onPressed: () {
        _showImageModal(context, label, imagePaths);
      },
      icon: Icon(icon, size: 28),
      label: Text(label, style: const TextStyle(fontSize: 16)),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        backgroundColor: color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  void _showImageModal(
      BuildContext context, String title, List<String> imagePaths) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 300,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    enlargeCenterPage: true,
                  ),
                  items: imagePaths.map((path) {
                    return Image.asset(
                      path,
                      fit: BoxFit.contain,
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFF0c6dfd), // Cor do botão Fechar
                  ),
                  child: const Text(
                    "Fechar",
                    style:
                        TextStyle(color: Colors.white), // Cor da fonte branca
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
