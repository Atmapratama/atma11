import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'appCol.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ChangeNotifierProvider(
      builder: (context) => ApplicationColor(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Consumer<ApplicationColor>(
            builder: (context, applicationColor, _) => Text(
              "Provider State Management",
              style: TextStyle(color: applicationColor.color),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Consumer<ApplicationColor>(
                builder: (context, applicationColor, _) => AnimatedContainer(
                  margin: EdgeInsets.all(5),
                  width: 100,
                  height: 100,
                  color: applicationColor.color,
                  duration: Duration(milliseconds: 500),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(margin: EdgeInsets.all(5), child: Text("AB")),
                  Consumer<ApplicationColor>(
                    builder: (context, applicationColor, _) => Switch(
                      value: applicationColor.isLightBlue,
                      onChanged: (newValue) {
                        applicationColor.isLightBlue = newValue;
                      },
                    ),
                  ),
                  Container(margin: EdgeInsets.all(5), child: Text("BL"))
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
