import 'package:flutter/material.dart';
import 'package:fourwheels/models/car.dart';
import '../../app.dart';
import '../../widgets/image_banner.dart';
import 'tile_overlay.dart';

class Cars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cars = Car.fetchAll();
    return Scaffold(
      appBar: AppBar(
        title: Text('4Wheels Cars'),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              label: Text(
                'Search',
                style: TextStyle(
                  color: Colors.white,
                ),
              ))
        ],
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) => _itemBuilder(context, cars[index]),
      ),
    );
  }

  _onLocationTap(BuildContext context, int carID) {
    Navigator.pushNamed(
      context,
      CarDetailRoute,
      arguments: {"id": carID},
    );
  }

  Widget _itemBuilder(BuildContext context, Car car) {
    return GestureDetector(
      child: Container(
        height: 245.0,
        child: Stack(
          children: [
            ImageBanner(assetPath: car.imagePath, height: 245.0),
            TileOverlay(car),
          ],
        ),
      ),
      onTap: () => _onLocationTap(context, car.id),
    );
  }
}
