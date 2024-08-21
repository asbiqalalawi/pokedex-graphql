import 'package:flutter/material.dart';

class InnerShadow {
  static var dp2 = [
    BoxShadow(
      blurStyle: BlurStyle.inner,
      offset: const Offset(0, 1),
      blurRadius: 3,
      spreadRadius: 1,
      color: Colors.black.withOpacity(0.25),
    ),
  ];
}

class DropShadow {
  static var dp2 = [
    BoxShadow(
      offset: const Offset(0, 1),
      blurRadius: 3,
      spreadRadius: 1,
      color: Colors.black.withOpacity(0.2),
    ),
  ];
  static var dp6 = [
    BoxShadow(
      offset: const Offset(0, 3),
      blurRadius: 12,
      spreadRadius: 3,
      color: Colors.black.withOpacity(0.2),
    ),
  ];
}