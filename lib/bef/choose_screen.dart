// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, non_constant_identifier_names, avoid_print, unused_element, use_build_context_synchronously, unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graduation_final/bef/login_parent_screen.dart';
import 'package:graduation_final/signup_data.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'Avatar_screen.dart';

class Martins extends StatefulWidget {
  String name;
  String image;
  String para;

  Martins(
    this.name,
    this.image,
    this.para,
  );
  @override
  State<Martins> createState() => _MartinsState();
}

class _MartinsState extends State<Martins> {
  var formkey3 = GlobalKey<FormState>();
  Future<void> _submitForm() async {
    if (formkey3.currentState!.validate()) {
      SignupData data = Provider.of<SignupData>(context, listen: false);

      final user = {
        'email': data.ParentEmail,
        'password': data.ParentPassword,
        'parentName': data.ParentUserName,
        'gender': data.ParentGender,
        'childName': data.ChildUserName,
        'childPassword': data.ChildPassword,
        'childGender': data.ChildGender,
        'childAge': data.childAge.toString(),
      };
      print(user);
      final response = await http.post(
          Uri.parse(
              'https://graduation-project-svct.onrender.com/parent/signup'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(
            {
              'email': data.ParentEmail,
              'password': data.ParentPassword,
              'parentName': data.ParentUserName,
              'gender': data.ParentGender,
              'childName': data.ChildUserName,
              'childPassword': data.ChildPassword,
              'childGender': data.ChildGender,
              'childAge': data.childAge,
            },
          ));
      print(response.body);
      if (response.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Login(),
            ));
        print('tmaam');
      } else {
        print(' مش تمام');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    SignupData data = Provider.of<SignupData>(context);
    return Form(
      key: formkey3,
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/Space.png'), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
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
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'You Choose ${widget.name}',
                          style: const TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.w900),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        CircleAvatar(
                          radius: 100.0,
                          backgroundImage: AssetImage(widget.image),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'About ${widget.name}',
                          style: const TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.w900),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          '${widget.name} ${widget.para}',
                          style: const TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(builder: (context) => const Avatar()),
                      );
                    },
                    child: Row(
                      children: const [
                        SizedBox(
                          width: 10.0,
                        ),
                        Icon(Icons.arrow_back, color: Colors.white),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'back',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _submitForm();
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
                        SizedBox(
                          width: 10.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
