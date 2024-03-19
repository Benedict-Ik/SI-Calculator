import 'package:flutter/material.dart';

class FavouriteCity extends StatefulWidget {
  const FavouriteCity({super.key});

  @override
  State<FavouriteCity> createState() => _FavouriteCityState();
}

class _FavouriteCityState extends State<FavouriteCity> {
  // Defining property that might change in future
  String cityName = "";
  var _currencies = ['UK Pounds', "US Dollars", "Euros", "Others"];
  var _currentItemSelected = "UK Pounds"; // default value

  @override
  Widget build(BuildContext context) {
    // FavouriteCity widget is created at this point
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stateful Widget"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              onSubmitted: (String userInput) {
                setState(() {
                  // setStateis called which tells the framework to redraw the
                  // FavouriteCity widget
                  cityName = userInput;
                });
              },
            ),
            Container(
              margin: EdgeInsets.only(top: 30.0),
              decoration: BoxDecoration(
                border: Border.all(
                  // Add border color and width
                  color: Colors.black, // Set border color here
                  width: 2, // Set border width here
                ),
                borderRadius: BorderRadius.circular(8), // Add border radius
              ),
              child: DropdownButton(
                padding: EdgeInsets.all(10.0),
                items: _currencies.map((String dropDownListItem) {
                  return DropdownMenuItem(
                    value: dropDownListItem,
                    child: Text(dropDownListItem),
                  );
                }).toList(),
                onChanged: (String? newValueSelected) {
                  //  Code to execute when user picks an item from the dropdown list
                  // Calling the function
                  _onDropDownItemSelected(newValueSelected!);
                },
                value: _currentItemSelected,
              ),
            ),
            Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  "Your next city is: $cityName",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected!;
    });
  }
}
