import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_model/db/uzum_db.dart';
import 'package:hive_model/ui/HomePage.dart';

void main(List<String> args) {
  Hive.initFlutter();
  UzumDBService.registerAdapter();
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
