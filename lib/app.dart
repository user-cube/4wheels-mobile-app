import 'package:flutter/material.dart';
import 'package:fourwheels/screens/car_detail/car_detail.dart';
import 'package:fourwheels/screens/cars/cars.dart';
import 'style.dart';

const CarsRoute = "/";
const CarDetailRoute = "/car_detail";

class FourWheelsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: _routes(),
      theme: _theme(),
    );
  }

  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case CarsRoute:
          screen = Cars();
          break;
        case CarDetailRoute:
          screen = CarDetail(arguments['id']);
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }

  ThemeData _theme() {
    return ThemeData(
        appBarTheme: AppBarTheme(textTheme: TextTheme(title: AppBarTextStyle)),
        textTheme: TextTheme(
            title: TitleTextStyle,
            body1: Body1TextStyle,
            caption: CaptionTextStyle,
            subtitle: SubTitleTextStyle));
  }
}
