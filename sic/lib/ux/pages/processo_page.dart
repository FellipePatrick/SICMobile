import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sic/ux/widgets/app_bar.dart';
import 'package:sic/ux/widgets/drawer.dart';

class ProcessoPage extends StatefulWidget {
  @override
  _ProcessoPageState createState() => _ProcessoPageState();
}

class _ProcessoPageState extends State<ProcessoPage> {
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 70),

            // **Título da Página**
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.search,
                  color: Color(0xFF0c6dfd),
                  size: 30,
                ),
                const SizedBox(width: 10),
                const Text(
                  "Processar Imagem",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0c6dfd),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 70),

            // **Card da Imagem**
            Container(
              height: 250,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(3, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: _image != null
                    ? Image.file(
                        _image!,
                        fit: BoxFit.cover,
                      )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.image,
                                size: 60, color: Colors.grey[400]),
                            const SizedBox(height: 10),
                            Text(
                              "Nenhuma imagem selecionada",
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ),
              ),
            ),

            const SizedBox(height: 70),

            // **Botão Selecionar Imagem**
            ElevatedButton.icon(
              onPressed: _pickImage,
              icon: const Icon(Icons.biotech, size: 24),
              label: const Text(
                "Selecionar Imagem",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blueAccent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
