import 'dart:ui';

import 'package:flutter/cupertino.dart';

abstract class AppDecorations {
  static var greyBoxDecoration = ShapeDecoration(
    color: const Color(0x7FF2F3F3),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  );
}
