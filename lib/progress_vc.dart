import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'main.dart';

class ProgressRoute extends StatelessWidget {
  const ProgressRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final todo = ModalRoute.of(context)!.settings.arguments as Todo;

    if (todo.title == 'LinearProgressIndicator') {
      return Scaffold(
        appBar: AppBar(
          title: Text(todo.title),
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: LinearProgressIndicatorDemo(),
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
          child: CircularProgressIndicatorDemo(),
        ),
      );
    }
    else if (todo.title == '进度色动画') {
      return Scaffold(
        appBar: AppBar(
          title: Text(todo.title),
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: ProgressAnimationDemo(),
        ),
      );
    }
    else if (todo.title == '第三方进度指示器') {
      return Scaffold(
        appBar: AppBar(
          title: Text(todo.title),
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: CustomProgressDemo(),
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

class LinearProgressIndicatorDemo extends StatelessWidget {
  const LinearProgressIndicatorDemo({Key? key}) : super(key: key);

  //LinearProgressIndicator 是一个线性、条状的进度条，定义如下：线性、条状的进度条

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(

      child: Column(

          children:<Widget> [//
            Wrap(
               //水平间距
               spacing: 0.0,
               //垂直间距
               runSpacing: 50.0,

               children: <Widget>[
                 // 模糊进度条(会执行一个动画)
                 LinearProgressIndicator(
                   backgroundColor: Colors.grey[200],
                   valueColor: const AlwaysStoppedAnimation(Colors.blue),
                 ),

                 //进度条显示50%
                 LinearProgressIndicator(
                   backgroundColor: Colors.grey[200],//指示器的背景色。
                   valueColor: const AlwaysStoppedAnimation(Colors.blue),//指示器的进度条颜色；值得注意的是，该值类型是Animation<Color>，这允许我们对进度条的颜色也可以指定动画。如果我们不需要对进度条颜色执行动画，换言之，我们想对进度条应用一种固定的颜色，此时我们可以通过AlwaysStoppedAnimation来指定。
                   value: .5,//value表示当前的进度，取值范围为[0,1]；如果value为null时则指示器会执行一个循环动画（模糊进度）；当value不为null时，指示器为一个具体进度的进度条。
                 ),


                 // 自定义尺寸：线性进度条高度指定为 20
                 SizedBox(
                   height: 20,
                   child: LinearProgressIndicator(
                     backgroundColor: Colors.grey[200],
                     valueColor: const AlwaysStoppedAnimation(Colors.blue),
                     value: .5,
                   ),
                 ),

              ]
            )
          ]
      ),
    );
  }
}
class CircularProgressIndicatorDemo extends StatelessWidget {
  const CircularProgressIndicatorDemo({Key? key}) : super(key: key);

  //CircularProgressIndicator是一个圆形进度条

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(

      child: Column(

          children:<Widget> [//
            Wrap(
              //水平间距
                spacing: 50.0,
                //垂直间距
                runSpacing: 0.0,

                children: <Widget>[
                  // 模糊进度条(会执行一个旋转动画)
                  CircularProgressIndicator(
                    backgroundColor: Colors.grey[200],
                    valueColor: const AlwaysStoppedAnimation(Colors.blue),
                  ),

                  //进度条显示50%，会显示一个半圆
                  CircularProgressIndicator(
                    backgroundColor: Colors.grey[200],
                    valueColor: const AlwaysStoppedAnimation(Colors.blue),
                    value: .5,
                  ),

                  // 自定义尺寸：圆形进度条直径指定为100
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.grey[200],
                      valueColor: const AlwaysStoppedAnimation(Colors.blue),
                      value: .7,
                    ),
                  ),

                  //如果CircularProgressIndicator显示空间的宽高不同，则会显示为椭圆
                  // 宽高不等
                  SizedBox(
                    height: 100,
                    width: 130,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.grey[200],
                      valueColor: const AlwaysStoppedAnimation(Colors.blue),
                      value: .7,
                    ),
                  ),
                ]
            )
          ]
      ),
    );
  }
}

