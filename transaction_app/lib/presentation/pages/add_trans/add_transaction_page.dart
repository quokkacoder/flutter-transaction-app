import 'package:flutter/material.dart';
import 'package:transaction_app/presentation/components//components.dart';
import 'package:transaction_app/presentation/components/buttons/normal_button.dart';
import 'package:transaction_app/shareds/spaces.dart';

class AddTransactionPage extends StatelessWidget {
  final _loadingDialog = LoadingDialog();

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      title: "Add Transaction",
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.edit),
                border: OutlineInputBorder(),
                labelText: 'Transaction name',
              ),
            ),
            Spaces.hSpaces(15),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.monetization_on),
                border: OutlineInputBorder(),
                labelText: 'Money',
              ),
            ),
            Spaces.hSpaces(15),
            //MoneyType(addTransactionStore),
            NormalButton(
              title: 'Submit',
              onPressed: () {
                //_loadingDialog.show(context);
                NotifyDialog.show(
                  context,
                  title: 'Lỗi',
                  message: 'Đã xảy ra lỗi',
                  action: () {},
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
