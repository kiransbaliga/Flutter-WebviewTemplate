import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late WebViewController _controller;

Future<bool> _onWillPop(BuildContext context) async {
    if (await _controller.canGoBack()) {
      _controller.goBack();
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  _goBack() async{
    if (await _controller.canGoBack()) {
      await _controller.goBack();
    }
  }
  _goForward() async {  
    if (await _controller.canGoForward()) {
      await _controller.goForward();
    }
  }

  
  @override

  Widget build(BuildContext context) {
    return WillPopScope(
      
      onWillPop: () => _onWillPop(context),
       
      child: Scaffold(
        // appBar: AppBar(
        //   actions: [
        //     IconButton(
        //       icon:Icon(Icons.arrow_back),
        //       onPressed: () {
        //         _goBack();
        //       }),
        //     IconButton(
        //       icon:Icon(Icons.arrow_forward),
        //       onPressed: () {
        //         _goForward();
        //       }),
        //   ],
        // ),
        body: SafeArea(
          child: WebView(
          // Replace the below link with the link that you desire!
          initialUrl: "https://flutter.dev/",
          javascriptMode: JavascriptMode.unrestricted,
          
          onWebViewCreated: (WebViewController webviewcontroller){
            _controller = webviewcontroller;
          },
        ),
        ),
      ),
    );
  }
}
