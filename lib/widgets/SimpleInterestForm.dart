import 'package:flutter/material.dart';
import 'package:si_calculator/widgets/DropdownButton.dart';
import 'package:si_calculator/widgets/MoneyImageAsset.dart';
import 'package:intl/intl.dart';

// import 'DropdownButton.dart';

class SimpleInterestForm extends StatefulWidget {
  const SimpleInterestForm({Key? key}) : super(key: key);

  @override
  State<SimpleInterestForm> createState() => _SimpleInterestFormState();
}

class _SimpleInterestFormState extends State<SimpleInterestForm> {
  // Defining For,'s Global key
  var _formKey = GlobalKey<FormState>();

  String _currentItemSelected = "₦"; // Define _currentItemSelected here
  // Properties definition
  final _minimumPadding = 5.0;

  // Creating a custom Text Controller for all our text fields
  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();
  var displayResult = "";

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.titleMedium;
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Interest Calculator"),
      ),
      body: Form(
          key: _formKey,
          // margin: EdgeInsets.all(_minimumPadding * 5),
          child: Padding(
              padding: EdgeInsets.all(_minimumPadding * 5),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  // Inserting MoneyImageAsset Custom Widget
                  getMoneyImageAsset(),
                  Padding(
                      padding: EdgeInsets.only(
                          top: _minimumPadding, bottom: _minimumPadding),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        style: textStyle,
                        controller: principalController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter principal amount";
                          }
                          if (!RegExp(r'^[0-9]*$').hasMatch(value)) {
                            return 'Please enter a valid number';
                          }
                        },
                        decoration: InputDecoration(
                            labelText: "Principal",
                            hintText: "Enter Principal e.g 2000",
                            labelStyle: textStyle,
                            errorStyle: TextStyle(
                                color: Colors.redAccent, fontSize: 15.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),
                  Padding(
                      padding: EdgeInsets.only(
                          top: _minimumPadding, bottom: _minimumPadding),
                      child: TextFormField(
                        style: textStyle,
                        controller: roiController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter interest rate";
                          }
                          if (!RegExp(r'^[0-9]*$').hasMatch(value)) {
                            return 'Please enter a valid number';
                          }
                        },
                        decoration: InputDecoration(
                            labelText: "Rate of Interest",
                            hintText: "Enter the rate agreed e.g 5",
                            labelStyle: textStyle,
                            errorStyle: TextStyle(
                                color: Colors.redAccent, fontSize: 15.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),
                  Row(
                    children: [
                      Expanded(
                          child: Padding(
                              padding: EdgeInsets.only(
                                  top: minimumPadding,
                                  bottom: minimumPadding,
                                  right: minimumPadding * 5.0),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                style: textStyle,
                                controller: termController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter the term";
                                  }
                                  if (!RegExp(r'^[0-9]*$').hasMatch(value)) {
                                    return 'Please enter a valid number';
                                  }
                                },
                                decoration: InputDecoration(
                                  labelText: "Term",
                                  hintText: "Time in years",
                                  labelStyle: textStyle,
                                  errorStyle: TextStyle(
                                      color: Colors.redAccent, fontSize: 15.0),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                ),
                              ))),
                      // Inserting DropDownButton Custom Widget
                      DropDownButton(
                        onItemSelected: (String value) {
                          setState(() {
                            _currentItemSelected = value;
                          });
                        },
                        key: DropDownButton.dropdownKey,
                      ),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: minimumPadding * 4.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.blue),
                                  ),
                                  child: Text(
                                    "Calculate",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  onPressed: () {
                                    // Action intended
                                    setState(() {
                                      if (_formKey.currentState!.validate()) {
                                        this.displayResult =
                                            _calculateTotalReturns();
                                      }
                                    });
                                  })),
                          SizedBox(
                            width: minimumPadding * 3.0,
                          ),
                          Expanded(
                              child: ElevatedButton(
                                  child: Text(
                                    "Reset",
                                    style: textStyle,
                                  ),
                                  onPressed: () {
                                    // Action intended
                                    setState(() {
                                      _reset();
                                    });
                                  }))
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.all(minimumPadding * 4.0),
                      child: Center(
                        child: Text(
                          displayResult,
                          style: textStyle,
                        ),
                      )),
                ],
              ))),
    );
  }

  // Function to calculate total returns from data inputted
  String _calculateTotalReturns() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    double totalAmountPayable = principal + (principal * roi * term) / 100;

    // Format the totalAmountPayable as currency
    final formatter = NumberFormat.currency(locale: 'en_US', symbol: '');
    String formatted_totalAmountPayable = formatter.format(totalAmountPayable);

    String result =
        'After $term years, your investment will be worth $_currentItemSelected$formatted_totalAmountPayable';
    return result;
  }

  // Function to reset the application
  void _reset() {
    _resetValidation();
    principalController.clear();
    roiController.clear();
    termController.clear();
    displayResult = "";
    // Resetting dropdown selection
    DropDownButton.dropdownKey.currentState?.resetDropdown();
  }

  void _resetValidation() {
    _formKey.currentState?.reset();
  }
}
