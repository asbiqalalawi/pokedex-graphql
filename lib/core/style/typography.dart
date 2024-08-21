import 'package:flutter/material.dart';

class Header {
  static const _header = TextStyle(fontWeight: FontWeight.w700);
  static final headline = _header.copyWith(fontSize: 24);
  static final subtitle3 = _header.copyWith(fontSize: 10);
  static final subtitle2 = _header.copyWith(fontSize: 12);
  static final subtitle1 = _header.copyWith(fontSize: 14);
}

class Body {
  static const _body = TextStyle(fontWeight: FontWeight.w400);
  static final body3 = _body.copyWith(fontSize: 10);
  static final body2 = _body.copyWith(fontSize: 12);
  static final body1 = _body.copyWith(fontSize: 14);
  static final caption = _body.copyWith(fontSize: 8);
}