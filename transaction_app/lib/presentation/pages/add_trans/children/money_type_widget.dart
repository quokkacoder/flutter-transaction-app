import 'package:flutter/material.dart';

class MoneyTypeWidget extends StatefulWidget {
  MoneyTypeWidget({@required ObjectKey key});

  @override
  _MoneyTypeState createState() => _MoneyTypeState();
}

class _MoneyTypeState extends State<MoneyTypeWidget> {
  String dropdownValue = 'Income';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      key: widget.key,
      isExpanded: true,
      value: dropdownValue,
      icon: Icon(Icons.arrow_forward_ios),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.black, fontSize: 17),
      underline: Container(
        height: 1.5,
        color: Colors.grey,
      ),
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
    );
  }
}