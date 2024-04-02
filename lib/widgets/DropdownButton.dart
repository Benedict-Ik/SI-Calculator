import 'package:flutter/material.dart';

class DropDownButton extends StatefulWidget {
  // const DropDownButton({super.key});
  final ValueChanged<String> onItemSelected;
  const DropDownButton({required this.onItemSelected, Key? key})
      : super(key: key);

  // get currentItemSelected => null;

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  // Defining property that might change in future
  String cityName = "";
  var _currencies = ["Naira", "UK Pounds", "US Dollars", "Euros", "Others"];
  // var currencies = ["Naira", "UK Pounds", "US Dollars", "Euros", "Others"];
  var _currentItemSelected = "Naira"; // default value
  // late String _currentItemSelected = "Naira";
  // var currentItemSelected = "Naira"; // default value
  final _minimumPadding = 5.0;

  // Getter method for currentItemSelected
  String get currentItemSelected => _currentItemSelected;

  set currentItemSelected(String value) {
    setState(() {
      _currentItemSelected = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // DropDownButton widget is created at this point
    return Expanded(
        child: DropdownButton(
            items: _currencies.map((String value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            }).toList(),
            value: _currentItemSelected,
            onChanged: (String? newValueSelected) {
              // code to be executed
              _onDropDownItemSelected(newValueSelected!);
            }));
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      _currentItemSelected = newValueSelected;
    });
    widget.onItemSelected(newValueSelected);
  }
}
