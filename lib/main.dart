import 'package:flutter/material.dart';

import 'canvas_test_demo.dart';

void main() {
  runApp(MyApp());
}

class Demo {
  final String title;
  final String routeName;
  final WidgetBuilder buildRoute;

  Demo(this.title, this.routeName, this.buildRoute);
}

Demo canvasDemo = Demo('Canvas Demo', '/canvasTest', (context) => CanvasTestDemo());

var demos = [canvasDemo];

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
