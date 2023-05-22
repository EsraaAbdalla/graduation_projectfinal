// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:graduation_final/bef/third_question_screens.dart';

import 'first_question_screens.dart';

class SecondQuestionsScreen extends StatefulWidget {
  static const String routeName = 'two_question_screen';

  const SecondQuestionsScreen({super.key});

  @override
  State<SecondQuestionsScreen> createState() => _SecondQuestionsScreenState();
}

class _SecondQuestionsScreenState extends State<SecondQuestionsScreen> {
  int numberOfChildren = 1;
  int count = 0;

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
                "2. Child Number ......... ?",
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
                InkWell(
                    onTap: () {
                      if (count > 1) {
                        count--;
                        setState(() {
                          numberOfChildren = count;
                        });
                      }
                    },
                    // - 23
                    child: Container(
                      padding: const EdgeInsets.all(23),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff7780abff),
                      ),
                      child: const Text(
                        "-",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w500),
                      ),
                    )),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // color: Colors.indigo,
                    borderRadius: BorderRadius.circular(10),
                    /*border: Border.all(
                     width: 1.9,
                     color: Colors.black,
                     style: BorderStyle.solid
                   )*/
                  ),
                  child: Text(
                    numberOfChildren.toString(),
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        count++;
                        numberOfChildren = count;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(19),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff7780ABFF),
                      ),
                      child: const Text(
                        "+",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w500),
                      ),
                    )),
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
                          builder: (context) => const FirstQuestionsScreen()),
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
