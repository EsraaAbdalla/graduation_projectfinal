// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

var missions;
void getData() async {
  http.Response response = await http
      .get(Uri.parse("https://graduation-project-svct.onrender.com/mission/"));
  if (response.statusCode == 200) {
    var newData = json.decode(response.body);
    missions = newData;
    print(missions[0]['missions']['planet1'][0]['NAME']);
    print(missions[0]['missions']['planet1'][0]['URL'].runtimeType);
    // print(newData);
  } else {
    print(response.statusCode);
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
