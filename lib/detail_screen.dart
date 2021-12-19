import 'package:flutter/material.dart';

import 'main.dart';

void main() {
  runApp(const MyApp());
}

class Detail extends StatelessWidget {
  var title;

  var photo;

  Detail(this.photo, this.title, {Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              title,
              textAlign: TextAlign.center,
            ),
          ),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyHomePage()));
                },
                child: Hero(
                  tag: title,
                  child: Image.network(
                    photo,
                    scale: 0.5,
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
