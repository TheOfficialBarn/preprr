import 'package:flutter/material.dart';
import 'package:prepr_app/pages/home.dart';
import 'package:prepr_app/pages/explore.dart';
import 'package:prepr_app/pages/calendar.dart';
import 'package:prepr_app/pages/grocerylist.dart';
import 'package:prepr_app/pages/login_modal.dart';


class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationMenu> {
  int currentPageIndex = 0; //This is home
  List<Widget> pages = [
    const Home(),
    const Explore(),
    const Calendar(),
    const GroceryList(),
  ];
  List<String> appBarHeaders = [
    'Home',
    'Explore',
    'Calendar',
    'Pantry',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: pages[currentPageIndex],
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.explore), label: 'Explore'),
          NavigationDestination(icon: Icon(Icons.calendar_today), label: 'Calendar'),
          NavigationDestination(icon: Icon(Icons.list), label: 'Pantry'),
        ],
        selectedIndex: currentPageIndex, //this variable is located just below the class _NavigationBarState. 
        onDestinationSelected:(value) {
          setState(() {
            currentPageIndex = value;
          });
        },
      )
    );
  }


  //App bar info below
  AppBar myAppBar(context) {
    return AppBar(
      title: Text(
        appBarHeaders[currentPageIndex],
        style: const TextStyle(
          fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.blue[900],
      shadowColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 4.0,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context){
                return const LoginPage();
              }
            );
          },
        ),
      ],
    );
  }
}

