// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:graduation_final/bef/login_child.dart';
import 'package:graduation_final/bef/result.dart';
import 'package:http/http.dart' as http;

Future<void> fetchAllFriend() async {
  final url = Uri.parse(
      'https://graduation-project-svct.onrender.com/child/allfriends');
  final response = await http.post(url, body: {
    'userId': childId,
  });
  if (response.statusCode == 200) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => const Friends(),
    //   ),
    // );
    var newData = json.decode(response.body);

    friends = newData as List;
  } else {
    // Handle error
    print('Error fetching data: ${response.statusCode}');
  }
  return friends;
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
