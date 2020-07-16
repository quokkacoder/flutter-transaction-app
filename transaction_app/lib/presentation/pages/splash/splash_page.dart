import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Transaction Application',
          style: Theme.of(context).primaryTextTheme.title,
        ),
      ),
    );
  }
}
