// ignore_for_file: camel_case_types, unnecessary_brace_in_string_interps, unnecessary_string_interpolations

import 'package:flutter/material.dart';

class unlock extends StatelessWidget {
  const unlock({super.key});

  //function
  static Widget lock(String path, String name, Color colo) {
    // path path of planet image
    // name name of planet
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(30.0),
        color: Colors.white,
      ),
      height: 220,
      width: 170,
      child: Column(
        children: [
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60.0,
                backgroundImage: AssetImage('${path}'),
                backgroundColor: Colors.white,
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Unlock Planet',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w900),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${name}',
                style: TextStyle(
                    fontSize: 25, color: colo, fontWeight: FontWeight.w900),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/Space.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(children: [
          const SizedBox(
            height: 170.0,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Unlock More',
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Planets',
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
            ],
          ),

          const SizedBox(
            height: 70.0,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(
                  width: 35.0,
                ),
                lock('images/Blue_Crystal1.png', 'Crystal', Colors.blue),
                const SizedBox(
                  width: 15.0,
                ),
                lock('images/Yellowish1.png', 'Yellowish',
                    Colors.deepOrangeAccent),
                const SizedBox(
                  width: 15.0,
                ),
                lock('images/Lava1.png', 'Lava', Colors.orange),
                const SizedBox(
                  width: 15.0,
                ),
                lock('images/Crystal1.png', 'Crystal', Colors.deepPurpleAccent),
                const SizedBox(
                  width: 15.0,
                ),
                lock('images/Aquarius1.png', 'Aquarius', Colors.blueAccent),
                const SizedBox(
                  width: 15.0,
                ),
                lock('images/Shine1.png', 'Shine', Colors.blueAccent),
                const SizedBox(
                  width: 15.0,
                ),
                lock('images/Beam1.png', 'Beam', Colors.redAccent),
                const SizedBox(
                  width: 15.0,
                ),
                lock('images/Violet1.png', 'Violet', Colors.pinkAccent),
              ],
            ),
          ),

          const SizedBox(
            height: 100.0,
          ),

          //button
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(5.0),
              color: Colors.black,
            ),
            width: 300.0,
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Continue Checkout',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Icon(Icons.arrow_forward_rounded, color: Colors.white),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
