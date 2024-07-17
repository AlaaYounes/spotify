import 'package:flutter/material.dart';

extension MediaQueryHelper on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;

  double get screenWidth => MediaQuery.of(this).size.width;

  double h(double percentage) {
    var h = percentage / 844;
    return MediaQuery.of(this).size.height * h;
  }

  double w(double percentage) {
    var w = percentage / 390;
    return MediaQuery.of(this).size.width * w;
  }

  EdgeInsets get safeAreaPadding => MediaQuery.of(this).padding;
}

extension Spacing on num {
  SizedBox get sizedBoxHeight => SizedBox(
        height: toDouble(),
      );

  SizedBox get sizedBoxWidth => SizedBox(
        width: toDouble(),
      );
}
