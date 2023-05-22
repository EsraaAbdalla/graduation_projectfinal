// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:graduation_final/your_score.dart';

var star_yellow = 0;

class YourScoreStar extends StatelessWidget {
  const YourScoreStar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/Space.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
            //mainAxisAlignment:MainAxisAlignment.center ,

            children: [
              Padding(
                padding: const EdgeInsets.only(top: 200.0),
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
                          color: Colors.white,
                        ),
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
                        height: 10.0,
                      ),
                      const Text(
                        'Grade',
                        style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color:
                                star_yellow >= 1 ? Colors.yellow : Colors.black,
                            size: 40,
                          ),
                          Icon(
                            Icons.star,
                            color:
                                star_yellow >= 2 ? Colors.yellow : Colors.black,
                            size: 40,
                          ),
                          Icon(
                            Icons.star,
                            color:
                                star_yellow >= 3 ? Colors.yellow : Colors.black,
                            size: 40,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Row(
                    children: const [
                      Icon(Icons.arrow_back, color: Colors.white),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'Try Again',
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 180,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const YourScore(),
                          ));
                    },
                    child: Row(
                      children: const [
                        Text(
                          'Next',
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
              const SizedBox(height: 10),
            ]),
      ),
    );
  }
}
