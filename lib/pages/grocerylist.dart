import 'package:flutter/material.dart';
import 'package:prepr_app/classes/list_tiles.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  _GroceryListState createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  //Goals: Have a list that pulls information on queued meals from home page and displays them here
  List<Map<String, Object>> groceryList = [
    {
      'item': 'All purpose flour',
      'itemState': false,
    },
    {
      'item': 'Yeast',
      'itemState': false,
    },
    {
      'item': 'Sugar',
      'itemState': false,
    },
  ];








  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Grocery List'), //Add a list of items here
          Expanded(
            child: ListView.builder(
              itemCount: groceryList.length,
              itemBuilder: (BuildContext context, int index) {
                return GroceryListTile(
                  taskName: groceryList[index]['item'] as String,
                  taskCompleted: groceryList[index]['itemState'] as bool,
                  onChanged: (bool? value) {
                    setState(() {
                      groceryList[index]['itemState'] = value!;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}





/*
          GroceryListTile(
            taskName: groceryList[0]['item'] as String,
            taskCompleted: groceryList[0]['itemState'] as bool,
            onChanged: (bool? value) {
              setState(() {
                groceryList[0]['itemState'] = value!;
              });
            },
          ),


*/