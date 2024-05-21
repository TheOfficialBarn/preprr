import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prepr_app/firebase_options.dart';
import 'classes/navigation.dart';
import 'classes/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp( const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prepr',
      theme: lightMode,
      darkTheme: darkMode,
      home: const NavigationMenu(),
    );
  }
}


//To edit anything with the app structure, go to the navigation.dart file located in the classes folder.