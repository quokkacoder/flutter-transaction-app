import 'package:flutter/material.dart';
import 'package:transaction_app/app.dart';
import 'package:transaction_app/main.dart';
import 'package:transaction_app/presentation/pages/add_trans/add_transaction_page.dart';
import 'package:transaction_app/presentation/pages/list_trans/list_transaction_page.dart';
import 'package:transaction_app/presentation/pages/splash/splash_page.dart';
import 'package:transaction_app/presentation/route/named_route.dart';
import 'package:transaction_app/presentation/components/components.dart';

RouteFactory routes() {
  return (RouteSettings settings) {
    final args = settings.arguments as Map<String, dynamic>;
    Widget screen;

    switch (settings.name) {
      case NamedRoute.root:
        screen = MyApp();
        break;
      case NamedRoute.splash:
        screen = SplashPage();
        break;
      case NamedRoute.listTrans:
        screen = ListTransactionPage();
        break;
      case NamedRoute.addTrans:
        screen = AddTransactionPage();
        break;
      default:
        screen = NotFoundPage(
          name: settings.name,
        );
    }

    return MaterialPageRoute(builder: (context) => screen);
  };
}

class NotFoundPage extends StatelessWidget {
  final String name;

  const NotFoundPage({@required this.name}) : assert(name != null);

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      title: 'NOT FOUNDED PAGE',
      child: Center(
        child: Text('Sorry not founded page: $name'),
      ),
    );
  }
}
