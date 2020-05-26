import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Car {
  final int id;
  final String photo;
  final String brand;
  final String model;
  final int year;
  final int month;
  final String description;
  final int kilometers;
  final String typeOfFuel;
  final String ownerMail;
  final double price;

  //final String imagePath;
  //final String price;
  //final String shortDesc;
  //final List<CarFact> facts;

  Car(
      {this.id,
      this.photo,
      this.brand,
      this.model,
      this.year,
      this.month,
      this.description,
      this.kilometers,
      this.typeOfFuel,
      this.ownerMail,
      this.price});

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
        id: json['id'],
        photo: json['photo'],
        brand: json['brand'],
        model: json['model'],
        year: json['year'],
        month: json['month'],
        description: json['description'],
        kilometers: json['kilometers'],
        typeOfFuel: json['typeOfFuel'],
        ownerMail: json['ownerMail'],
        price: json['price']);
  }

  List<Car> parseCars(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Car>((json) => Car.fromJson(json)).toList();
  }

  Future<List<Car>> fetchApiCars() async {
    final response = await http.get('https://tqsapitests.herokuapp.com/car/');
    if (response.statusCode == 200) {
      return parseCars(response.body);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }
}
