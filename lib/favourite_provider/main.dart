import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'favourite_provider.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoriteProvider(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: HomePage(),
      ),
    );
  }
}
