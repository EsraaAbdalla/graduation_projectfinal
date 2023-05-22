// ignore_for_file: library_private_types_in_public_api, unused_field, non_constant_identifier_names

import 'package:flutter/material.dart';

class AddFriendPage extends StatefulWidget {
  const AddFriendPage({super.key});

  @override
  _AddFriendPageState createState() => _AddFriendPageState();
}

class _AddFriendPageState extends State<AddFriendPage> {
  final _formKey = GlobalKey<FormState>();
  late String _friendName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Friend'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Friend Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _friendName = value!;
                },
              ),
              const SizedBox(height: 16),
              RaisedButton(
                child: const Text('Add Friend'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Process form data and add friend to list
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  RaisedButton({required Text child, required Null Function() onPressed}) {}
}
