import 'package:flutter/material.dart';
import 'package:si_calculator/widgets/SimpleInterestForm.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // get currentItemSelected => "";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Simple Interest Calculator App',
        theme: ThemeData(
          primaryColor: Colors.purple,
          brightness: Brightness.dark,
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
            // color: Colors.white
          ),
        ),
        home: SimpleInterestForm());
        // home: SimpleInterestForm(currentItemSelected: currentItemSelected));
  }
}
