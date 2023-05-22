// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'choose_screen.dart';

class Avatar extends StatefulWidget {
  const Avatar({super.key});

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  String name = '';
  String image = '';
  String para = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/Space.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(30.0),
              color: const Color(0xff323F5C),
            ),
            height: 500,
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Choose Your Avatar',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        name = 'Sam';
                        image = 'images/Sam.png';
                        para = 'Loves eats So Much And His Favorite '
                            'Plant is mars ,$name Dreams to be An '
                            'Astronaut When He Gets Older.';

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Martins(name, image, para),
                            ));
                      },
                      child: Column(
                        children: const [
                          CircleAvatar(
                            radius: 60.0,
                            backgroundImage: AssetImage('images/Sam.png'),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            'Sam',
                            style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        name = 'Jack';
                        image = 'images/Jack.png';
                        para = 'Loves eats So Much And His Favorite '
                            'Plant is mars ,$name Dreams to be An '
                            'Astronaut When He Gets Older.';

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Martins(name, image, para),
                            ));
                      },
                      child: Column(
                        children: const [
                          CircleAvatar(
                            radius: 60.0,
                            backgroundImage: AssetImage('images/Jack.png'),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            'Jack',
                            style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        name = 'Martin';
                        image = 'images/Martin.png';
                        para = 'Loves eats So Much And His Favorite '
                            'Plant is mars ,$name Dreams to be An '
                            'Astronaut When He Gets Older.';

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Martins(name, image, para),
                            ));
                      },
                      child: Column(
                        children: const [
                          CircleAvatar(
                            radius: 60.0,
                            backgroundImage: AssetImage('images/Martin.png'),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            'Martin',
                            style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        name = 'Sara';
                        image = 'images/Sara.png';
                        para = 'Loves eats So Much And His Favorite '
                            'Plant is mars ,$name Dreams to be An '
                            'Astronaut When He Gets Older.';

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Martins(name, image, para),
                            ));
                      },
                      child: Column(
                        children: const [
                          CircleAvatar(
                            radius: 60.0,
                            backgroundImage: AssetImage('images/Sara.png'),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            'Sara',
                            style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
