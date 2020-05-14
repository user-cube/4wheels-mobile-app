import 'package:flutter/material.dart';
import 'package:fourwheels/models/car.dart';
import 'package:fourwheels/widgets/car_tile.dart';

class TileOverlay extends StatelessWidget {
  final Car car;

  TileOverlay(this.car);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
            child: CarTile(
              car: car,
              darkTheme: true,
            ))
      ],
    );
  }
}
