import 'dart:ui' as UI;
import 'package:flutter/material.dart';

class CanvasTestDemo extends StatefulWidget {
  const CanvasTestDemo({Key? key}) : super(key: key);

  @override
  _CanvasTestDemoState createState() => _CanvasTestDemoState();
}

class _CanvasTestDemoState extends State<CanvasTestDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: VerticesPainter(),
      )
    );
  }
}

class VerticesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var vertices = UI.Vertices(
      VertexMode.triangles,
      [Offset.zero, Offset(100, 0), Offset(100, 100)],
    );

    canvas.translate(20, 50);
    canvas.drawVertices(
      vertices,
      BlendMode.srcOver,
      Paint()..color = Colors.red,
    );
    canvas.translate(20, 50);
    canvas.drawVertices(
      vertices,
      BlendMode.srcOver,
      Paint()..color = Colors.green,
    );
    canvas.translate(20, 50);
    canvas.drawVertices(
      vertices,
      BlendMode.srcOver,
      Paint()..color = Colors.blue,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
