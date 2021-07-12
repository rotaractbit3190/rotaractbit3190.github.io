import 'package:flutter/material.dart';
import 'dart:html';
import 'dart:ui' as ui;
import 'package:rotaract_website/services/Database.dart';
//conditional import
import 'package:rotaract_website/Register/fake_ui.dart'
    if (dart.library.html) 'dart:ui' as ui;
import 'package:flutter/material.dart';

class RazorPayWeb extends StatefulWidget {
  // String name = "";
  @override
  _RazorPayWebState createState() => _RazorPayWebState();
}

class _RazorPayWebState extends State<RazorPayWeb> {
  String name = "";

  String email = "";

  String usn = "";

  String phone = "";
  bool isDone = false;
  bool hasError = false;
  String registeration_id = "";

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments;

    //register view factory
    ui.platformViewRegistry.registerViewFactory("rzp-html", (int viewId) {
      IFrameElement element = IFrameElement();
      //Event Listener
      window.onMessage.forEach((element) async {
        print('Event Received in callback: ${element.data}');
        if (element.data == 'MODAL_CLOSED') {
          Navigator.popAndPushNamed(context, '/register');
        } else if (element.data == 'SUCCESS') {
          dynamic res = await Database(arguments['name'], arguments['phone'],
                  arguments['email'], arguments['usn'], "", "")
              .register();
          if (res == null) {
            setState(() {
              isDone = true;
              hasError = true;
            });
          } else {
            setState(() {
              isDone = true;
              hasError = false;
              registeration_id = res.toString().split('/')[1].substring(0, 20);
            });
          }
        }
      });

      element.requestFullscreen();
      element.src = 'https://shreyashjiodndian2.github.io/index.html';
      element.style.border = 'none';
      return element;
    });
    return Scaffold(body: Builder(builder: (BuildContext context) {
      return Container(
        child: isDone
            ? (hasError
                ? Navigator.pushNamed(context, '/register', arguments: {
                    'hasError': true,
                    'isDone': true,
                  })
                : Navigator.pushNamed(context, '/register', arguments: {
                    'hasError': false,
                    'isDone': true,
                    'registration_id': registeration_id
                  }))
            : HtmlElementView(viewType: 'rzp-html'),
      );
    }));
  }
}
