import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 50.nsp,
        width: 50.nsp,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
