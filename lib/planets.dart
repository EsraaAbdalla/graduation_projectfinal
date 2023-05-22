// ignore_for_file: must_be_immutable, unnecessary_string_interpolations, unrelated_type_equality_checks, avoid_print, unused_import, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:graduation_final/Mission2.dart';
import 'package:graduation_final/bef/question_templete.dart';
import 'package:graduation_final/bef/result.dart';
import 'package:graduation_final/get_missions.dart';

import 'Mission1.dart';

var i;

class Planet extends StatefulWidget {
  // static const String routeName = 'zero';
  String planet;
  // ='Zero';
  String path;
  // ='images/Lemon1.png';
  Planet({
    super.key,
    required this.planet,
    required this.path,
  });

  @override
  State<Planet> createState() => _PlanetState();
}

class _PlanetState extends State<Planet> {
  filter() {
    print(grade);
    if (grade == 'Good') {
      i = 0;
    } else {
      i = 1;
    }
    // if (grade == 'Good') {
    //   print(" Good💖😢😢🎶🎶🎶😎");
    if (widget.planet == 'Billiard') {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                // ## miossin 1
                FirstMission(
                    pathimag: '${missions[i]['planet1'][0]['URL']}',
                    missio: '${missions[i]['planet1'][0]['NAME']}',
                    planet: 'Billiard'),
          ));
    } else if (widget.planet == 'Plat') {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                // ## miossin 4
                FirstMission(
                    pathimag: '${missions[i]['planet2'][0]['URL']}',
                    missio: '${missions[i]['planet2'][0]['NAME']}',
                    planet: 'Plat'),
          ));
    } else if (widget.planet == 'Greene') {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                //## miossin 7
                FirstMission(
                    pathimag: '${missions[i]['planet3'][0]['URL']}',
                    missio: '${missions[i]['planet3'][0]['NAME']}',
                    planet: 'Greene'),
          ));
    } else if (widget.planet == 'Rocky') {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                //## miossin 8
                FirstMission(
                    pathimag: '${missions[i]['planet4'][0]['URL']}',
                    missio: '${missions[i]['planet4'][0]['NAME']}',
                    planet: 'Rocky'),
          ));
    }
    // } else if (grade == 'Very Good') {
    //   print("Very Good💖😢😢🎶🎶🎶😎");
    //   // Very Good ///////////Very Good ////////////////// Very Good//////////////
    //   if (widget.planet == 'Billiard') {
    //     Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) =>
    //               // ## miossin 1
    //               SecondMission(
    //                   pathimag: '${missions[0]['planet1'][0]['URL']}',
    //                   missio: '${missions[0]['planet1'][0]['NAME']}',
    //                   planet: 'Billiard'),
    //         ));
    //   } else if (widget.planet == 'Plat') {
    //     Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) =>
    //               // ## miossin 1
    //               SecondMission(
    //                   pathimag: '${missions[0]['planet2'][0]['URL']}',
    //                   missio: '${missions[0]['planet2'][0]['NAME']}',
    //                   planet: 'Billiard'),
    //         ));
    //   } else if (widget.planet == 'Greene') {
    //     Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) =>
    //               //## miossin 7
    //               SecondMission(
    //                   pathimag: '${missions[0]['planet3'][0]['URL']}',
    //                   missio: '${missions[0]['planet3'][0]['NAME']}',
    //                   planet: 'Greene'),
    //         ));
    //   } else if (widget.planet == 'Rocky') {
    //     Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) =>
    //               //## miossin 8
    //               SecondMission(
    //                   pathimag: '${missions[0]['planet3'][0]['URL']}',
    //                   missio: '${missions[0]['planet3'][0]['NAME']}',
    //                   planet: 'Rocky'),
    //         ));
    //   }
    // }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: NetworkImage("images/Space.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 90),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                        text: TextSpan(children: <TextSpan>[
                      const TextSpan(
                        text: "    Welcome! \n To Planet ",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 40),
                      ),
                      TextSpan(
                          text: '${widget.planet}',
                          style: const TextStyle(
                              color: Colors.purpleAccent,
                              fontWeight: FontWeight.w500,
                              fontSize: 40))
                    ])),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 111,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: 100,
                    height: 240,
                    padding: const EdgeInsets.only(top: 140, left: 5),
                    color: Colors.transparent,
                    child: Image.asset("images/rocket1.png")),
                // SizedBox(width: 0,),
                CircleAvatar(
                  radius: 100.0,
                  backgroundImage: AssetImage('${widget.path}'),
                  backgroundColor: Colors.transparent,
                ),
              ],
            ),

            // SizedBox(height: 50,),

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      SizedBox(
                        width: 10.0,
                      ),
                      Icon(
                        Icons.arrow_back,
                        size: 20,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'Back',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print(grade);
                    filter();
                    setState(() {});
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'Start Mission',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.end,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 20,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                    ],
                  ),
                ),
              ],
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
