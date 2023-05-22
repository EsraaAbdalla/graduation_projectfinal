// ignore_for_file: use_full_hex_values_for_flutter_colors, unused_import

import 'package:flutter/material.dart';
import 'package:graduation_final/bef/third_question_screens.dart';
import 'package:graduation_final/signup_data.dart';

import 'package:provider/provider.dart';

import 'Parent_Profile.dart';

class FirstQuestionsScreen extends StatefulWidget {
  static const String routeName = 'first_question_screen';

  const FirstQuestionsScreen({super.key});

  @override
  State<FirstQuestionsScreen> createState() => _FirstQuestionsScreenState();
}

class _FirstQuestionsScreenState extends State<FirstQuestionsScreen> {
  bool isMother = true;
  late String z;
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
                "1. You Are the ......... ?",
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
                      isMother = false;
                      z = 'Male';
                    });
                  },
                  child: Center(
                    child: Container(
                      // margin: EdgeInsets.symmetric(vertical: 35 , horizontal: 20),
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 25),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isMother == false
                            ? Colors.green
                            : const Color(0xff7780abff),
                      ),

                      child: const Text(
                        "Father",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMother = true;
                      z = 'Female';
                    });
                  },
                  child: Center(
                    child: Container(
                      // margin: EdgeInsets.symmetric(vertical: 35 , horizontal: 20),
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 25),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isMother == true
                            ? Colors.green
                            : const Color(0xff7780abff),
                      ),

                      child: const Text(
                        "Mother",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
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
                          builder: (context) => const Parent_Profile()),
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
                    data.ParentGender = z;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ThirdQuestionsScreen()),
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
