import 'dart:io';
import 'package:bebras_task/constant.dart';
import 'package:bebras_task/model/pdf_api.dart';
import 'package:bebras_task/page/landingPage/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PDFViewerPage extends StatefulWidget {
  final String url;

  const PDFViewerPage({Key? key, required this.url}) : super(key: key);

  @override
  _PDFViewerPageState createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  late PDFViewController controller;
  int pages = 0;
  int indexPage = 0;
  File? file;

  @override
  void initState() {
    getFile(widget.url);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final text = '${indexPage + 1} of $pages';

    return Scaffold(
      appBar: AppBar(
        actions: pages >= 2
            ? [
                Center(child: Text(text)),
                IconButton(
                  icon: Icon(Icons.chevron_left, size: 32),
                  onPressed: () {
                    final page = indexPage == 0 ? pages : indexPage - 1;
                    controller.setPage(page);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.chevron_right, size: 32),
                  onPressed: () {
                    final page = indexPage == pages - 1 ? 0 : indexPage + 1;
                    controller.setPage(page);
                  },
                ),
              ]
            : null,
      ),
      body: Background(
        // ignore: unnecessary_null_comparison
        child: file == null
            ? Center(
                child: Text(
                  "Tunggu Sebentar...",
                  style: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w700,
                      fontSize: 40,
                      color: appBlue),
                ),
              )
            : PDFView(
                filePath: file!.path,
                onRender: (pages) => setState(() => this.pages = pages!),
                onViewCreated: (controller) =>
                    setState(() => this.controller = controller),
                onPageChanged: (indexPage, _) =>
                    setState(() => this.indexPage = indexPage!),
              ),
      ),
    );
  }

  void getFile(String url) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var _urlMateri =
        prefs.containsKey('urlMateri') ? prefs.getString('urlMateri') : '';
    if (_urlMateri != url) {
      final fileTemp = await PDFApi.loadFirebase(url);
      if (fileTemp != null) {
        await prefs.setString('urlMateri', url);
        setState(() {
          file = fileTemp;
        });
      }
    } else {
      final fileTemp = await PDFApi.openFile(url);
      setState(() {
        file = fileTemp;
      });
    }
  }
}