class ProgressAnimationDemo extends StatefulWidget {
  const ProgressAnimationDemo({super.key});

  @override
  ProgressAnimationStateFul createState() => ProgressAnimationStateFul();
}
class ProgressAnimationStateFul extends State<ProgressAnimationDemo>
    with SingleTickerProviderStateMixin {

  AnimationController? _animationController;

  @override
  void initState() {
    //动画执行时间3秒
    _animationController = AnimationController(
      vsync: this, //注意State类需要混入SingleTickerProviderStateMixin（提供动画帧计时/触发器）
      duration: const Duration(seconds: 3),
    );
    _animationController?.forward();
    _animationController?.addListener(() => setState(() => {}));
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16),
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: ColorTween(begin: Colors.red, end: Colors.yellow)
                  .animate(_animationController!), // 从红色变成绿色
              value: _animationController?.value,
            ),
          )
        ],
      ),
    );
  }
}

class CustomProgressDemo extends StatefulWidget {
  const CustomProgressDemo({super.key});

  @override
  CustomProgressStateFul createState() => CustomProgressStateFul();
}

class CustomProgressStateFul extends State<CustomProgressDemo> {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   home: Scaffold(
    //       backgroundColor: Colors.grey[800],
    //       body: const Center(
    //         child: SpinKitWave(color: Colors.white, type: SpinKitWaveType.start),
    //       )),
    // );

    return SingleChildScrollView(

      child: Column(

          children:<Widget> [//
            Wrap(
              //水平间距
                spacing: 0.0,
                //垂直间距
                runSpacing: 50.0,

                children: const <Widget>[

                  //进度条显示50%，会显示一个半圆
                  SpinKitWave(
                      color: Colors.purple,
                      type: SpinKitWaveType.start
                  ),
                  SpinKitRotatingCircle(
                    color: Colors.grey,
                  ),
                  SpinKitRotatingPlain(
                      color: Colors.black,
                  ),
                  SpinKitChasingDots(
                    color: Colors.brown,
                  ),
                  SpinKitPumpingHeart(
                    color: Colors.red,
                  ),
                  SpinKitPulse(
                    color: Colors.orange,
                  ),
                  SpinKitDoubleBounce(
                    color: Colors.yellow,
                  ),
                  SpinKitThreeBounce(
                    color: Colors.green,
                  ),
                  SpinKitWanderingCubes(
                    color: Colors.blue,
                  ),
                  SpinKitCircle(
                    color: Colors.purple,
                  ),
                  SpinKitFadingFour(
                    color: Colors.grey,
                  ),
                  SpinKitCubeGrid(
                    color: Colors.black,
                  ),
                  SpinKitFoldingCube(
                    color: Colors.brown,
                  ),
                  SpinKitRing(
                    color: Colors.red,
                  ),
                  SpinKitDualRing(
                    color: Colors.orange,
                  ),
                  SpinKitRipple(
                    color: Colors.yellow,
                  ),
                  SpinKitFadingGrid(
                    color: Colors.green,
                  ),
                  SpinKitHourGlass(
                    color: Colors.blue,
                  ),
                  SpinKitSpinningCircle(
                    color: Colors.purple,
                  ),
                  SpinKitFadingCircle(
                    color: Colors.grey,
                  ),
                  SpinKitRotatingCircle(
                    color: Colors.black,
                  ),
                ]
            )
          ]
      ),

    );
  }
}

// SpinKitHourGlass(color: Colors.white)
// SpinKitSpinningCircle(color: Colors.white)
// SpinKitSpinningCircle(color: Colors.white, shape: BoxShape.rectangle)
// SpinKitFadingCircle(color: Colors.white)
// SpinKitPouringHourglass(color: Colors.white)

