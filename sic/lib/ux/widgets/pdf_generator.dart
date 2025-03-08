import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';

class PdfGenerator {
  static Future<void> generatePdf(File image, String diagnostico) async {
    final pdf = pw.Document();

    final imageBytes = await image.readAsBytes();
    final pdfImage = pw.MemoryImage(imageBytes);

    // Fonte personalizada para título
    final titleStyle = pw.TextStyle(
      fontSize: 18,
      fontWeight: pw.FontWeight.bold,
      color: PdfColors.blue900,
    );

    // Fonte personalizada para texto normal
    final bodyStyle = pw.TextStyle(fontSize: 14, color: PdfColors.black);

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Container(
            padding: pw.EdgeInsets.all(24),
            decoration: pw.BoxDecoration(
              border: pw.Border.all(color: PdfColors.grey),
            ),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                // Cabeçalho estilizado
                pw.Container(
                  padding: pw.EdgeInsets.all(10),
                  decoration: pw.BoxDecoration(
                    color: PdfColors.grey300,
                    borderRadius: pw.BorderRadius.circular(8),
                  ),
                  child: pw.Center(
                    child: pw.Text(
                      "SIC - Sistema Inteligente de Classificação de Zoonoses",
                      style: titleStyle,
                    ),
                  ),
                ),
                pw.SizedBox(height: 20),

                // Imagem centralizada com bordas arredondadas
                pw.Center(
                  child: pw.Container(
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.blue, width: 2),
                      borderRadius: pw.BorderRadius.circular(10),
                    ),
                    padding: pw.EdgeInsets.all(8),
                    child: pw.ClipRRect(
                      horizontalRadius: 10,
                      verticalRadius: 10,
                      child: pw.Image(pdfImage, width: 300),
                    ),
                  ),
                ),
                pw.SizedBox(height: 20),

                // Seção de análise
                pw.Text("📌 Resultado da Análise", style: titleStyle),
                pw.Divider(),
                pw.SizedBox(height: 10),
                pw.Text(
                  diagnostico,
                  textAlign: pw.TextAlign.justify,
                  style: bodyStyle,
                ),
                pw.SizedBox(height: 20),

                // Rodapé com data e assinatura automática
                pw.Divider(),
                pw.SizedBox(height: 10),
                pw.Text(
                  "📅 Data do Exame: ${DateTime.now().toLocal()}",
                  style: pw.TextStyle(fontSize: 12, color: PdfColors.grey700),
                ),
                pw.SizedBox(height: 5),
                pw.Text(
                  "🔍 Relatório gerado automaticamente pelo SIC",
                  style: pw.TextStyle(fontSize: 12, color: PdfColors.grey700),
                ),
              ],
            ),
          );
        },
      ),
    );

    // Salvar o PDF no diretório do app
    final output = await getApplicationDocumentsDirectory();
    final file = File("${output.path}/relatorio.pdf");
    await file.writeAsBytes(await pdf.save());

    // Abrir o arquivo automaticamente
    OpenFile.open(file.path);
  }
}
