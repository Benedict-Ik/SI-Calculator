import 'package:flutter/material.dart';

class DropDownButton extends StatefulWidget {
  final ValueChanged<String> onItemSelected;
  static final GlobalKey<_DropDownButtonState> dropdownKey =
      GlobalKey<_DropDownButtonState>();

  const DropDownButton({required this.onItemSelected, Key? key})
      : super(key: key);

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  String _currentItemSelected = "₦"; // default value
  // final _currencies = ["Naira", "UK Pounds", "US Dollars", "Euros", "Others"];
  final _currencies = ["₦", "£", "€", "\$"];

  @override
  Widget build(BuildContext context) {
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
          _onDropDownItemSelected(newValueSelected!);
        },
      ),
    );
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      _currentItemSelected = newValueSelected;
    });
    widget.onItemSelected(newValueSelected);
  }

  void resetDropdown() {
    setState(() {
      _currentItemSelected = "₦";
    });
  }
}
