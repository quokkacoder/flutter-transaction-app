import 'package:flutter/material.dart';

class NotifyContainer extends StatelessWidget {
  final String message;

  const NotifyContainer({@required this.message}) : assert(message != null);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: Theme.of(context).primaryTextTheme.body1,
      ),
    );
  }
}
