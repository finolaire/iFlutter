import 'package:flutter/material.dart';
import 'main.dart';

class TextFieldRoute extends StatelessWidget {
  const TextFieldRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final todo = ModalRoute.of(context)!.settings.arguments as Todo;

    if (todo.title == 'TextField') {//Form
      return Scaffold(
        appBar: AppBar(
          title: Text(todo.title),
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: aaDemo(),
        ),
      );
    }
    else if (todo.title == 'CircularProgressIndicator') {
      return Scaffold(
        appBar: AppBar(
          title: Text(todo.title),
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: aaDemo(),
        ),
      );
    }
    else {
      return Scaffold(
        appBar: AppBar(
          title: Text(todo.title),
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
        ),
      );
    }
  }
}

class aaDemo extends StatelessWidget {
  const aaDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var img = AssetImage("images/square.png");

    return Column(
      children: const <Widget>[
        TextField(
          textAlign: TextAlign.start,
          autofocus: true,
          decoration: InputDecoration(
              labelText: "用户名",
              hintText: "用户名或邮箱",
              prefixIcon: Icon(Icons.person),

          ),

        ),
        TextField(
          decoration: InputDecoration(
              labelText: "密码",
              hintText: "您的登录密码",
              prefixIcon: Icon(Icons.lock)
          ),
          obscureText: true,
        ),
      ],
    );

    // return SingleChildScrollView(
    //   child: Column(
    //       children: <Image>[
    //         Image(
    //           image: img,
    //           height: 50.0,
    //           width: 100.0,
    //           fit: BoxFit.fill,
    //         ),
    //         Image(
    //           image: img,
    //           height: 50,
    //           width: 50.0,
    //           fit: BoxFit.contain,
    //         ),
    //         Image(
    //           image: img,
    //           width: 100.0,
    //           height: 50.0,
    //           fit: BoxFit.cover,
    //         ),
    //         Image(
    //           image: img,
    //           width: 100.0,
    //           height: 50.0,
    //           fit: BoxFit.fitWidth,
    //         ),
    //         Image(
    //           image: img,
    //           width: 100.0,
    //           height: 50.0,
    //           fit: BoxFit.fitHeight,
    //         ),
    //         Image(
    //           image: img,
    //           height: 50.0,
    //           width: 100.0,
    //           fit: BoxFit.none,
    //         ),
    //         Image(
    //           image: img,
    //           width: 100.0,
    //           height: 50.0,
    //           fit: BoxFit.scaleDown,
    //         ),
    //         Image(
    //           image: img,
    //           width: 100.0,
    //           color: Colors.blue,
    //           colorBlendMode: BlendMode.difference,
    //           fit: BoxFit.fill,
    //         ),
    //         Image(
    //           image: img,
    //           width: 100.0,
    //           height: 200.0,
    //           repeat: ImageRepeat.repeat,
    //         )
    //       ].map((e) {
    //         return Row(
    //           children: <Widget>[
    //             Padding(
    //               padding: EdgeInsets.all(16.0),
    //               child: SizedBox(
    //                 width: 100,
    //                 child: e,
    //               ),
    //             ),
    //             Text(e.fit.toString())
    //           ],
    //         );
    //       }).toList()
    //   ),
    // );
  }
}