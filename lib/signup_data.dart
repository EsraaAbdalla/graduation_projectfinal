// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class SignupData extends ChangeNotifier {
  late String ParentEmail;
  late String ParentUserName;
  late String ParentPassword;
  late String ParentGender;
  late String ChildUserName;
  late String ChildPassword;
  late String ChildGender;
  late int childAge;

  SignupData(
      this.ParentEmail,
      this.ParentUserName,
      this.ParentPassword,
      this.ParentGender,
      this.ChildUserName,
      this.ChildPassword,
      this.ChildGender,
      this.childAge);
}
