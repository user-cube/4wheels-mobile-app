import 'package:flutter/material.dart';
import 'package:fourwheels/drawer/bottom/bottonNavigator.dart';
import 'package:fourwheels/models/car.dart';
import 'package:fourwheels/style.dart';
import '../../app.dart';
import '../../widgets/image_banner.dart';
import 'tile_overlay.dart';

class Cars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cars = Car.fetchAll();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            '4Wheels Cars',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              fontFamily: FontNameDefault,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) => _itemBuilder(context, cars[index]),
      ),
      bottomNavigationBar: BottomNavigatorBar(),
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
