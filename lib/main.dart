import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:open_file/open_file.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Document View',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String pdfUrl = "";

  _openAnyFile() {
    String path = "/sdcard/Download/sample.pdf";
    OpenFile.open(path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Document View"),
      ),
      body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  RaisedButton(
                    child: Text("From Local"),
                    onPressed: () {
                      setState(() {
                        pdfUrl = "/sdcard/Download/sample.pdf";
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text("Open File In Other App"),
                    onPressed: () {
                      _openAnyFile();
                    },
                  ),
                ],
              ),
              if (pdfUrl.isNotEmpty)
                Container(
                  height: 600.0,
                  child: PDFView(
                  filePath: pdfUrl,
                  enableSwipe: true,
                  swipeHorizontal: true,
                  onError: (err) {
                    print(err);
                  },
                ),
                )
            ],
          )),
    );
  }
}
