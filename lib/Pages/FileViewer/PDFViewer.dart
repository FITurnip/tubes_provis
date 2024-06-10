import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'package:tubes/Services/network.dart';

// void main() {
//   runApp(PDFViewerApp());
// }

// class PDFViewerApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: PDFViewerPage(url: "https://css4.pub/2015/usenix/example.pdf"),
//     );
//   }
// }

class PDFViewerPage extends StatefulWidget {
  final String url;

  PDFViewerPage({required this.url});

  @override
  _PDFViewerPageState createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  String? localPath;
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    loadPdfFromNetwork();
  }

  void loadPdfFromNetwork() async {
    try {
      var response = await Network().accessFile(widget.url, returnType: "");
      if (response.statusCode == 200) {
        var dir = await getTemporaryDirectory();
        String filePath = '${dir.path}/temp.pdf';
        File file = File(filePath);
        await file.writeAsBytes(response.bodyBytes, flush: true);
        setState(() {
          localPath = filePath;
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Failed to load PDF: ${response.statusCode}';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Error loading PDF: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF Viewer"),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : errorMessage != null
              ? Center(child: Text(errorMessage!))
              : PDFView(
                  filePath: localPath!,
                ),
    );
  }
}
