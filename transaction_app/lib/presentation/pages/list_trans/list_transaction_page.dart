import 'package:flutter/material.dart';
import 'package:transaction_app/di_containter.dart';
import 'package:transaction_app/domain/entities/e_transaction.dart';
import 'package:transaction_app/domain/repositories/transaction_repo.dart';
import 'package:transaction_app/presentation/route/named_route.dart';
import 'package:transaction_app/presentation/themes/simple_styles/colors.dart';
import 'package:transaction_app/presentation/components/components.dart';

class ListTransactionPage extends StatefulWidget {
  final List<ETransaction> transactions;

  const ListTransactionPage({@required this.transactions});

  @override
  _ListTransactionPageState createState() => _ListTransactionPageState();
}

class _ListTransactionPageState extends State<ListTransactionPage> {
  final _loadingDialog = LoadingDialog();

  _removeTransaction(ETransaction transaction) {
    _loadingDialog.show(context);
    locator<TransactionRepo>()
      ..removeTransaction(transaction.transId).then((value) {
        _loadingDialog.hide();
        if (value) {
          setState(() {
            widget.transactions.remove(transaction);
          });
        } else {
          NotifyDialog.show(
            context,
            title: 'Lỗi',
            message: 'Đã xảy ra lỗi',
            action: () {},
          );
        }
      }).catchError((e) {
        _loadingDialog.hide();
        NotifyDialog.show(
          context,
          title: 'Lỗi',
          message: e.toString(),
          action: () {},
        );
      });
  }

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      title: "List transaction",
      autoLead: false,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () async {
            final transModel =
                await Navigator.pushNamed(context, NamedRoute.addTrans);
            if (transModel != null) {
              setState(() {
                widget.transactions.insert(0, transModel);
              });
            }
          },
        ),
      ],
      child: widget.transactions.length != 0
          ? _buildListView()
          : NotifyContainer(
              message: 'Chưa có dữ liệu',
            ),
    );
  }

  _buildListView() {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: widget.transactions.length,
        itemBuilder: (context, index) {
          final item = widget.transactions[index];
          final color = item.type == 'Income' ? Colors.green : Colors.red;
          return ListTile(
            leading: Icon(
              Icons.monetization_on,
              color: color,
            ),
            title: Text(
              item.name,
              style: Theme.of(context)
                  .primaryTextTheme
                  .body2
                  .copyWith(color: textBlack),
            ),
            subtitle: item.type == 'Income'
                ? Text(
                    '+${item.money}',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .caption
                        .copyWith(color: color),
                  )
                : Text(
                    '-${item.money}',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .caption
                        .copyWith(color: color),
                  ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _removeTransaction(item),
            ),
          );
        });
  }
}
