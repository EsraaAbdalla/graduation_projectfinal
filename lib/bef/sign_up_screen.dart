// ignore_for_file: camel_case_types, prefer_const_declarations, use_build_context_synchronously, avoid_print, unused_element, non_constant_identifier_names, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:graduation_final/bef/sign_up_child.dart';
import 'package:graduation_final/signup_data.dart';

import 'package:provider/provider.dart';

class Sign_Up extends StatefulWidget {
  const Sign_Up({super.key, required});

  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _username = TextEditingController();

  bool obsecuretext = true;
  var formkey3 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF064278),

      body: Form(
        key: formkey3,
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
                        const Center(
                          child: Text(
                            'Create A Parent Account',
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        return null;
                      },
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (value) {},
                      /* onChanged: (value) {
                      print(value);
                    },*/
                      decoration: InputDecoration(
                        fillColor: Colors.white38.withOpacity(0.9),
                        filled: true,
                        // hinttext disappered when i start writting
                        labelText: 'Email Address',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.black),
                          borderRadius: BorderRadius.circular(35),
                        ),
                        prefixIcon: const Icon(
                          Icons.email,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Username is required';
                        }
                        return null;
                      },
                      controller: _username,
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
                      controller: _passwordController,
                      keyboardType: TextInputType.text,
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
                        controller: _passwordController,
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

                    /* Row(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon:const Icon(Icons.android_rounded, size: 25),
                          label: const Text("Sign Up With Google"),
                          style: ElevatedButton.styleFrom(shape: const StadiumBorder(),backgroundColor: Colors.grey,),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment:MainAxisAlignment.center,

                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.facebook, size: 18),
                          label: const Text("Sign Up With Facebook",),
                          style: ElevatedButton.styleFrom(shape: const StadiumBorder(),backgroundColor: Colors.grey,),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),*/
                    Center(
                      child: SizedBox(
                        width: 150,
                        child: ElevatedButton(
                            onPressed: () {
                              SignupData data = Provider.of<SignupData>(context,
                                  listen: false);
                              data.ParentEmail = _emailController.text;
                              data.ParentPassword = _passwordController.text;
                              data.ParentUserName = _username.text;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Sign_Up_Child()),
                              );

                              if (formkey3.currentState!.validate()) {
                                debugPrint(_passwordController.text);
                                debugPrint(_emailController.text);
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
                            )),
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
