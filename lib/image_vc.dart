// ignore_for_file: prefer_const_constructors, prefer_collection_literals, deprecated_member_use

import 'package:flutter/material.dart';
import 'main.dart';

class ImageRoute extends StatelessWidget {
  const ImageRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final todo = ModalRoute.of(context)!.settings.arguments as Todo;

    if (todo.title == '图片') {
      return Scaffold(
        appBar: AppBar(
          title: Text(todo.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: const ImageDemo(),
        ),
      );
    }
    else if (todo.title == 'ICON') {
      return Scaffold(
        appBar: AppBar(
          title: Text(todo.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: const ICONDemo(),
        ),
      );
    }
    else {
      return Scaffold(
        appBar: AppBar(
          title: Text(todo.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
        ),
      );
    }
  }
}

class ImageDemo extends StatelessWidget {
  const ImageDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var img = AssetImage("images/square.png");
    return SingleChildScrollView(
      child: Column(
          children: <Image>[
            Image(
              image: img,
              height: 50.0,
              width: 100.0,
              fit: BoxFit.fill,
            ),
            Image(
              image: img,
              height: 50,
              width: 50.0,
              fit: BoxFit.contain,
            ),
            Image(
              image: img,
              width: 100.0,
              height: 50.0,
              fit: BoxFit.cover,
            ),
            Image(
              image: img,
              width: 100.0,
              height: 50.0,
              fit: BoxFit.fitWidth,
            ),
            Image(
              image: img,
              width: 100.0,
              height: 50.0,
              fit: BoxFit.fitHeight,
            ),
            Image(
              image: img,
              height: 50.0,
              width: 100.0,
              fit: BoxFit.none,
            ),
            Image(
              image: img,
              width: 100.0,
              height: 50.0,
              fit: BoxFit.scaleDown,
            ),
            Image(
              image: img,
              width: 100.0,
              color: Colors.blue,
              colorBlendMode: BlendMode.difference,
              fit: BoxFit.fill,
            ),
            Image(
              image: img,
              width: 100.0,
              height: 200.0,
              repeat: ImageRepeat.repeat,
            )
          ].map((e) {
            return Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: 100,
                    child: e,
                  ),
                ),
                Text(e.fit.toString())
              ],
            );
          }).toList()
      ),
    );
  }
}
class ICONDemo extends StatelessWidget {
  const ICONDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String icons_0 = "\uE03e";
    String icons_1 = "\uE237";
    String icons_2 = "\uE287";

    return Column(
      children: <Widget>[
        Text(
          icons_0,
          style: TextStyle(
            fontFamily: "MaterialIcons",
            fontSize: 24.0,
            color: Colors.green,
          ),
        ),
        Text(
          icons_1,
          style: TextStyle(
            fontFamily: "MaterialIcons",
            fontSize: 48.0,
            color: Colors.orange,
          ),
        ),
        Text(
          icons_2,
          style: TextStyle(
            fontFamily: "MaterialIcons",
            fontSize: 72.0,
            color: Colors.yellow,
          ),
        ),
      ],
    );

    //方式1
    String icons = "";
    // accessible: 0xe03e
    icons += "\uE03e";
    // error:  0xe237
    icons += " \uE237";
    // fingerprint: 0xe287
    icons += " \uE287";

    return Text(
      icons,
      style: TextStyle(
        fontFamily: "MaterialIcons",
        fontSize: 24.0,
        color: Colors.green,
      ),
    );

    //方式2
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        Icon(Icons.accessible,color: Colors.red),
        Icon(Icons.error,color: Colors.green),
        Icon(Icons.fingerprint,color: Colors.orange),
      ],
    );
  }
}