import 'dart:developer';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/data_sources/item_data.dart';
import '../pages/detail_screen.dart';
import '../../domain/entities/func.dart';

class FutureBuilderWidget extends StatefulWidget {
  FutureBuilderWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FutureBuilderWidgetState();
}

class _FutureBuilderWidgetState extends State<FutureBuilderWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FotoData>>(
      future: getFoto(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var items = snapshot.data?.length;
          return GridView.builder(
              itemCount: items,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
              ),
              itemBuilder: (context, index) {
                var targetFotoData = snapshot.data![index];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(100),
                          blurRadius: 6.0, // soften the shadow
                          spreadRadius: 1.0, //extend the shadow
                          offset: const Offset(
                            0.0, // Move to right 10  horizontally
                            3.0, // Move to bottom 10 Vertically
                          ),
                        )
                      ],
                    ),
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => Detail(
                                          title: targetFotoData.title,
                                          photo: targetFotoData.photo,
                                        )));
                          },
                          child: Hero(
                            tag: targetFotoData.title,
                            child: Image.network(
                              targetFotoData.photo,
                              // scale: 0.1,.
                            ),
                          ),
                        ),
                        Container(
                            width: double.infinity,
                            height: 22,
                            alignment: AlignmentDirectional.bottomCenter,
                            color: Colors.white70,
                            child: Text(
                              targetFotoData.title,
                              // textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 18.0, color: Colors.black),
                            )),
                      ],
                    ),
                  ),
                );
              });
        } else if (snapshot.hasError) {
          log('${snapshot.error}');
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
