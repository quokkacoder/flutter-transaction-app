import 'package:flutter/material.dart';
import 'package:transaction_app/data/models/m_transaction.dart';
import 'package:transaction_app/di_containter.dart';
import 'package:transaction_app/domain/repositories/transaction_repo.dart';
import 'package:transaction_app/presentation/components//components.dart';
import 'package:transaction_app/presentation/components/buttons/normal_button.dart';
import 'package:transaction_app/presentation/components/spaces/spaces.dart';

class AddTransactionPage extends StatefulWidget {
  @override
  _AddTransactionPageState createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  String dropdownValue = 'Income';

  final _formKey = GlobalKey<FormState>();
  final _loadingDialog = LoadingDialog();
  final _inputTranNameController = TextEditingController();
  final _inputMoneyController = TextEditingController();

  _saveTransaction(BuildContext context, MTransaction transaction) {
    if (_formKey.currentState.validate()) {
      _loadingDialog.show(context);
      locator<TransactionRepo>()
        ..addTransaction(transaction).then((value) {
          _loadingDialog.hide();
          value.fold(
              (failure) => NotifyDialog.show(
                    context,
                    title: 'Lỗi',
                    message: failure.message,
                    action: () {},
                  ), (result) {
//          result ? print(result.toString()) : print("not true");
            result
                ? Navigator.pop(context, transaction)
                : NotifyDialog.show(
                    context,
                    title: 'Lỗi',
                    message: 'Đã xảy ra lỗi',
                    action: () {},
                  );
          });
        }).catchError((err) {
          _loadingDialog.hide();
          NotifyDialog.show(
            context,
            title: 'Lỗi',
            message: err.toString(),
            action: () {},
          );
        });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _inputMoneyController.dispose();
    _inputTranNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      title: "Add Transaction",
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _inputTranNameController,
                validator: (text) => text.isEmpty ? 'Trường bắt buộc' : null,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.edit),
                  border: OutlineInputBorder(),
                  labelText: 'Transaction name',
                ),
              ),
              Spaces.hSpaces(15),
              TextFormField(
                controller: _inputMoneyController,
                keyboardType: TextInputType.number,
                validator: (text) => text.isEmpty ? 'Trường bắt buộc' : null,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.monetization_on),
                  border: OutlineInputBorder(),
                  labelText: 'Money',
                ),
              ),
              Spaces.hSpaces(15),
              _buildDropDown(),
              NormalButton(
                title: 'Submit',
                onPressed: () => _saveTransaction(
                    context,
                    MTransaction(
                        name: _inputTranNameController.text.trim(),
                        money: int.parse(_inputMoneyController.text.trim()),
                        type: dropdownValue)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildDropDown() {
    return Align(
      alignment: Alignment.centerLeft,
      child: DropdownButton<String>(
        isExpanded: true,
        value: dropdownValue,
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: Colors.blue,
        ),
        iconSize: 24,
        elevation: 16,
        underline: Container(
          height: 2,
          color: Colors.blue,
        ),
        style: Theme.of(context)
            .primaryTextTheme
            .caption
            .copyWith(color: Colors.blue),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>['Income', 'Outcome']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Container(
              child: Text(value),
            ),
          );
        }).toList(),
      ),
    );
  }
}
