import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tony_flutter_test/RiverPodStateNotifier/RiverpodDemo.dart';
import 'package:tony_flutter_test/river_pod_step1.dart';

import 'canvas_test_demo.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class Demo {
  final String title;
  final String routeName;
  final WidgetBuilder buildRoute;

  Demo(this.title, this.routeName, this.buildRoute);
}

Demo canvasDemo = Demo('Canvas Demo', '/canvasTest', (context) => CanvasTestDemo());
Demo riverPodDemo = Demo('RiverPod Step1', '/riverPodStep1', (context) => RiverpodDemo());

var demos = [
  canvasDemo,
  riverPodDemo
];

Map<String, WidgetBuilder> _buildRouterBuilder() {
  return Map<String, WidgetBuilder>.fromIterable(
    demos,
    key: (demo) => demo.routeName,
    value: (demo) => demo.buildRoute,
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: _buildRouterBuilder(),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = demos.map((demo) {
      return ListTile(
        title: Text(demo.title),
        onTap: () {
          print('goto ${demo.routeName}');
//          Navigator.pushNamed(context, demo.routeName);
          Navigator.pushNamed(context, demo.routeName);
        },
      );
    }).toList();

    return Scaffold(
      body: ListView(children: widgets),
    );
  }
}
