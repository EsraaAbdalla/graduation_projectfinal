// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:graduation_final/bef/third_question_screens.dart';
import 'package:graduation_final/signup_data.dart';

import 'package:provider/provider.dart';

import 'Avatar_screen.dart';

class FourthQuestionsScreen extends StatefulWidget {
  static const String routeName = 'four_question_screen';

  const FourthQuestionsScreen({super.key});

  @override
  State<FourthQuestionsScreen> createState() => _FourthQuestionsScreenState();
}

class _FourthQuestionsScreenState extends State<FourthQuestionsScreen> {
  int chosen = 0;
  late int age;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/Base.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Container(
              margin: const EdgeInsets.only(top: 90),
              child: const Center(
                child: Text(
                  "Answer The \n Following",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                  ),
                  // textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: const Text(
                "4. Child Age .......?",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 30,
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(width: 10,),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      chosen = 3;
                      age = 3;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: chosen == 3
                          ? Colors.green
                          : const Color(0xff7780ABFF),
                    ),
                    child: const Text(
                      "3",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      chosen = 4;
                      age = 4;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: chosen == 4
                          ? Colors.green
                          : const Color(0xff7780ABFF),
                    ),
                    child: const Text(
                      "4",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(width: 10,),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      chosen = 5;
                      age = 5;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: chosen == 5
                          ? Colors.green
                          : const Color(0xff7780ABFF),
                    ),
                    child: const Text(
                      "5",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      chosen = 6;
                      age = 6;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: chosen == 6
                          ? Colors.green
                          : const Color(0xff7780ABFF),
                    ),
                    child: const Text(
                      "6",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(width: 10,),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      chosen = 7;
                      age = 7;
                    });
                  },
                  //7 40
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: chosen == 7
                          ? Colors.green
                          : const Color(0xff7780ABFF),
                    ),
                    child: const Text(
                      "7",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      chosen = 8;
                      age = 8;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: chosen == 8
                          ? Colors.green
                          : const Color(0xff7780ABFF),
                    ),
                    child: const Text(
                      "8",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ThirdQuestionsScreen()),
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
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Back',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.end,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    SignupData data =
                        Provider.of<SignupData>(context, listen: false);
                    data.childAge = age;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Avatar()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.black,
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
                        color: Colors.black,
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
          ],
        ),
      ),
    );
  }
}
