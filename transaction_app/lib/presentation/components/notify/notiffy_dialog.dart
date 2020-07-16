import 'package:flutter/material.dart';

class NotifyDialog {
  static void show(
    BuildContext context, {
    @required String title,
    @required String message,
    @required action,
  }) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                title,
                style: Theme.of(context).primaryTextTheme.title,
              ),
              content: Text(
                message,
                style: Theme.of(context).primaryTextTheme.body1,
              ),
              elevation: 5,
              actions: <Widget>[
                FlatButton(
                  color: Colors.blue,
                  child: Text('Thử lại'),
                  onPressed: action,
                ),
                FlatButton(
                  color: Colors.red,
                  child: Text('OK'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ));
  }
}
