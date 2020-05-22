import 'package:flutter/material.dart';
import 'package:fourwheels/drawer/bottom/bottonNavigator.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:fourwheels/models/car.dart';
import 'package:fourwheels/style.dart';
import '../../app.dart';
import '../../models/car.dart';
import '../../widgets/image_banner.dart';
import 'tile_overlay.dart';

class Cars extends StatefulWidget {
  @override
  _CarsState createState() => _CarsState();
}

class _CarsState extends State<Cars> {
  Future<List<Car>> futureCar;
  final Car car = new Car();

  @override
  void initState() {
    super.initState();
    futureCar = car.fetchApiCars();
  }


  @override
  Widget build(BuildContext context) {
    //final cars = Car.fetchAll();
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
      body: Container(
        child: FutureBuilder(
          future: futureCar,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index){
                return GestureDetector(
                  child: Container(
                    height: 245,
                    child: Stack(
                      children:[
                        ImageBanner(assetPath:snapshot.data[index].photo, height: 245.0),
                        TileOverlay(snapshot.data[index])
                      ]),
                    ),
                    onTap: () => _onLocationTap(context, snapshot.data[index].id),
                );
              });
          }),
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
            ImageBanner(assetPath: car.photo, height: 245.0),
            TileOverlay(car),
          ],
        ),
      ),
      onTap: () => _onLocationTap(context, car.id),
    );
  }
}