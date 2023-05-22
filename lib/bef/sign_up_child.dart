// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:graduation_final/signup_data.dart';

import 'package:provider/provider.dart';

import 'first_question_screens.dart';

class Sign_Up_Child extends StatefulWidget {
  const Sign_Up_Child({super.key});

  @override
  State<Sign_Up_Child> createState() => _Sign_Up_ChildState();
}

class _Sign_Up_ChildState extends State<Sign_Up_Child> {
  var ChildPassword = TextEditingController();
  var ChildName = TextEditingController();
  bool obsecuretext = true;
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF064278),

      body: Form(
        key: formkey,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/Base.png'), fit: BoxFit.cover),
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
                            'Create A child Account',
                            style: TextStyle(
                              fontSize: 25.0,
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
                      controller: ChildName,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Username is required';
                        }
                        return null;
                      },
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
                      controller: ChildPassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'You Must Enter Password';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      obscureText: obsecuretext,
                      onFieldSubmitted: (value) {},

                      /*onChanged: (value){
                        print(value);
                      },*/
                      decoration: InputDecoration(
                        // hint text disappered when i start writting
                        fillColor: Colors.white38.withOpacity(0.9),
                        filled: true,
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
                        controller: ChildPassword,
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
                            SignupData data =
                                Provider.of<SignupData>(context, listen: false);

                            data.ChildUserName = ChildName.text;
                            data.ChildPassword = ChildPassword.text;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const FirstQuestionsScreen()),
                            );

                            if (formkey.currentState!.validate()) {
                              debugPrint(ChildPassword.text);
                              debugPrint(ChildName.text);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor: Colors.grey,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('Next', style: TextStyle(fontSize: 20.0)),
                              SizedBox(
                                width: 5.0,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                size: 20.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
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
