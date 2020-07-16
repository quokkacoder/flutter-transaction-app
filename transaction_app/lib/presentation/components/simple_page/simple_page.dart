import 'package:flutter/material.dart';
import 'package:transaction_app/presentation/themes/simple_styles/colors.dart';

class PageContainer extends StatelessWidget {
  final String title;
  final Widget child;
  final List<Widget> actions;

  PageContainer({
    this.title,
    this.child,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: Theme.of(context)
              .primaryTextTheme
              .title
              .copyWith(color: textWhite),
        ),
        actions: actions,
      ),
      body: child,
    );
  }
}
