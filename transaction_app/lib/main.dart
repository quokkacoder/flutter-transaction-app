import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transaction_app/app.dart';
import 'package:transaction_app/di_containter.dart';

void main() {
  ScreenUtil.init(width: 480, height: 800, allowFontScaling: false);
  setUpLocator();
  runApp(MyApp());
}
