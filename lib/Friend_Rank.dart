// ignore_for_file: file_names, unnecessary_string_interpolations, non_constant_identifier_names, must_be_immutable, camel_case_types

import 'package:flutter/material.dart';
import 'package:graduation_final/your_score.dart';
import 'package:graduation_final/your_score_star.dart';

import 'Mission1.dart';
import 'map.dart';

class Ranks {
  int num;
  ImageProvider ima;
  String name;
  int rank;
  Ranks({
    required this.num,
    required this.ima,
    required this.name,
    required this.rank,
  });
}

class Friend_Rank extends StatelessWidget {
  Friend_Rank({super.key});

  //function view the row of score
  static Widget score(Ranks x) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${x.num}',
          style: const TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 30.0,
        ),
        CircleAvatar(
          radius: 23.0,
          backgroundImage: x.ima,
        ),
        const SizedBox(
          width: 40.0,
        ),
        Text(
          '${x.name}',
          style: const TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 70.0,
        ),
        Text(
          '${x.rank}',
          style: const TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ],
    );
  } //end of function

  // put the value in sizebox between rows ranks
  double x = 30.0;
  //line between rows of ranks
  Widget line = const Divider(
    thickness: 2,
    indent: 13.0,
    endIndent: 13.0,
    color: Colors.black,
    height: 40,
  );

  //   Widget ra (Ranks you , Ranks Sam , Ranks Jack, Ranks Sara ){
  //   if( you.rank > Sam.rank && you.rank > Jack.rank && you.rank > Sara.rank)
  //     {
  //       if (Sam.rank > Jack.rank && Sam.rank > Sara.rank)
  //         {
  //           if (Jack.rank > Sam.rank){
  //
  //           }
  //           if ( Sam.rank > Jack.rank){
  //
  //           }
  //
  //         }
  //       else if
  //       (Jack.rank > Sam.rank &&  Jack.rank > Sara.rank)
  //       {
  //
  //       }
  //
  //
  //     };
  //
  // }

  Ranks you = Ranks(
      num: 1,
      ima: const AssetImage('images/Martin.png'),
      name: 'You',
      rank: 50);
  Ranks Sam = Ranks(
      num: 2, ima: const AssetImage('images/Sam.png'), name: 'Sam', rank: 42);
  Ranks Jack = Ranks(
      num: 3, ima: const AssetImage('images/Jack.png'), name: 'Jack', rank: 36);
  Ranks Sara = Ranks(
      num: 4, ima: const AssetImage('images/Sara.png'), name: 'Sara', rank: 24);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/Space.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                    SizedBox(
                      height: x,
                    ),

                    const Text(
                      'Friends Rank',
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(
                      height: x,
                    ),

                    score(you),

                    // SizedBox(
                    //   height:x,
                    // ),

                    line,

                    score(Sam),

                    // SizedBox(
                    //   height:x,
                    // ),

                    line,

                    score(Jack),

                    // SizedBox(
                    //   height:x,
                    // ),

                    line,

                    score(Sara),
                  ],
                ),
              ),
            ),
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
                          builder: (context) => const YourScore(),
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
          ],
        ),
      ),
    );
  }
}
