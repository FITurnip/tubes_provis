import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class PDFViewerPage extends StatefulWidget {
  final String url;

  PDFViewerPage({required this.url});

  @override
  _PDFViewerPageState createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  String? localPath;

  @override
  void initState() {
    super.initState();
    loadPdfFromNetwork();
  }

  Future<void> loadPdfFromNetwork() async {
    try {
      var response = await http.get(Uri.parse("http://192.168.100.36:8000/${widget.url}"));
      var dir = await getTemporaryDirectory();
      String filePath = '${dir.path}/temp.pdf';
      File file = File(filePath);
      await file.writeAsBytes(response.bodyBytes, flush: true);
      setState(() {
        localPath = filePath;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF Viewer"),
      ),
      body: localPath == null
          ? Center(child: CircularProgressIndicator())
          : PDFView(
              filePath: localPath!,
            ),
    );
  }
}
