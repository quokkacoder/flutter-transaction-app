import 'package:flutter/material.dart';
import 'package:transaction_app/presentation/components/components.dart';

class AppFailedPage extends StatelessWidget {
  final String mess;

  AppFailedPage({@required this.mess});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotifyContainer(
        message: "Đã xảy ra lỗi: $mess",
      ),
    );
  }
}
