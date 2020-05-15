import 'package:flutter/material.dart';
import 'package:fourwheels/app.dart';

class BottomNavigatorBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      onTap: (int index) {
        print(index);
        switch (index) {
          case 0:
            Navigator.pushNamed(context, CarsRoute);
            break;
          case 1:
            showSearch(context: context, delegate: DataSearch());
            break;
          default:
            break;
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          title: Text('Search'),
        )
      ],
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final cars = ['Tesla Model X', 'Tesla Model S', 'Tesla Model 3'];
  final recentCars = ['Tesla Model X'];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        Navigator.pushNamed(context, CarsRoute);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentCars
        : cars.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.directions_car),
        title: Text(
          suggestionList[index],
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}
