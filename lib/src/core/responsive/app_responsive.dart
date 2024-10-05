import 'package:flutter/material.dart';

extension MediaQueryHelper on BuildContext {
  static const defaultWidth = 375;
  static const defaultHeight = 850;
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  bool isSmallDevice() {
    return (MediaQuery.of(this).size.height < 680) ? true : false;
  }

  double spaceBetweenTopBarWithBody() {
    if (isSmallDevice()) {
      return 50;
    } else {
      return 90;
    }
  }

  double sizeWidth(double value) => width * value / defaultWidth;

  double sizeHeight(double value) => height * value / defaultHeight;

  double sizeHeightSmall(double value) => isSmallDevice()
      ? height * value / defaultHeight + 20
      : height * value / defaultHeight;

  double sizeWidthFull() => 0.8 * width - 20;

  double sizeOf(double value) => width * value / defaultWidth;

  SizedBox sizedBox({double? width, double? height}) {
    if (width != null && height != null) {
      return SizedBox(
          width: sizeOf(width),
          height: isSmallDevice() ? height - (height * 0.2) : height);
    } else if (width != null) {
      return SizedBox(width: sizeOf(width));
    } else {
      return SizedBox(
          height: sizeOf(isSmallDevice() ? height! - (height * 0.2) : height!));
    }
  }

  EdgeInsets padding({
    double? horizontal,
    double? vertical,
    double? top,
    double? left,
    double? right,
    double? bottom,
    double? all,
  }) {
    EdgeInsets data = EdgeInsets.zero;
    if (horizontal != null) {
      data = data.copyWith(
          left: sizeOf(
            isSmallDevice() ? horizontal - 5 : horizontal,
          ),
          right: sizeOf(
            isSmallDevice() ? horizontal - 5 : horizontal,
          ));
    }
    if (vertical != null) {
      data = data.copyWith(
          top: sizeOf(
            isSmallDevice() ? vertical - 5 : vertical,
          ),
          bottom: sizeOf(
            isSmallDevice() ? vertical - 5 : vertical,
          ));
      // data = data.copyWith(top: sizeOf(vertical), bottom: sizeOf(vertical));
    }

    if (top != null) {
      data = data.copyWith(
        top: sizeOf(top),
      );
    }
    if (right != null) {
      data = data.copyWith(
        right: sizeOf(right),
      );
    }
    if (bottom != null) {
      data = data.copyWith(
        bottom: sizeOf(bottom),
      );
    }
    if (left != null) {
      data = data.copyWith(
        left: sizeOf(left),
      );
    }
    if (all != null) {
      data = data.copyWith(
        left: sizeOf(all),
        top: sizeOf(all),
        right: sizeOf(all),
        bottom: sizeOf(all),
      );
    }
    return data;
  }
}
