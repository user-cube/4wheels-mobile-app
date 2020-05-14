import 'package:flutter/material.dart';
import 'package:fourwheels/models/car.dart';
import '../style.dart';

const CarTileHeight = 100.0;

class CarTile extends StatelessWidget {
  final Car car;
  final bool darkTheme;

  CarTile({this.car, this.darkTheme = false});

  @override
  Widget build(BuildContext context) {
    final textColor = this.darkTheme ? TextColorLight : TextColorDark;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: DefaultPaddingHorizontal),
      height: CarTileHeight,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              car.name.toUpperCase(),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style:
                  Theme.of(context).textTheme.title.copyWith(color: textColor),
            ),
            Text(
              car.price.toUpperCase(),
              style: Theme.of(context).textTheme.subtitle,
            ),
            Text(
              car.shortDesc.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .caption
                  .copyWith(color: textColor),
            ),
          ]),
    );
  }
}
