// ignore_for_file: prefer_const_constructors, prefer_collection_literals, deprecated_member_use

import 'package:flutter/material.dart';
import 'main.dart';

class ButtonRoute extends StatelessWidget {
  const ButtonRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final todo = ModalRoute.of(context)!.settings.arguments as Todo;

    if (todo.title == 'ElevatedButton') {
      return Scaffold(
        appBar: AppBar(
          title: Text(todo.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: const ElevatedButtonDemo(),
        ),
      );
    }
    else if (todo.title == 'TextButton') {
      return Scaffold(
        appBar: AppBar(
          title: Text(todo.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: const TextButtonDemo(),
        ),
      );
    }
    else if (todo.title == 'OutlinedButton') {
      return Scaffold(
        appBar: AppBar(
          title: Text(todo.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: const OutlinedButtonDemo(),
        ),
      );
    }
    else if (todo.title == 'IconButton') {
      return Scaffold(
        appBar: AppBar(
          title: Text(todo.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: const IconButtonDemo(),
        ),
      );
    }
    else if (todo.title == '带图标的按钮') {
      return Scaffold(
        appBar: AppBar(
          title: Text(todo.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: const LabelWithButtonDemo(),
        ),
      );
    }
    else if (todo.title == 'PopupMenuButton') {
      return Scaffold(
        appBar: AppBar(
          title: Text(todo.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: const PopupMenuButtonDemo(),
        ),
      );
    }
    else if (todo.title == 'DropdownButton') {
      return Scaffold(
        appBar: AppBar(
          title: Text(todo.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: const DropdownButtonDemo(),
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

class ElevatedButtonDemo extends StatelessWidget {
  const ElevatedButtonDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text("ElevatedButton"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
class TextButtonDemo extends StatelessWidget {
  const TextButtonDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text("TextButton"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
class OutlinedButtonDemo extends StatelessWidget {
  const OutlinedButtonDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return OutlinedButton(
      child: Text("OutlineButtonDemo"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
class IconButtonDemo extends StatelessWidget {
  const IconButtonDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_circle_left_sharp),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
class LabelWithButtonDemo extends StatelessWidget {
  const LabelWithButtonDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        ElevatedButton.icon(
          icon: Icon(Icons.send),
          label: Text("发送"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton.icon(
          icon: Icon(Icons.info),
          label: Text("详情"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        OutlinedButton.icon(
          icon: Icon(Icons.add),
          label: Text("添加"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
class PopupMenuButtonDemo extends StatelessWidget {
  const PopupMenuButtonDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      initialValue: '语文',//设置其初始值：
      tooltip: 'PopupMenuButton',//长按时弹出的提示
      elevation: 5,
      padding: EdgeInsets.all(5),
      color: Colors.white,
      onSelected: (value){
        print('$value');
      },
      onCanceled: (){
        print('onCanceled');
      },
        shape: RoundedRectangleBorder(
            side: BorderSide(
                color: Colors.red
            ),
            borderRadius: BorderRadius.circular(10)
        ),
      itemBuilder: (context) {
        return <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            value: '语文',
            child: Text('语文'),
          ),
          PopupMenuItem<String>(
            value: '数学',
            child: Text('数学'),
          ),
          PopupMenuItem<String>(
            value: '英语',
            child: Text('英语'),
          ),
          PopupMenuItem<String>(
            value: '生物',
            child: Text('生物'),
          ),
          PopupMenuItem<String>(
            value: '化学',
            child: Text('化学'),
          ),
        ];
      },
      child: Text('学科 >'),
    );
  }
}
class DropdownButtonDemo extends StatelessWidget {
  const DropdownButtonDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      hint: Text('请选择'),
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      iconDisabledColor: Colors.red,
      iconEnabledColor: Colors.red,
      //样式系统
      items: const [
        DropdownMenuItem(value: '语文',child: Text('语文'),),
        DropdownMenuItem(value: '数学', child: Text('数学')),
        DropdownMenuItem(value: '英语', child: Text('英语')),
      ],
      onChanged: (value){

      },
    );
  }
}