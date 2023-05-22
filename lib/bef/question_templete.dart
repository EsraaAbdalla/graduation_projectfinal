// ignore_for_file: sized_box_for_whitespace, must_be_immutable, use_full_hex_values_for_flutter_colors, unused_import, prefer_typing_uninitialized_variables, avoid_print, unused_element, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graduation_final/bef/result.dart';

import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

var questionNum = 1;
var temp = "";
int result = 0;

class QuestionTemplete extends StatefulWidget {
  String title;
  String ans1;
  String ans2;
  String ans3;
  String correctAns;
  QuestionTemplete(
      {super.key,
      required this.title,
      required this.ans1,
      required this.ans2,
      required this.ans3,
      required this.correctAns});

  @override
  State<QuestionTemplete> createState() => _QuestionTempleteState();
}

class _QuestionTempleteState extends State<QuestionTemplete> {
  int ans = 0;

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
              height: 50,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                ' ${widget.title}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 30,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 160,
                      height: 70,
                      child: FloatingActionButton.extended(
                        heroTag: "btn1",
                        onPressed: () {
                          setState(() {
                            ans = 1;
                            // questionNum++;
                            temp = widget.ans1;
                          });
                        },
                        label: Text(
                          widget.ans1,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                        backgroundColor:
                            ans == 1 ? Colors.green : const Color(0xff7780abff),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 160,
                      height: 70,
                      child: FloatingActionButton.extended(
                        heroTag: "btn 2",
                        onPressed: () {
                          setState(() {
                            ans = 2;
                            // questionNum++;
                            temp = widget.ans2;
                          });
                        },
                        label: Text(
                          widget.ans2,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                        backgroundColor:
                            ans == 2 ? Colors.green : const Color(0xff7780abff),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 160,
                      height: 70,
                      child: FloatingActionButton.extended(
                        heroTag: "btn 3",
                        onPressed: () {
                          setState(() {
                            ans = 3;
                            // questionNum++;
                            temp = widget.ans3;
                          });
                        },
                        label: Text(
                          widget.ans3,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                        backgroundColor:
                            ans == 3 ? Colors.green : const Color(0xff7780abff),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
/*
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    setState(() {
                      questionNum--;
                    });
                    if (temp == widget.correctAns) {
                      setState(() {
                        result--;
                      });
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(
                        Icons.arrow_back,
                        size: 20,
                        color: Colors.white,
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
*/

                GestureDetector(
                  onTap: () {
                    print("next");
                    var questions;
                    Future<void> exam() async {
                      final response = await http.get(Uri.parse(
                          'https://graduation-project-svct.onrender.com/exam'));

                      if (response.statusCode == 200) {
                        // If the server did return a 200 OK response,
                        // then parse the JSON.
                        questions = json.decode(response.body);
                        print(questions[0]['question1']['title']);
                        if (temp == widget.correctAns) {
                          setState(() {
                            result++;
                          });
                        }
                        setState(() {
                          questionNum++;
                        });
                        if (questionNum == 2) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuestionTemplete(
                                  title: questions[0]['question2']['title'],
                                  ans1: questions[0]['question2']['ans1'],
                                  ans2: questions[0]['question2']['ans2'],
                                  ans3: questions[0]['question2']['ans3'],
                                  correctAns: questions[0]['question2']
                                      ['correctAns'],
                                ),
                              ));
                        } else if (questionNum == 3) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuestionTemplete(
                                  title: questions[0]['question3']['title'],
                                  ans1: questions[0]['question3']['ans1'],
                                  ans2: questions[0]['question3']['ans2'],
                                  ans3: questions[0]['question3']['ans3'],
                                  correctAns: questions[0]['question3']
                                      ['correctAns'],
                                ),
                              ));
                        } else if (questionNum == 4) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuestionTemplete(
                                  title: questions[0]['question4']['title'],
                                  ans1: questions[0]['question4']['ans1'],
                                  ans2: questions[0]['question4']['ans2'],
                                  ans3: questions[0]['question4']['ans3'],
                                  correctAns: questions[0]['question4']
                                      ['correctAns'],
                                ),
                              ));
                        } else if (questionNum == 5) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuestionTemplete(
                                  title: questions[0]['question5']['title'],
                                  ans1: questions[0]['question5']['ans1'],
                                  ans2: questions[0]['question5']['ans2'],
                                  ans3: questions[0]['question5']['ans3'],
                                  correctAns: questions[0]['question5']
                                      ['correctAns'],
                                ),
                              ));
                        } else if (questionNum == 6) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuestionTemplete(
                                  title: questions[0]['question6']['title'],
                                  ans1: questions[0]['question6']['ans1'],
                                  ans2: questions[0]['question6']['ans2'],
                                  ans3: questions[0]['question6']['ans3'],
                                  correctAns: questions[0]['question6']
                                      ['correctAns'],
                                ),
                              ));
                        } else if (questionNum == 7) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuestionTemplete(
                                  title: questions[0]['question7']['title'],
                                  ans1: questions[0]['question7']['ans1'],
                                  ans2: questions[0]['question7']['ans2'],
                                  ans3: questions[0]['question7']['ans3'],
                                  correctAns: questions[0]['question7']
                                      ['correctAns'],
                                ),
                              ));
                        } else if (questionNum == 8) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuestionTemplete(
                                  title: questions[0]['question8']['title'],
                                  ans1: questions[0]['question8']['ans1'],
                                  ans2: questions[0]['question8']['ans2'],
                                  ans3: questions[0]['question8']['ans3'],
                                  correctAns: questions[0]['question8']
                                      ['correctAns'],
                                ),
                              ));
                        } else if (questionNum == 9) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuestionTemplete(
                                  title: questions[0]['question9']['title'],
                                  ans1: questions[0]['question9']['ans1'],
                                  ans2: questions[0]['question9']['ans2'],
                                  ans3: questions[0]['question9']['ans3'],
                                  correctAns: questions[0]['question9']
                                      ['correctAns'],
                                ),
                              ));
                        }
                        /*else if (questionNum == 10){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Map(),
                          ));}
                  },*/
                        else if (questionNum == 10) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Result(result: result),
                              ));
                        }
                      } else {
                        // If the server did not return a 200 OK response,
                        // then throw an exception.
                        throw Exception('Failed to load album');
                      }
                    }

                    exam();

                    //   if (temp == widget.correctAns) {
                    //     setState(() {
                    //       result++;
                    //     });
                    //   }
                    //   setState(() {
                    //     questionNum++;
                    //   });
                    //   if (questionNum == 2) {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => QuestionTemplete(
                    //             title: questions[0]['question2']['title'],
                    //             ans1: questions[0]['question2']['ans1'],
                    //             ans2: questions[0]['question2']['ans2'],
                    //             ans3: questions[0]['question2']['ans3'],
                    //             correctAns: questions[0]['question2']
                    //                 ['correctAns'],
                    //           ),
                    //         ));
                    //   } else if (questionNum == 3) {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => QuestionTemplete(
                    //             title: questions[0]['question3']['title'],
                    //             ans1: questions[0]['question3']['ans1'],
                    //             ans2: questions[0]['question3']['ans2'],
                    //             ans3: questions[0]['question3']['ans3'],
                    //             correctAns: questions[0]['question3']
                    //                 ['correctAns'],
                    //           ),
                    //         ));
                    //   } else if (questionNum == 4) {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => QuestionTemplete(
                    //             title: questions[0]['question4']['title'],
                    //             ans1: questions[0]['question4']['ans1'],
                    //             ans2: questions[0]['question4']['ans2'],
                    //             ans3: questions[0]['question4']['ans3'],
                    //             correctAns: questions[0]['question4']
                    //                 ['correctAns'],
                    //           ),
                    //         ));
                    //   } else if (questionNum == 5) {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => QuestionTemplete(
                    //             title: questions[0]['question5']['title'],
                    //             ans1: questions[0]['question5']['ans1'],
                    //             ans2: questions[0]['question5']['ans2'],
                    //             ans3: questions[0]['question5']['ans3'],
                    //             correctAns: questions[0]['question5']
                    //                 ['correctAns'],
                    //           ),
                    //         ));
                    //   } else if (questionNum == 6) {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => QuestionTemplete(
                    //             title: questions[0]['question6']['title'],
                    //             ans1: questions[0]['question6']['ans1'],
                    //             ans2: questions[0]['question6']['ans2'],
                    //             ans3: questions[0]['question6']['ans3'],
                    //             correctAns: questions[0]['question6']
                    //                 ['correctAns'],
                    //           ),
                    //         ));
                    //   } else if (questionNum == 7) {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => QuestionTemplete(
                    //             title: questions[0]['question7']['title'],
                    //             ans1: questions[0]['question7']['ans1'],
                    //             ans2: questions[0]['question7']['ans2'],
                    //             ans3: questions[0]['question7']['ans3'],
                    //             correctAns: questions[0]['question7']
                    //                 ['correctAns'],
                    //           ),
                    //         ));
                    //   } else if (questionNum == 8) {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => QuestionTemplete(
                    //             title: questions[0]['question8']['title'],
                    //             ans1: questions[0]['question8']['ans1'],
                    //             ans2: questions[0]['question8']['ans2'],
                    //             ans3: questions[0]['question8']['ans3'],
                    //             correctAns: questions[0]['question8']
                    //                 ['correctAns'],
                    //           ),
                    //         ));
                    //   } else if (questionNum == 9) {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => QuestionTemplete(
                    //             title: questions[0]['question9']['title'],
                    //             ans1: questions[0]['question9']['ans1'],
                    //             ans2: questions[0]['question9']['ans2'],
                    //             ans3: questions[0]['question9']['ans3'],
                    //             correctAns: questions[0]['question9']
                    //                 ['correctAns'],
                    //           ),
                    //         ));
                    //   }
                    //   /*else if (questionNum == 10){
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => Map(),
                    //         ));}
                    // },*/
                    //   else if (questionNum == 10) {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => Result(result: result),
                    //         ));
                    //   }
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
/*
QuestionTemplete(
                              questionName: "1. It pulses all the time and is found in the human body, so what is it ?",
                              ans1: "Mind",
                              ans2: "Heart",
                              ans3: "Tongue",
                            ) ,
 */
