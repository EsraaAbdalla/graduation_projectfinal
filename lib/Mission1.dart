// ignore_for_file: file_names, non_constant_identifier_names, unnecessary_string_interpolations, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_final/get_missions.dart';
import 'package:graduation_final/planets.dart';

import '../completed_mission.dart';
import '../end_free_trial.dart';
import '../your_score_star.dart';

var num_missio = 1;

class FirstMission extends StatefulWidget {
  static const String routeName = "mission1";
  String pathimag;
  // ='images/Mission 1.png';
  String missio;
  // = 'Give Mama A Hug';
  String planet = 'Billiard';
  FirstMission({
    super.key,
    required this.planet,
    required this.pathimag,
    required this.missio,
  });

  @override
  State<FirstMission> createState() => _FirstMissionState();
}

class _FirstMissionState extends State<FirstMission> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff323F5C),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100),
              child: Center(
                child: Text(
                  '${widget.missio}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 35,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            CircleAvatar(
              radius: 110.0,
              backgroundImage: NetworkImage(widget.pathimag),
              backgroundColor: Colors.transparent,
            ),
            const SizedBox(
              height: 50,
            ),
            FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  star_yellow++;
                  num_missio++;
                });

                //Billiard planet

                if (widget.planet == 'Billiard') {
                  if (num_missio == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // pathimaga : path of mission images
                        // missio : mission
                        // mission 2
                        builder: (context) => FirstMission(
                            pathimag: '${missions[i]['planet1'][1]['URL']}',
                            missio: '${missions[i]['planet1'][1]['NAME']}',
                            planet: 'Billiard'),
                      ),
                    );
                  } else if (num_missio == 3) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // mission 3
                        builder: (context) => FirstMission(
                            pathimag: '${missions[i]['planet1'][2]['URL']}',
                            missio: '${missions[i]['planet1'][2]['NAME']}',
                            planet: 'Billiard'),
                      ),
                    );
                  }
                  // ##Billiard planet
                  else if (num_missio == 4) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CompletedMission(),
                      ),
                    );
                  }
                }
                // plant plat
                else if (widget.planet == 'Plat') {
                  if (num_missio == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // mission 5
                        builder: (context) => FirstMission(
                            pathimag: '${missions[i]['planet2'][1]['URL']}',
                            missio: '${missions[i]['planet2'][1]['NAME']}',
                            planet: 'Plat'),
                      ),
                    );
                  } else if (num_missio == 3) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // mission 6

                        builder: (context) => FirstMission(
                            pathimag: '${missions[0]['planet2'][2]['URL']}',
                            missio: '${missions[0]['planet2'][2]['NAME']}',
                            planet: 'Plat'),
                      ),
                    );
                  } else if (num_missio == 4) {
                    // ##end of plat planet
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CompletedMission(),
                      ),
                    );
                  }
                }

                //Greene planet

                else if (widget.planet == 'Greene') {
                  if (num_missio == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // ##mission 8

                        builder: (context) => FirstMission(
                            pathimag: '${missions[i]['planet3'][1]['URL']}',
                            missio: '${missions[i]['planet3'][1]['NAME']}',
                            planet: 'Greene'),
                      ),
                    );
                  } else if (num_missio == 3) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // ##mission 9

                        builder: (context) => FirstMission(
                            pathimag: '${missions[i]['planet3'][2]['URL']}',
                            missio: '${missions[i]['planet3'][2]['NAME']}',
                            planet: 'Greene'),
                      ),
                    );
                  }

                  //##end of Greene planet

                  else if (num_missio == 4) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CompletedMission(),
                      ),
                    );
                  }
                }

                // ##rocky planet

                else if (widget.planet == 'Rocky') {
                  if (num_missio == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // ##mission 11

                        builder: (context) => FirstMission(
                            pathimag: '${missions[i]['planet4'][1]['URL']}',
                            missio: '${missions[i]['planet4'][1]['NAME']}',
                            planet: 'Rocky'),
                      ),
                    );
                  } else if (num_missio == 3) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // ##mission 12
                        builder: (context) => FirstMission(
                            pathimag: '${missions[i]['planet4'][2]['URL']}',
                            missio: '${missions[i]['planet4'][2]['NAME']}',
                            planet: 'Rocky'),
                      ),
                    );
                  }

                  // ## end of ##rocky planet

                  else if (num_missio == 4) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OppsScreen(),
                      ),
                    );
                  }
                }
              },
              label: Row(
                children: const [
                  Text(
                    "Done",
                    style: TextStyle(fontSize: 20),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: Colors.white,
                  ),
                ],
              ),
              backgroundColor: CupertinoColors.black,
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                setState(() {
                  num_missio++;
                });
                //Billiard planet

                if (widget.planet == 'Billiard') {
                  if (num_missio == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // pathimaga : path of mission images
                        // missio : mission

                        // mission 2
                        builder: (context) => FirstMission(
                            pathimag: '${missions[i]['planet1'][1]['URL']}',
                            missio: '${missions[i]['planet1'][1]['NAME']}',
                            planet: 'Billiard'),
                      ),
                    );
                  } else if (num_missio == 3) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // mission 3
                        builder: (context) => FirstMission(
                            pathimag: '${missions[i]['planet1'][2]['URL']}',
                            missio: '${missions[i]['planet1'][2]['NAME']}',
                            planet: 'Billiard'),
                      ),
                    );
                  }
                  // ##Billiard planet
                  else if (num_missio == 4) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CompletedMission(),
                      ),
                    );
                  }
                }
                // plant plat
                else if (widget.planet == 'Plat') {
                  if (num_missio == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // mission 5
                        builder: (context) => FirstMission(
                            pathimag: '${missions[i]['planet2'][1]['URL']}',
                            missio: '${missions[i]['planet2'][1]['NAME']}',
                            planet: 'Plat'),
                      ),
                    );
                  } else if (num_missio == 3) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // mission 6

                        builder: (context) => FirstMission(
                            pathimag: '${missions[i]['planet2'][2]['URL']}',
                            missio: '${missions[i]['planet2'][2]['NAME']}',
                            planet: 'Plat'),
                      ),
                    );
                  } else if (num_missio == 4) {
                    // ##end of plat planet
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CompletedMission(),
                      ),
                    );
                  }
                }

                //Greene planet

                else if (widget.planet == 'Greene') {
                  if (num_missio == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // ##mission 8

                        builder: (context) => FirstMission(
                            pathimag: '${missions[i]['planet3'][1]['URL']}',
                            missio: '${missions[i]['planet3'][1]['NAME']}',
                            planet: 'Greene'),
                      ),
                    );
                  } else if (num_missio == 3) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // ##mission 9

                        builder: (context) => FirstMission(
                            pathimag: '${missions[i]['planet3'][2]['URL']}',
                            missio: '${missions[i]['planet3'][2]['NAME']}',
                            planet: 'Greene'),
                      ),
                    );
                  }

                  //##end of Greene planet

                  else if (num_missio == 4) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CompletedMission(),
                      ),
                    );
                  }
                }

                // ##rocky planet

                else if (widget.planet == 'Rocky') {
                  if (num_missio == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // ##mission 11

                        builder: (context) => FirstMission(
                            pathimag: '${missions[i]['planet4'][1]['URL']}',
                            missio: '${missions[i]['planet4'][1]['NAME']}',
                            planet: 'Rocky'),
                      ),
                    );
                  } else if (num_missio == 3) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // ##mission 12
                        builder: (context) => FirstMission(
                            pathimag: '${missions[i]['planet4'][2]['URL']}',
                            missio: '${missions[i]['planet4'][2]['NAME']}',
                            planet: 'Rocky'),
                      ),
                    );
                  }

                  // ## end of ##rocky planet

                  else if (num_missio == 4) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OppsScreen(),
                      ),
                    );
                  }
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.end,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
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
    );
  }
}
