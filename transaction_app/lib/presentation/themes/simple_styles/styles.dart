import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transaction_app/presentation/themes/simple_styles/colors.dart';

const double fzHead = 26;
const double fzTitle = 24;
const double fzSubHead = 22;
const double fzSubTitle = 20;
const double fzButton = 18;
const double fzBody1 = 18;
const double fzBody2 = 16;
const double fzCaption = 14;

class AppTextTheme {
  static final textPrimary = TextTheme(
    headline: TextStyle(
      fontSize: fzHead.nsp,
    ),
    subhead: TextStyle(
      fontSize: fzSubHead.nsp,
    ),
    title: TextStyle(
      fontSize: fzTitle.nsp,
      color: textBlack
    ),
    subtitle: TextStyle(
      fontSize: fzSubHead.nsp,
    ),
    button: TextStyle(
      fontSize: fzButton.nsp,
    ),
    body1: TextStyle(
      fontSize: fzBody1.nsp,
      color: textBlack
    ),
    body2: TextStyle(
      fontSize: fzBody2.nsp,
    ),
    caption: TextStyle(
      fontSize: fzCaption.nsp,
    ),
  );
}
