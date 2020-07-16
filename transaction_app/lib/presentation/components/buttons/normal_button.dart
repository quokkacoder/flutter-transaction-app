import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NormalButton extends StatelessWidget {
  static const _height = 200;
  static const _width = 40;

  final Function onPressed;
  final String title;

  const NormalButton({@required this.onPressed, @required this.title})
      : assert(title != null && onPressed != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: _height.h,
      height: _width.w,
      child: RaisedButton(
        color: Colors.lightBlue,
        shape: new RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        onPressed: () => onPressed(),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 17.nsp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
