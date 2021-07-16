import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vector_math/vector_math.dart';

import 'dart:math';
import 'package:tony_flutter_test/main.dart';

void main() {

  test('glsl getter setter test', () {
    Vector3 x = new Vector3.zero(); // Zero vector
    print(x);
    Vector4 y = new Vector4.all(4.0); // Vector with 4.0 in all lanes
    x.zyx = y.xzz; // Sets z,y,x the values in x,z,z
    print(x);
  });

  test('transforming a vector', () {
    // Rotation of PI/2 degrees around the Y axis followed by a
    // translation of (5.0, 2.0, 3.0).
    // Matrix4 T = new Matrix4.rotationY(pi * 0.5)..translate(5.0, 2.0, 3.0);
    // A point.
    // Vector3 position = new Vector3(1.0, 1.0, 1.0);
    // Transform position by T.
    // T.transform3(position);
  });

  test('math quaternion test', () {
// The X axis.
    Vector3 axis = new Vector3(1.0, 0.0, 0.0);
// 90 degrees.
    double angle = pi;
// Quaternion encoding a 90 degree rotation along the X axis.
    Quaternion q = new Quaternion.axisAngle(axis, angle);
// A point.
    Vector3 point = new Vector3(1.0, 1.0, 1.0);
// Rotate point by q.
    q.rotate(point);

    print(point);
  });




}

