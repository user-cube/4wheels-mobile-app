import 'package:flutter/material.dart';
import 'package:fourwheels/widgets/car_tile.dart';
import 'text_section.dart';
import '../../widgets/image_banner.dart';
import 'package:fourwheels/models/car.dart';
import 'package:fourwheels/style.dart';
import 'package:fourwheels/screens/cars/tile_overlay.dart';
import 'package:fourwheels/drawer/bottom/bottonNavigator.dart';

import 'text_section.dart';


class CarDetail extends StatefulWidget {
  final int _carID;
  CarDetail(this._carID);

  @override
  _CarDetailState createState() => _CarDetailState(_carID);
}

class _CarDetailState extends State<CarDetail> {
  final int _carID;
  _CarDetailState(this._carID);

  Future<Car> futureCarid;
  final Car car = new Car();

  @override
  void initState() {
    super.initState();
    futureCarid = car.fetchCarId(_carID);
    print('INIT STAT' + futureCarid.toString());
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
          future: futureCarid,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ImageBanner(assetPath:snapshot.data, height: 245.0),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 4.0),
                    child: CarTile(
                      car: snapshot.data,
                      )
                    ),
                    ListView(
                      children: <Widget>[
                        ListTile(
                        title: Text(snapshot.data.brand),
                        ),
                        ListTile(
                          title: Text(snapshot.data.model),
                        ),
                        ListTile(
                          title: Text(snapshot.data.year.toString() + '/' + snapshot.data.month.toString()),
                        ),
                        ListTile(
                          title: Text(snapshot.data.kilometers.toString() + ' - ' + snapshot.data.typeOfFuel),
                        ),
                        ListTile(
                          title: Text(snapshot.data.price.toString() + '€'),
                        ),
                        ListTile(
                          title: Text(snapshot.data.description),
                        ),
                      ]
                      )]
                    ),
                  );
          }),
      ),
      bottomNavigationBar: BottomNavigatorBar(),
    );
  }
}