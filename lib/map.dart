// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:graduation_final/planets.dart';

var sco = 1;
var level = 0;
var tr = 1;

class Map extends StatefulWidget {
  const Map({super.key});

  @override
  State<Map> createState() => _Map();
}

class _Map extends State<Map> {
  double h = 1;

  double movlfet(x) {
    if (x == 1) {
      h = 140;
    } else if (x == 2) {
      h = 230;
    } else if (x == 3) {
      h = 140;
    } else if (x == 4) {
      h = 230;
    }
    return h;
  }

  double mov(x) {
    if (x == 1) {
      h = 630.0;
    } else if (x == 2) {
      h = 430.0;
    } else if (x == 3) {
      h = 230.0;
    } else if (x == 4) {
      h = 60.0;
    }
    return h;
  }

  @override
  Widget build(BuildContext context) {
    Image roc = const Image(
      image: AssetImage('images/rocket1.png'),
      height: 70.0,
      width: 70.0,
    );

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/Space.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(seconds: 2),
                    left: movlfet(sco),
                    top: mov(sco),
                    child: Container(
                      height: 70.0,
                      width: 70.0,
                      color: Colors.transparent,
                      child: roc,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 300.0, top: 30.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          sco == 3 && level == 3 ? sco++ : h++;
                        });
                      },
                      child: Stack(children: [
                        Container(
                          child: const CircleAvatar(
                            radius: 60.0,
                            backgroundImage: AssetImage('images/Rocky1.png'),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                        Positioned(
                          top: 40,
                          left: 35,
                          child: Container(
                            child: Icon(
                              Icons.check_circle_rounded,
                              size: 40,
                              color: level >= 4
                                  ? Colors.green
                                  : Colors.transparent,
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 200),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          sco == 2 && level == 2 ? sco++ : h++;
                        });
                      },
                      child: Stack(children: [
                        Container(
                          child: const CircleAvatar(
                            radius: 60.0,
                            backgroundImage: AssetImage('images/Greene1.png'),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                        Positioned(
                          top: 40,
                          left: 35,
                          child: Container(
                            child: Icon(
                              Icons.check_circle_rounded,
                              size: 50,
                              color: level >= 3
                                  ? Colors.green
                                  : Colors.transparent,
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 300, top: 400),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          sco == 1 && level == 1 ? sco++ : h++;
                        });
                      },
                      child: Stack(children: [
                        Container(
                          child: const CircleAvatar(
                            radius: 60.0,
                            backgroundImage: AssetImage('images/plat.png'),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                        Positioned(
                          top: 40,
                          left: 35,
                          child: Container(
                            child: Icon(
                              Icons.check_circle_rounded,
                              size: 50,
                              color: level >= 2
                                  ? Colors.green
                                  : Colors.transparent,
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 600),
                    child: Stack(children: [
                      Container(
                        child: const CircleAvatar(
                          radius: 60.0,
                          backgroundImage: AssetImage('images/Billiard.png'),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      Positioned(
                        top: 40,
                        left: 35,
                        child: Container(
                          child: Icon(
                            Icons.check_circle_rounded,
                            size: 50,
                            color:
                                level >= 1 ? Colors.green : Colors.transparent,
                          ),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (level == 0 && sco == 1) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Planet(
                              planet: 'Billiard',
                              path: 'images/Billiard.png',
                            ),
                          ));
                    } else if (level == 1 && sco == 2) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Planet(
                              planet: 'Plat',
                              path: 'images/plat.png',
                            ),
                          ));
                    } else if (level == 2 && sco == 3) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Planet(
                              planet: 'Greene',
                              path: 'images/Greene1.png',
                            ),
                          ));
                    } else if (level == 3 && sco == 4) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Planet(
                              planet: 'Rocky',
                              path: 'images/Rocky1.png',
                            ),
                          ));
                    }
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      'Next level',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(Icons.arrow_forward, color: Colors.white),
                    SizedBox(
                      width: 15.0,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
