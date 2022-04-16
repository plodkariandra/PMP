import 'package:films_app/home_page.dart';
import 'package:flutter/material.dart';

class FilmApp extends StatelessWidget {
  const FilmApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
