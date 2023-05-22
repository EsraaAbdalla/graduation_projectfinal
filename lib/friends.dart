// ignore_for_file: camel_case_types, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:graduation_final/tab1.dart';
import 'package:graduation_final/tab2.dart';
import 'package:graduation_final/tab3.dart';

import 'package:graduation_final/map.dart';

// ignore: camel_case_types
class Friends extends StatefulWidget {
  const Friends({super.key});

  @override
  State<Friends> createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/Base.png"), fit: BoxFit.cover),
      ),
      child: DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              toolbarHeight: 40,
              backgroundColor: const Color(0xff575757),

              // backgroundColor: Colors.grey.withOpacity(0.9),
              bottom: const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.group)),
                  Tab(icon: Icon(Icons.person_add)),
                  Tab(icon: Icon(Icons.call_received)),
                ],
              ),
              title: Row(
                children: [
                  const Text('Friends'),
                  const SizedBox(
                    width: 70.0,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Map()));
                      },
                      child: const Text(
                        "Start Our Map",
                        style: TextStyle(fontSize: 20.0),
                      ))
                ],
              ),
            ),
            body: const TabBarView(
              children: <Widget>[
                Tab1(),
                Tab2(),
                Tab3(),
              ],
              // ),
            ),
          )),
    );
  }
}
