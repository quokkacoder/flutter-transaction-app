import 'package:flutter/material.dart';
import 'package:transaction_app/presentation/route/named_route.dart';
import 'package:transaction_app/presentation/route/route.dart';
import 'package:transaction_app/presentation/themes/themes.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.defaultTheme,
      onGenerateRoute: routes(),
      initialRoute: NamedRoute.listTrans,
    );
  }
}
