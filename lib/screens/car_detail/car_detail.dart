import 'package:flutter/material.dart';
import 'package:fourwheels/widgets/car_tile.dart';
import 'package:logger/logger.dart';
import '../../widgets/image_banner.dart';
import 'package:fourwheels/models/car.dart';
import 'package:fourwheels/style.dart';
import 'package:fourwheels/drawer/bottom/bottonNavigator.dart';

class CarDetail extends StatefulWidget {
  final int carID;
  final String brand;
  final String model;
  final String year;
  final String month;
  final String km;
  final String typeOfFuel;
  final String price;
  final String description;
  final String photo;
  final Car car;

  CarDetail(this.carID, this.brand, this.model, this.year, this.month, this.km,
      this.typeOfFuel, this.price, this.description, this.photo, this.car);

  @override
  _CarDetailState createState() => _CarDetailState(carID, brand, model, year,
      month, km, typeOfFuel, price, description, photo, car);
}

class _CarDetailState extends State<CarDetail> {
  final int carID;
  final String brand;
  final String model;
  final String year;
  final String month;
  final String km;
  final String typeOfFuel;
  final String price;
  final String description;
  final String photo;
  final Car car;

  _CarDetailState(
      this.carID,
      this.brand,
      this.model,
      this.year,
      this.month,
      this.km,
      this.typeOfFuel,
      this.price,
      this.description,
      this.photo,
      this.car);

  var logger = Logger();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    logger.i(carID);
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
      ),
      bottomNavigationBar: BottomNavigatorBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Row(
            children: <Widget>[
              Column(children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Text(carID.toString()),
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
