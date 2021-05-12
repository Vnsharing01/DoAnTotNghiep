
import 'package:yuru_camp/screen/history/history_screen.dart';
import 'package:yuru_camp/screen/home/home_screen.dart';
import 'package:yuru_camp/screen/map/map_direct_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screen/campsite_details/campsite_detail_screen.dart';
import 'screen/campsite_list/campsite_list_screen.dart';
import 'screen/login/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomeScreen(),
    );
  }
}
