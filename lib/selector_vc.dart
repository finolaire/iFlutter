// ignore_for_file: prefer_const_constructors, prefer_collection_literals, deprecated_member_use
import 'dart:math';
import 'package:flutter/material.dart';
import 'main.dart';

class SelectorRoute extends StatelessWidget {
  const SelectorRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final todo = ModalRoute.of(context)!.settings.arguments as Todo;

    if (todo.title == 'Switch') {
      return Scaffold(
        appBar: AppBar(
          title: Text(todo.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SwitchDemo(),
        ),
      );
    }
    else if (todo.title == 'Checkbox') {
      return Scaffold(
        appBar: AppBar(
          title: Text(todo.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: const CheckboxDemo(),
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

class SwitchDemo extends StatefulWidget {
  const SwitchDemo({super.key});

  @override
  SwitchStateFul createState() => SwitchStateFul();
}
class SwitchStateFul extends State<SwitchDemo> {

  bool colorSwitchSelected = true;
  bool imageSwitchSelected = false;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Switch(
          activeColor: Colors.blue,//代表打开时圆圈的颜色。
          activeTrackColor: Colors.green,//代表打开时滑槽的颜色。
          inactiveThumbColor: Colors.orange,//代表关闭时圆圈的颜色。
          inactiveTrackColor: Colors.pinkAccent,//代表关闭时滑槽的颜色。

          //hoverColor 和 mouseCursor 两个属性一般只能在桌面或 web 端起作用
          //splashRadius 表示大圈的半径，如果不想要外圈的悬浮效果，可以将半径设为 0
          //mouseCursor 代表鼠标的样式，小拳头是 SystemMouseCursors.grabbing
          hoverColor: Colors.blue.withOpacity(0.2),//当鼠标悬浮时，外层的大圈颜色
          mouseCursor: SystemMouseCursors.grabbing,

          value: colorSwitchSelected,//当前状态
          onChanged:(value){
            //重新构建页面
            setState(() {
              colorSwitchSelected=value;
            });
          },
        ),
        Switch(

          //onActiveThumbImageError 和 onInactiveThumbImageError 两个回调用于图片加载错误的监听。
          activeThumbImage: AssetImage("images/square.png"),//指定小圆中开启时的图片。
          inactiveThumbImage: AssetImage("images/square.png"),//指定小圆中关闭时的图片

          value: imageSwitchSelected,//当前状态
          onChanged:(value){
            //重新构建页面
            setState(() {
              imageSwitchSelected=value;
            });
          },
        )
      ],
    );
  }
}

class CheckboxDemo extends StatefulWidget {
  const CheckboxDemo({super.key});

  @override
  CheckboxStateFul createState() => CheckboxStateFul();
}
class CheckboxStateFul extends State<CheckboxDemo> {

  bool checkboxSelected=true;//维护复选框状态

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Checkbox(
          value: checkboxSelected,
          activeColor: Colors.red, //选中时的颜色
          onChanged:(value){
            setState(() {
              checkboxSelected=value!;
            });
          },
        )
      ],
    );
  }
}