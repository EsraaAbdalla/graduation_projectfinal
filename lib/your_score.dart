import 'package:flutter/material.dart';
import 'package:graduation_final/your_score_star.dart';
// import 'package:graduation_project/your_score_star.dart';
import 'Friend_Rank.dart';
import 'Mission1.dart';
import 'map.dart';

class YourScore extends StatelessWidget {
  const YourScore({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/Space.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(30.0),
                color: const Color(0xff323F5C),
              ),
              height: 500,
              width: 350,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30.0,
                  ),
                  const Text(
                    'Your Score',
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const CircleAvatar(
                    radius: 75.0,
                    backgroundImage: AssetImage('images/Sam.png'),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    '50',
                    style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Friend_Rank(),
                          ));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Friends Rank',
                          style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Icon(Icons.arrow_forward_ios, color: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // SizedBox(
          //   height: 200.0,
          // ),
          const Spacer(),

          Row(
            children: [
              const SizedBox(
                width: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const YourScoreStar(),
                      ));
                },
                child: Row(
                  children: const [
                    Icon(Icons.arrow_back, color: Colors.white),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'Back',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 180,
              ),
              GestureDetector(
                onTap: () {
                  level++;
                  star_yellow = 0;
                  num_missio = 1;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Map(),
                      ));
                },
                child: Row(
                  children: const [
                    Text(
                      'Next level',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ]),
      ),
    );
  }
}
