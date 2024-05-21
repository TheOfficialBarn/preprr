import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Center(
            child: Text('Exploreeeee Page'),
          ),
          CupertinoSearchTextField(
            onChanged: (String value) {
            },
          ),
        ]


      )
      
      
    );
  } 
}