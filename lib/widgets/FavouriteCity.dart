import 'package:flutter/material.dart';

class FavouriteCity extends StatefulWidget {
  const FavouriteCity({super.key});

  @override
  State<FavouriteCity> createState() => _FavouriteCityState();
}

class _FavouriteCityState extends State<FavouriteCity> {
  // Defining property that might change in future
  String cityName = "";
  String cityLocation = "";

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
}
