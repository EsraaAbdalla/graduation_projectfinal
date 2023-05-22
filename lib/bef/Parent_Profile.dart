// ignore_for_file: file_names, camel_case_types, non_constant_identifier_names, prefer_adjacent_string_concatenation

import 'package:flutter/material.dart';
import 'package:graduation_final/bef/sign_up_child.dart';
import 'package:graduation_final/bef/sign_up_screen.dart';

// ignore: file_names
// ignore_for_file: camel_case_types, file_names, non_constant_identifier_names, prefer_const_constructors, prefer_adjacent_string_concatenation, duplicate_ignore

import 'first_question_screens.dart';
import 'login_parent_screen.dart';
//import 'package:profile/profile.dart';

class Parent_Profile extends StatefulWidget {
  const Parent_Profile({super.key});

  @override
  State<Parent_Profile> createState() => _Parent_ProfileState();
}

class _Parent_ProfileState extends State<Parent_Profile> {
  String parent_name = 'Ahmed';
  String parent_email = 'Ahmed@gmail.com';
  String child_email = 'ali@gmail.com';
  String child_name = 'Ali';
  int child_age = 5;
  String child_avatar = 'Jack';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/Space.png'), fit: BoxFit.cover),
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Color(0xff323F5C),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(children: [
              Text(
                'Profile',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "Parent Name :" + "" + parent_name,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1,
                  wordSpacing: 2,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SingleChildScrollView(
                child: Text(
                  "Parent Email :" + "" + parent_email,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "Child Name:" + "" + child_name,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1,
                  wordSpacing: 2,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "Child Email :" + "" + child_email,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "Child Age :" + "" + child_age.toString(),
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1,
                  wordSpacing: 2,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "Child Avatar :" + "" + child_avatar,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1,
                  wordSpacing: 2,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                color: Colors.grey[400],
                child: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Sign_Up_Child()),
                    );
                  },
                  iconSize: 50,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                'Add Another Child',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.grey),
                  ),
                  child: const Text('Edit Profile',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Sign_Up()),
                    );
                  },
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.grey),
                  ),
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                ),
              ]),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.arrow_back,
                          size: 20,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
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
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FirstQuestionsScreen()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          'Next',
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
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
