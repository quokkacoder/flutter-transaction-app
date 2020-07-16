import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Spaces {
  static Widget hSpaces(double height) {
    return SizedBox(
      height: height.h,
    );
  }

  static Widget vSpaces(double width) {
    return SizedBox(
      width: width.h,
    );
  }
}
