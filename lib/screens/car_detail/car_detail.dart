import 'package:flutter/material.dart';
import 'package:fourwheels/screens/car_detail/text_section.dart';
import 'package:fourwheels/widgets/car_tile.dart';
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ImageBanner(assetPath: photo),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 4.0),
              child: CarTile(
                car: car,
              ),
            ),
            Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                padding: const EdgeInsets.fromLTRB(
                                    16.0, 32.0, 16.0, 4.0),
                                child: Text(
                                  "Price",
                                  style: Theme.of(context).textTheme.headline6,
                                )),
                            Container(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 10.0, 16.0, 16.0),
                              child: Text(
                                price + "€",
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                padding: const EdgeInsets.fromLTRB(
                                    16.0, 32.0, 16.0, 4.0),
                                child: Text(
                                  "State",
                                  style: Theme.of(context).textTheme.headline6,
                                )),
                            Container(
                                padding: const EdgeInsets.fromLTRB(
                                    16.0, 10.0, 16.0, 16.0),
                                child: (km == "0")
                                    ? Text(
                                        "Brand new",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      )
                                    : Text(
                                        "Used",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      )),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                padding: const EdgeInsets.fromLTRB(
                                    16.0, 32.0, 16.0, 4.0),
                                child: Text(
                                  "Type of Fuel",
                                  style: Theme.of(context).textTheme.headline6,
                                )),
                            Container(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 10.0, 16.0, 16.0),
                              child: Text(
                                typeOfFuel,
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                padding: const EdgeInsets.fromLTRB(
                                    16.0, 32.0, 16.0, 4.0),
                                child: Text(
                                  "Year",
                                  style: Theme.of(context).textTheme.headline6,
                                )),
                            Container(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 10.0, 16.0, 16.0),
                              child: (km == "0")
                                  ? Text(
                                      "--",
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    )
                                  : Text(
                                      year,
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                padding: const EdgeInsets.fromLTRB(
                                    16.0, 32.0, 16.0, 4.0),
                                child: Text(
                                  "Year",
                                  style: Theme.of(context).textTheme.headline6,
                                )),
                            Container(
                                padding: const EdgeInsets.fromLTRB(
                                    16.0, 10.0, 16.0, 16.0),
                                child: (km == "0")
                                    ? Text(
                                        "--",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      )
                                    : Text(
                                        year,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      )),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                padding: const EdgeInsets.fromLTRB(
                                    16.0, 32.0, 16.0, 4.0),
                                child: Text(
                                  "Kilometers",
                                  style: Theme.of(context).textTheme.headline6,
                                )),
                            Container(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 10.0, 16.0, 16.0),
                              child: (km == "0")
                                  ? Text(
                                      "--",
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    )
                                  : Text(
                                      km,
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            TextSection("Description", description),
          ],
        ),
      ),
    );
  }
}
