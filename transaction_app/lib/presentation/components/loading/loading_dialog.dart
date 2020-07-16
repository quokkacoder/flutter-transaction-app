import 'package:flutter/material.dart';
import 'package:transaction_app/presentation/components/components.dart';

class LoadingDialog {
  BuildContext _contextDialog;

  void show(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          _contextDialog = context;
          return LoadingContainer();
        });
  }

  void hide() {
    if (_contextDialog != null) {
      Navigator.of(_contextDialog).pop(true);
    }
  }
}
