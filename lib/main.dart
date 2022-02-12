import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:webview_flutter/webview_flutter.dart';
void main() {
  runApp(MaterialApp(
    home: MyApp(),
    title: 'Linkedin webpage',
  ),);
}
class MyApp extends StatelessWidget {
  final Completer<WebViewController> _controller=Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Linkedin Webpage'),
        centerTitle: true,
        elevation: 10,
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: 450,
            width: 300,
            child: Padding(
              padding: const EdgeInsets.all(0.9),
              child: Card(
                elevation: 60,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35)
                ),
                child: SafeArea(
                  child: Center(
                    child: Column(
                      children: [
                        Image.asset("android/assets/images/profile.jpeg", height: 0.3 * height,),
                        Text('Name:Rithika.G',style: TextStyle(
                          fontFamily:'Pacifico',fontStyle: FontStyle.normal,fontSize: 25,
                        ),),
                        Text('Location:Pollachi',style: TextStyle(
                          fontSize: 25,fontStyle: FontStyle.italic
                        ),),
                        Text('Instituition:MCET',style: TextStyle(
                          fontStyle: FontStyle.italic,fontSize: 25
                        ),),
                        Text('Skills:C,C++,Java,Flutter',style: TextStyle(
                          fontSize: 25,fontStyle: FontStyle.italic
                        ),),
                        ElevatedButton(onPressed: () => {
                        showDialog(context: context, builder: (_) =>
                         WebView(
                           initialUrl: 'https://www.linkedin.com/in/rithika-govindhan-304076224/',
                           javascriptMode: JavascriptMode.unrestricted,
                           onWebViewCreated: (WebViewController webViewController) {
                             _controller.complete(webViewController);
                           },
                         ))
                       },
                           child:Text('Linkedin',style: TextStyle(
                             fontSize: 30,
                             color: Colors.white,
                             fontWeight: FontWeight.bold,
                             fontStyle: FontStyle.italic,
                             letterSpacing: 2.0
                           ),))
                      ],
                    )
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      );
  }
}
