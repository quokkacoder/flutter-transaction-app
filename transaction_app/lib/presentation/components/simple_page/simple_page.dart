import 'package:flutter/material.dart';
import 'package:transaction_app/presentation/themes/simple_styles/colors.dart';

class PageContainer extends StatelessWidget {
  final String title;
  final Widget child;
  final bool autoLead;
  final List<Widget> actions;

  PageContainer({
    @required this.title,
    this.autoLead = true,
    @required this.child,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: autoLead,
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
