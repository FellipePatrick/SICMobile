import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sic/ux/widgets/app_bar.dart';
import 'package:sic/ux/widgets/drawer.dart';
import 'package:sic/ux/widgets/pdf_generator.dart';

class ProcessoPage extends StatefulWidget {
  @override
  _ProcessoPageState createState() => _ProcessoPageState();
}

class _ProcessoPageState extends State<ProcessoPage> {
  File? _image;
  bool _isGeneratingPdf = false;
  bool _zoom = false;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    final prefs = await SharedPreferences.getInstance();
    final base64String = prefs.getString('saved_image');
    if (base64String != null) {
      final bytes = base64Decode(base64String);
      final tempDir = Directory.systemTemp;
      final file = File('${tempDir.path}/temp_image.png');
      await file.writeAsBytes(bytes);
      setState(() {
        _image = file;
      });
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final file = File(pickedFile.path);
      final bytes = await file.readAsBytes();
      final base64String = base64Encode(bytes);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('saved_image', base64String);

      setState(() {
        _image = file;
      });
    }
  }

  Future<void> _generatePdf() async {
    if (_image == null || _isGeneratingPdf) return;

    setState(() {
      _isGeneratingPdf = true; // Ativa o loading
    });

    String diagnostico = """
      A análise da imagem identificou a presença de elementos compatíveis com parasitas do gênero *Toxocara spp*.
      Esta zoonose pode ser transmitida para humanos e animais através da ingestão de ovos do parasita.
      
      Recomenda-se a consulta com um veterinário para confirmação do diagnóstico e aplicação do tratamento adequado.
    """;

    await PdfGenerator.generatePdf(_image!, diagnostico);

    setState(() {
      _isGeneratingPdf = false; // Desativa o loading após gerar o PDF
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context)
                .size
                .height, // Garante que a tela ocupe pelo menos a altura do dispositivo
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.search, color: Color(0xFF0c6dfd), size: 30),
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
              const SizedBox(height: 40),
              Container(
                height: 250,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(3, 3),
                    )
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: _image != null
                      ? Image.file(_image!, fit: BoxFit.cover)
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
              const SizedBox(height: 40),

              // Switch para ativar/desativar zoom
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 6,
                      offset: Offset(0, 4), // Sombra mais realista
                    ),
                  ],
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.zoom_in, color: Color(0xFF0c6dfd), size: 24),
                    const SizedBox(width: 10),
                    Text(
                      "Zoom",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0c6dfd),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Switch(
                      value: _zoom,
                      activeColor: Color(0xFF0c6dfd),
                      activeTrackColor: Color(0xFF87b3ff),
                      inactiveThumbColor: Color(0xFF0c6dfd),
                      inactiveTrackColor: Colors.white,
                      onChanged: (value) {
                        setState(() {
                          _zoom = value;
                        });
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

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
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 5,
                ),
              ),
              if (_image != null) ...[
                const SizedBox(height: 20),
                _isGeneratingPdf
                    ? const Column(
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(height: 10),
                          Text(
                            "Gerando PDF...",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      )
                    : ElevatedButton.icon(
                        onPressed: _generatePdf,
                        icon: const Icon(Icons.download, size: 24),
                        label: const Text(
                          "Baixar Relatório",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          elevation: 5,
                        ),
                      ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
