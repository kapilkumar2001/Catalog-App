import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme{
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    cardColor: Colors.white,
    canvasColor: creamColor,
    buttonColor: darkBluishColor,
    accentColor: darkBluishColor,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: Theme.of(context).textTheme,
    ),
  );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    cardColor: Colors.black,
    canvasColor: darkCreamColor,
    buttonColor: lightBluishColor,
    accentColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.black,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      textTheme: Theme.of(context).textTheme.copyWith(headline6: context.textTheme.headline6.copyWith(color: Colors.white)),
    ),
  );

  //colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo500;
}