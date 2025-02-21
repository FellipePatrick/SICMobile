import 'package:flutter/material.dart';
import 'package:sic/ux/widgets/app_bar.dart';
import 'package:sic/ux/widgets/drawer.dart';

class ResultPage extends StatelessWidget {
  final String resultText =
      "Aqui está o texto detalhado do resultado, descrevendo o processo, os dados e as conclusões do exame.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 100),

              // Box com ícone de foto
              Container(
                height: 250,
                width: double.infinity,
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
                child: Center(
                  child: Icon(
                    Icons.image,
                    size: 80,
                    color: Colors.grey[400],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Área de Texto para o Resultado
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
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
                child: Text(
                  resultText,
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ),

              const SizedBox(height: 30),

              // Botão Baixar Relatório
              ElevatedButton.icon(
                onPressed: () {
                  // Aqui você adicionaria a lógica para baixar o relatório
                },
                icon: Icon(Icons.download, size: 24),
                label: Text(
                  "Baixar Relatório",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
