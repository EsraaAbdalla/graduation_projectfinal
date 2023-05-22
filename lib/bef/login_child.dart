// ignore_for_file: camel_case_types, unused_local_variable, prefer_const_declarations, unused_element, use_build_context_synchronously, avoid_print, non_constant_identifier_names, override_on_non_overriding_member, prefer_typing_uninitialized_variables, unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:graduation_final/bef/question_templete.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

var childId;
var questions;

Future<void> exam() async {
  final response = await http
      .get(Uri.parse('https://graduation-project-svct.onrender.com/exam'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    questions = json.decode(response.body);
    print(questions[0]['question2']['title']);
    //
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load questions');
  }
}

class Login_Child extends StatefulWidget {
  const Login_Child({super.key});

  @override
  State<Login_Child> createState() => _Login_ChildState();
}

class _Login_ChildState extends State<Login_Child> {
  var passwordController = TextEditingController();
  var username = TextEditingController();
  bool obsecuretext = true;
  var formkey1 = GlobalKey<FormState>();
  String? stringResponse;
  Map? mapResponse;

  dynamic responseData;

//////////////////////////////////////////////////////
//  API Login Child
  Future<void> _Login() async {
    final url = 'https://graduation-project-svct.onrender.com/child/login';
    final response = await http.post(
      Uri.parse(url),
      body: {
        'childName': username.text,
        'childPassword': passwordController.text,
      },
    );
    print(response.body);
    responseData = json.decode(response.body);
    print(responseData);

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => QuestionTemplete(
                  title: questions[0]['question1']['title'],
                  ans1: questions[0]['question1']['ans1'],
                  ans2: questions[0]['question1']['ans2'],
                  ans3: questions[0]['question1']['ans3'],
                  correctAns: questions[0]['question1']['correctAns'],
                )),
      );
      final prefs = await SharedPreferences.getInstance();
      childId = await SharedPreferences.getInstance();

      prefs.setString('token', responseData['token']);
      childId.setString('childId', responseData['childId']);

      childId = responseData['childId'];

      print(responseData['childId']);
      print('tmaaaam');
    } else {
      print('مش تماااام');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("create account")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey1,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/Base.png"), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            color: Colors.white,
                            Icons.keyboard_arrow_left,
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Center(
                          child: Text(
                            'Login As Child',
                            style: TextStyle(
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Username is required';
                        }
                        return null;
                      },
                      controller: username,
                      keyboardType: TextInputType.text,
                      onFieldSubmitted: (value) {},
                      /*onChanged: (value){
                        print(value);
                      },*/
                      decoration: InputDecoration(
                        fillColor: Colors.white38.withOpacity(0.9),
                        filled: true,
                        // hinttext disappered when i start writting
                        labelText: 'username',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.black),
                          borderRadius: BorderRadius.circular(35),
                        ),
                        prefixIcon: const Icon(
                          Icons.account_circle,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        return null;
                      },
                      controller: passwordController,
                      keyboardType: TextInputType.phone,
                      obscureText: obsecuretext,
                      onFieldSubmitted: (value) {},
                      /*onChanged: (value){
                        print(value);
                      },*/
                      decoration: InputDecoration(
                        fillColor: Colors.white38.withOpacity(0.9),
                        filled: true,
                        // hint text disappered when i start writting
                        labelText: 'password',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.black),
                          borderRadius: BorderRadius.circular(35),
                        ),
                        prefixIcon: const Icon(
                          Icons.lock,
                        ),

                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              obsecuretext = !obsecuretext;
                            });
                          },
                          child: Icon(obsecuretext
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                    ),
                    Center(
                      child: FlutterPwValidator(
                        controller: passwordController,
                        minLength: 6,
                        specialCharCount: 1,
                        uppercaseCharCount: 1,
                        width: 300,
                        height: 75,
                        defaultColor: Colors.grey,
                        successColor: Colors.blue,
                        failureColor: Colors.red,
                        onSuccess: () {},
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Center(
                      child: SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            // Future<void> questionForm() async {
                            //   if (formkey1.currentState!.validate()) {
                            //     ExamModel data = Provider.of<ExamModel>(context,
                            //         listen: false);

                            //     final user = {
                            //       "title": data.title,
                            //       "ans1": data.ans1,
                            //       "ans2": data.ans2,
                            //       "ans3": data.ans3,
                            //       "correctAns": data.correctAns,
                            //     };

                            //     print(user);
                            //     final response = await http.post(
                            //         Uri.parse(
                            //             'https://graduation-project-svct.onrender.com/exam'),
                            //         headers: {
                            //           'Content-Type': 'application/json'
                            //         },
                            //         body: jsonEncode(
                            //           {
                            //             "title": data.title,
                            //             "ans1": data.ans1,
                            //             "ans2": data.ans2,
                            //             "ans3": data.ans3,
                            //             "correctAns": data.correctAns,
                            //           },
                            //         ));
                            //     print(response.body);
                            //     if (response.statusCode == 200) {
                            //       Navigator.push(
                            //           context,
                            //           MaterialPageRoute(
                            //             builder: (context) => const Map(),
                            //           ));
                            //       print('tmaam');
                            //     } else {
                            //       print(' مش تمام');
                            //     }
                            //   }
                            // }

                            if (formkey1.currentState!.validate()) {
                              debugPrint(passwordController.text);
                              debugPrint(username.text);
                              _Login();
                              exam();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor: Colors.grey,
                          ),
                          child: const Text('Login'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
