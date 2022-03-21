import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget
{
  @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp>
{

  late WebViewController _controller;

  void goBack() async{
    if(await _controller.canGoBack()){
      await _controller.goBack();
    }
  }
  void goForward() async
  {
    if(await _controller.canGoForward()){
      await _controller.goForward();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter webView"),
        backgroundColor: Color(0xFF04AA6D),
        actions: [
          IconButton(onPressed: goBack, icon: Icon(Icons.arrow_back)),
          IconButton(onPressed: goForward, icon: Icon(Icons.arrow_forward)),
        ],

      ),
      body: SafeArea(
        child: WebView(
          initialUrl: 'https://www.w3schools.com/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController web){
            _controller = web;
          },
        ),
      ),
    );
  }

}

