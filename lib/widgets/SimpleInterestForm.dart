import 'package:flutter/material.dart';
import 'package:si_calculator/widgets/DropdownButton.dart';
import 'package:si_calculator/widgets/MoneyImageAsset.dart';
// import 'DropdownButton.dart';

class SimpleInterestForm extends StatefulWidget {
  const SimpleInterestForm({Key? key}) : super(key: key);

  @override
  State<SimpleInterestForm> createState() => _SimpleInterestFormState();
}

class _SimpleInterestFormState extends State<SimpleInterestForm> {
  String _currentItemSelected = "Naira"; // Define _currentItemSelected here
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
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Simple Interest Calculator"),
      ),
      body: Container(
          margin: EdgeInsets.all(_minimumPadding * 5),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              // Inserting MoneyImageAsset Custom Widget
              getMoneyImageAsset(),
              Padding(
                  padding: EdgeInsets.only(
                      top: _minimumPadding, bottom: _minimumPadding),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    style: textStyle,
                    controller: principalController,
                    decoration: InputDecoration(
                        labelText: "Principal",
                        hintText: "Enter Principal e.g 2000",
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      top: _minimumPadding, bottom: _minimumPadding),
                  child: TextField(
                    style: textStyle,
                    controller: roiController,
                    decoration: InputDecoration(
                        labelText: "Rate of Interest",
                        hintText: "Enter the interest agreed",
                        labelStyle: textStyle,
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
                          child: TextField(
                            keyboardType: TextInputType.number,
                            style: textStyle,
                            controller: termController,
                            decoration: InputDecoration(
                              labelText: "Term",
                              hintText: "Time in years",
                              labelStyle: textStyle,
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
                                  this.displayResult = _calculateTotalReturns();
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
          )),
    );
  }

  // Function to calculate total returns from data inputted
  String _calculateTotalReturns() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);
    double totalAmountPayable = principal + (principal * roi * term) / 100;

    String result =
        'After $term years, your investment will be worth $totalAmountPayable $_currentItemSelected';
    return result;
  }

  // Function to reset the application
  void _reset() {
    principalController.text = "";
    roiController.text = "";
    termController.text = "";
    displayResult = "";
    DropDownButton.dropdownKey.currentState?.resetDropdown();
  }
}
