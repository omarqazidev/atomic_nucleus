import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyHomePage());

class MyHomePage extends StatefulWidget {
  //MyHomePage({Key key, this.title}) : super(key: key);

  //final String title;

  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  Completer<WebViewController> _controller = Completer<WebViewController>();

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Atomic Nucleus'),
          centerTitle: true,
        ),
        body: WebView(
          initialUrl: "http://www.cubemason.com/atomicnucleus/86.142.0.html",
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController controller) {
            _controller.complete(controller);
          },
        ),
        drawer: new Drawer(
          child: ListView(
            children: [
              //Doesnt work - Says 'Type' cant be assigned to list type 'Widget'
              //
              //  ListTile : FutureBuilder<WebViewController>(
              //   future: _controller.future,
              //   builder:
              //       (BuildContext context, AsyncSnapshot<WebViewController> controller) {
              //     if (controller.hasData) {
              //       return ListTile(
              //         title: Text("7x7x7"),
              //         trailing: Icon(Icons.dashboard),
              //         onTap: () async {
              //           controller.data.loadUrl("www.google.com");
              //         },
              //       );
              //     }
              //     return Container();
              //   },
              // );

              // ),

              ListTile(
                  title: Text("7x7x7"),
                  trailing: Icon(Icons.dashboard),
                  onTap: () {
                    print('yo');
                    //controller is acting as a completer here. i dont know how to get it to work like a controller
                    //_controller.loadUrl("www.google.com");
                  }),

              ListTile(
                title: Text("5x5x5"),
                trailing: Icon(Icons.dashboard),
              ),
              ListTile(
                title: Text("3x3x5"),
                trailing: Icon(Icons.dashboard),
              ),
              ListTile(
                title: Text("3x3x4"),
                trailing: Icon(Icons.dashboard),
              ),
              ListTile(
                title: Text("1x1x4"),
                trailing: Icon(Icons.dashboard),
              ),
            ],
          ),
        ),
      ),
    );
  }


  _loadSite() {
    return FutureBuilder<WebViewController>(
      future: _controller.future,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> controller) {
        if (controller.hasData) {
          return ListTile(
            title: Text("7x7x7"),
            trailing: Icon(Icons.dashboard),
            onTap: () async {
              controller.data.loadUrl("www.google.com");
            },
          );
        }
        return Container();
      },
    );
  }
}
