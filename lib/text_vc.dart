// ignore_for_file: prefer_const_constructors, prefer_collection_literals, deprecated_member_use

import 'package:flutter/material.dart';
import 'main.dart';
// import 'route_model.dart';

class TextRoute extends StatelessWidget {
  const TextRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final todo = ModalRoute.of(context)!.settings.arguments as Todo;

    if (todo.title == 'Text') {
      return Scaffold(
        appBar: AppBar(
          title: Text(todo.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: const TextDemo(),
        ),
      );
    }
    else if (todo.title == 'TextStyle') {
      return Scaffold(
        appBar: AppBar(
          title: Text(todo.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: const TextStyleDemo(),
        ),
      );
    }
    else if (todo.title == 'TextSpan') {
      return Scaffold(
        appBar: AppBar(
          title: Text(todo.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: const TextSpanDemo(),
        ),
      );
    }
    else if (todo.title == 'DefaultTextStyle') {
      return Scaffold(
        appBar: AppBar(
          title: Text(todo.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: const DefaultTextStyleDemo(),
        ),
      );
    }
    else if (todo.title == 'FontDemo') {
      return Scaffold(
        appBar: AppBar(
          title: Text(todo.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: const FontDemo(),
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

class TextDemo extends StatelessWidget {
  const TextDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("TextDemo " * 5,
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      textScaleFactor: 1.5,
    );
  }
}
class TextStyleDemo extends StatelessWidget {
  const TextStyleDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("TextStyleDemo",
      style: TextStyle(
          color: Colors.blue,
          fontSize: 18.0,
          height: 1.2,
          fontFamily: "Courier",
          background: Paint()..color=Colors.yellow,
          decoration:TextDecoration.underline,
          decorationStyle: TextDecorationStyle.dashed
      ),
    );
  }
}
class TextSpanDemo extends StatelessWidget {
  const TextSpanDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Text.rich(TextSpan(
        children: const [
          TextSpan(
              text: "TextSpanDemo: "
          ),
          TextSpan(
              text: "https://flutterchina.club",
              style: TextStyle(
                  color: Colors.blue
              ),
              //recognizer: _tapRecognizer
          ),
        ]
    ));
  }
}
class DefaultTextStyleDemo extends StatelessWidget {
  const DefaultTextStyleDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      //1.设置文本默认样式
      style: TextStyle(
        color:Colors.red,
        fontSize: 20.0,
      ),
      textAlign: TextAlign.start,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Text("DefaultTextStyleDemo —— 0"),
          Text("DefaultTextStyleDemo —— 1"),
          Text("DefaultTextStyleDemo —— 2",
            style: TextStyle(
                inherit: false, //2.不继承默认样式
                color: Colors.grey
            ),
          ),
        ],
      ),
    );
  }
}
class FontDemo extends StatelessWidget {
  const FontDemo({Key? key}) : super(key: key);

  //局部配置，全剧配置参考：https://juejin.cn/post/6844904113168187405
  @override
  Widget build(BuildContext context) {
    return Text("FontDemo" * 6,
                style: TextStyle(fontFamily: 'Din'),
                textScaleFactor: 2.5,
    );
  }
}