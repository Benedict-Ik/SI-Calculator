import 'package:flutter/material.dart';
import 'package:si_calculator/widgets/MoneyImageAsset.dart';

class SimpleInterestForm extends StatefulWidget {
  const SimpleInterestForm({super.key});

  @override
  State<SimpleInterestForm> createState() => _SimpleInterestFormState();
}

class _SimpleInterestFormState extends State<SimpleInterestForm> {
  // Properties definition
  var _currencies = ["Naira", "UK Pounds", "US Dollars", "Euros", "Others"];
  var _currentItemSelected = "UK Pounds"; // default value
  final _minimumPadding = 5.0;

  @override
  Widget build(BuildContext context) {
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
              getMoneyImageAsset(),
              Padding(
                  padding: EdgeInsets.only(
                      top: _minimumPadding, bottom: _minimumPadding),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Principal",
                        hintText: "Enter Principal e.g 2000",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      top: _minimumPadding, bottom: _minimumPadding),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Rate of Interest",
                        hintText: "Enter the interest agreed",
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
                            decoration: InputDecoration(
                              labelText: "Term",
                              hintText: "Time in years",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                          ))),
                  Expanded(
                      child: DropdownButton(
                          items: _currencies.map((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          value: "Naira",
                          onChanged: (String? newValueSelected) {
                            // code to be executed
                          }))
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(top: minimumPadding * 4.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                              child: Text("Calculate"),
                              onPressed: () {
                                // Action intended
                              })),
                      SizedBox(
                        width: minimumPadding * 3.0,
                      ),
                      Expanded(
                          child: ElevatedButton(
                              child: Text("Reset"),
                              onPressed: () {
                                // Action intended
                              }))
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.all(minimumPadding * 4.0),
                  child: Center(
                    child: Text("Data"),
                  )),
            ],
          )),
    );
  }
}
