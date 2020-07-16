import 'package:flutter/material.dart';
import 'package:transaction_app/presentation/route/named_route.dart';
import 'package:transaction_app/presentation/themes/simple_styles/colors.dart';
import 'package:transaction_app/presentation/components/components.dart';

class ListTransactionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageContainer(
      title: "List transaction",
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => Navigator.pushNamed(context, NamedRoute.addTrans),
        ),
      ],
      child: ListViewTransaction(),
//      child: NotifyContainer(
//        message: 'Chưa có dữ liệu',
//      ),
    );
  }
}

class ListViewTransaction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 20,
        itemBuilder: (context, index) {
          final color = index % 2 == 0 ? Colors.green : Colors.red;
          return ListTile(
            leading: Icon(
              Icons.monetization_on,
              color: color,
            ),
            title: Text(
              'Mua Macbook Pro',
              style: Theme.of(context)
                  .primaryTextTheme
                  .body2
                  .copyWith(color: textBlack),
            ),
            subtitle: index % 2 == 0
                ? Text(
                    '+200000',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .caption
                        .copyWith(color: color),
                  )
                : Text(
                    '-200000',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .caption
                        .copyWith(color: color),
                  ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            ),
          );
        });
  }
}
