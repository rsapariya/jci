import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jci/splaysh.dart';

import '../units/Storage.dart';

class InAppbrowser extends StatefulWidget {
  const InAppbrowser({Key? key}) : super(key: key);

  @override
  State<InAppbrowser> createState() => _InAppbrowserState();
}

class _InAppbrowserState extends State<InAppbrowser> {
  double _progress = 0;
  late InAppWebViewController webView;
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        backgroundColor: Appbarcolour,
        centerTitle: true,
        title: Text(
          'Download',
          style: GoogleFonts.poppins(),
        ),
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(
                url: Uri.parse(getdata.read('Downloads').toString())),
            onWebViewCreated: (InAppWebViewController controller) {
              webView = controller;
            },
            onProgressChanged:
                (InAppWebViewController controller, int progress) {
              setState(() {
                _progress = progress / 100;
              });
            },
          ),
          _progress < 1
              ? SizedBox(
                  height: 3,
                  child: LinearProgressIndicator(
                    value: _progress,
                    backgroundColor: Colors.blue,
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
