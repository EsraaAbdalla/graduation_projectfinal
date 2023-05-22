// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables, non_constant_identifier_names, unnecessary_brace_in_string_interps, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graduation_final/bef/login_child.dart';
import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

var AllChildren;
var friendRequests;
// var newData;

class Tab2 extends StatefulWidget {
  const Tab2({super.key});

  @override
  State<Tab2> createState() => _Tab2State();
}

class _Tab2State extends State<Tab2> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    http.Response response = await http.get(Uri.parse(
        "https://graduation-project-svct.onrender.com/admin/allchilds"));
    if (response.statusCode == 200) {
      setState(() {
        var newData = json.decode(response.body);
        print(newData[0]['friendsRequests']);
        AllChildren = newData as List;
      });
      // friendRequests = await SharedPreferences.getInstance();
      // friendRequests.setString('friendRequests', newData['friendRequests']);
      // friendRequests = newData['friendsRequests'] as List;
      // print(friendRequests);
    } else {
      print(response.statusCode);
    }
  }

  void AddFriend(id) async {
    final url = Uri.parse(
        'https://graduation-project-svct.onrender.com/child/$childId/friend-requests');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({'friendId': id});

    final response = await http.post(url, headers: headers, body: body);
    print(id);
    print(body);
    print(childId);
    if (response.statusCode == 200) {
      // Friend request sent successfully
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Friend request sent')),
      );
    } else {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to send friend request')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.grey.withOpacity(0.9),
        title: const Text('Adding Friends'),
      ),
      body: ReorderableListView.builder(
          itemBuilder: (BuildContext context, int index) {
            var gender = AllChildren[index]['childGender'];
            print(gender);
            return Card(
              key: Key('${index}'),
              child: ListTile(
                leading: gender == "male"
                    ? Image.asset('images/male.png')
                    : Image.asset('images/female.png'),
                title: Text(AllChildren[index]['childName']),
                subtitle: Text(AllChildren[index]['childGender']),
                trailing: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      AddFriend(AllChildren[index]['_id']);
                    }),
              ),
            );
          },
          itemCount: AllChildren == null ? 0 : AllChildren.length,
          onReorder: ((int oldIndex, int newIndex) {
            setState(() {
              if (newIndex > oldIndex) {
                newIndex -= 1;
              }
              final int tmp = AllChildren[oldIndex];
              AllChildren.removeAt(oldIndex);
              AllChildren.insert(newIndex, tmp);
            });
          })),
    );
  }
}
