// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:graduation_final/Mission1.dart';
import 'package:graduation_final/allchildren_parent.dart';
import 'package:graduation_final/bef/game_one.dart';
import 'package:graduation_final/bef/login_child.dart';
import 'package:graduation_final/bef/login_parent_screen.dart';
import 'package:graduation_final/bef/result.dart';
import 'package:graduation_final/friends.dart';
import 'package:graduation_final/get_missions.dart';
import 'package:graduation_final/signup_data.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SignupData("", "", "", "", "", "", "", 0),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GameOne(),
      // FirstMission(pathimag:'images/Mission 1.png',missio:'Give Mama A Hug',planet: 'Billiard'),
    );
  }
}
