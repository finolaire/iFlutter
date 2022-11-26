// ignore_for_file: prefer_const_constructors, prefer_collection_literals, deprecated_member_use

import 'package:flutter/material.dart';
import 'text_vc.dart';
import 'button_vc.dart';
import 'image_vc.dart';
import 'selector_vc.dart';
import 'progress_vc.dart';
import 'textField_vc.dart';
// import 'route_model.dart';
// import 'dart:math';

class Todo {
  final String title;
  final String description;

  const Todo(this.title, this.description);
}

void main() {

  //runApp(MyApp());

  var titleList = [];
  var typeList = [];

  const textList = ['文本及样式 >', 'Text', 'TextStyle', 'TextSpan', 'DefaultTextStyle', 'FontDemo'];
  titleList.addAll(textList);
  for (var element in titleList) {
    typeList.add('text');
  }

  const buttonList = ['按钮 >', 'ElevatedButton', 'TextButton', 'OutlinedButton', 'IconButton', '带图标的按钮', 'PopupMenuButton', 'DropdownButton'];
  titleList.addAll(buttonList);
  for (var element in buttonList) {
    typeList.add('button');
  }

  const imageList = ['图片及ICON >', '图片', 'ICON'];
  titleList.addAll(imageList);
  for (var element in imageList) {
    typeList.add('image');
  }

  const selectorList = ['单选开关和复选框 >', 'Switch', 'Checkbox'];
  titleList.addAll(selectorList);
  for (var element in selectorList) {
    typeList.add('selector');
  }

  const textFieldList = ['输入框及表单 >', 'TextField', 'Form'];
  titleList.addAll(textFieldList);
  for (var element in textFieldList) {
    typeList.add('textField');
  }

  const progressList = ['进度指示器 >', 'LinearProgressIndicator', 'CircularProgressIndicator', '进度色动画', '第三方进度指示器'];
  titleList.addAll(progressList);
  for (var element in progressList) {
    typeList.add('progress');
  }

  runApp(
    MaterialApp(
      title: 'Passing Data',
      home: TodosScreen(
        todos: List.generate(
          // (i) => Todo('第 $i 行', 'description $i',),
          titleList.length,
          (i) {
            String title = titleList[i];
            String type = typeList[i];
            return Todo(title, type,);
          },
        ),
      ),
    ),
  );
}

class TodosScreen extends StatelessWidget {
  const TodosScreen({super.key, required this.todos});

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {

          final title = todos[index].title;
          final type = todos[index].description;

          return ListTile(
            title: Text(todos[index].title),

            onTap: () {

              if (type == 'text') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TextRoute(),
                    settings: RouteSettings(
                      arguments: todos[index],
                    ),
                  ),
                );
              }
              else if (type == 'button') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ButtonRoute(),
                    settings: RouteSettings(
                      arguments: todos[index],
                    ),
                  ),
                );
              }
              else if (type == 'image') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ImageRoute(),
                    settings: RouteSettings(
                      arguments: todos[index],
                    ),
                  ),
                );
              }
              else if (type == 'selector') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SelectorRoute(),
                    settings: RouteSettings(
                      arguments: todos[index],
                    ),
                  ),
                );
              }
              else if (type == 'textField') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TextFieldRoute(),
                    settings: RouteSettings(
                      arguments: todos[index],
                    ),
                  ),
                );
              }
              else if (type == 'progress') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProgressRoute(),
                    settings: RouteSettings(
                      arguments: todos[index],
                    ),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}

//暂时不用
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('列表'),
        ),
        body: const HomeContent(),

      ),
      theme: ThemeData(//主题色
        primarySwatch: Colors.green,
      ),
    );
  }
}
class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const titleList = ['文本及样式', 'Text', 'TextStyle', 'TextSpan', 'DefaultTextStyle','TextSpan', '按钮', '图片及ICON'];

    // var vc = stat

    return ListView.separated(
      itemCount: titleList.length,
      //列表项构造器
      itemBuilder: (BuildContext context, int index) {

        String title = titleList[index];

        return ListTile(
          title: Text(title),
          onTap: () {
            print('点击:$index');

            switch(index) {
              case 0:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TextRoute()),
                );
                break;
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ButtonRoute()),
                );
                break;
              default:
                break;
            }
          },
        );
      },

      //分割器构造器
      separatorBuilder: (BuildContext context, int index) {
        return Divider(color: Colors.grey.shade300);
      },
    );
  }
}