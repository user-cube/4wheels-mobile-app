import 'package:flutter/material.dart';
import 'package:fourwheels/drawer/bottom/bottonNavigator.dart';
import 'package:fourwheels/models/car.dart';
import 'package:fourwheels/style.dart';
import 'package:logger/logger.dart';
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
  var logger = Logger();

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
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: Container(
                    height: 245,
                    child: Stack(children: [
                      ImageBanner(
                          assetPath: snapshot.data[index].photo, height: 245.0),
                      TileOverlay(snapshot.data[index])
                    ]),
                  ),
                  onTap: () {
                    logger.i("clicked");
                    _onLocationTap(
                      context,
                      snapshot.data[index].id,
                      snapshot.data[index].brand,
                      snapshot.data[index].model,
                      snapshot.data[index].year.toString(),
                      snapshot.data[index].month.toString(),
                      snapshot.data[index].kilometers.toString(),
                      snapshot.data[index].typeOfFuel,
                      snapshot.data[index].price.toString(),
                      snapshot.data[index].description,
                      snapshot.data[index].photo,
                      snapshot.data[index],
                    );
                  },
                );
              },
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigatorBar(),
    );
  }

  _onLocationTap(
    BuildContext context,
    int carID,
    String brand,
    String model,
    String year,
    String month,
    String km,
    String typeOfFuel,
    String price,
    String description,
    String photo,
    Car car,
  ) {
    Navigator.pushNamed(
      context,
      CarDetailRoute,
      arguments: {
        "carID": carID,
        "brand": brand,
        "model": model,
        "year": year,
        "month": month,
        "km": km,
        "typeOfFuel": typeOfFuel,
        "price": price,
        "description": description,
        "photo": photo,
        "car": car,
      },
    );
  }
}
