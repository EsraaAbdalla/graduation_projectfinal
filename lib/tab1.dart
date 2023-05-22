// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables, unused_import, unnecessary_brace_in_string_interps, use_build_context_synchronously, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graduation_final/bef/login_child.dart';
import 'package:graduation_final/bef/login_parent_screen.dart';
import 'package:graduation_final/bef/result.dart';
import 'package:graduation_final/fetch_friends.dart';
import 'package:graduation_final/friends.dart';
import 'package:http/http.dart' as http;

var FriendID;

// Future<void> deleteFriend(id) async {
//   final url = Uri.parse(
//       'https://graduation-project-svct.onrender.com/child/$childId/delete-friend/$FriendID');
//   final response = await http.delete(url);

//   if (response.statusCode == 200) {
//     // ScaffoldMessenger.of(context).showSnackBar(
//     //   const SnackBar(
//     //       content: Text(' success delete friend ')),
//     // );
//     fetchAllFriend().then(
//         (value) => Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const Friends(),
//           ),
//         ),
//       );

//     print(" tmaaaaaam");
//     // Friend successfully deleted
//   } else {
//     // ScaffoldMessenger.of(context).showSnackBar(
//     //   const SnackBar(
//     //       content: Text('Failed to delete friend')),
//     // );
//     // Handle error
//   }
// }

// Future<void> fetchAllFriend() async {
//   final url = Uri.parse(
//       'https://graduation-project-svct.onrender.com/child/allfriends');
//   final response = await http.post(url, body: {
//     'userId': childId,
//   });
//   if (response.statusCode == 200) {
//     var newData = json.decode(response.body);

//     friends = newData as List;
//   } else {
//     // Handle error
//     print('Error fetching data: ${response.statusCode}');
//   }
//   return friends;
// }

// var friends;

// Future<void> fetchData() async {
//   final url = Uri.parse(
//       'https://graduation-project-svct.onrender.com/child/allfriends');
//   final response = await http.post(url, body: {
//     'userId': childId,
//   });
//   if (response.statusCode == 200) {
//     var newData = json.decode(response.body);

//     friends = newData as List;
//   } else {
//     // Handle error
//     print('Error fetching data: ${response.statusCode}');
//   }
//   return friends;
// }

class Friend {
  final String name;
  final String status;

  Friend({required this.name, required this.status});
}

class Tab1 extends StatefulWidget {
  const Tab1({super.key});

  @override
  State<Tab1> createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  Future<void> deleteFriend(id) async {
    final url = Uri.parse(
        'https://graduation-project-svct.onrender.com/child/$childId/delete-friend/$FriendID');
    final response = await http.delete(url);

    if (response.statusCode == 200) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //       content: Text(' success delete friend ')),
      // );
      fetchAllFriend().then(
        (value) => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Friends(),
          ),
        ),
      );

      print(" tmaaaaaam");
      // Friend successfully deleted
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //       content: Text('Failed to delete friend')),
      // );
      // Handle error
    }
  }

  @override
  void initState() {
    super.initState();
    // fetchData();
  }
  // final List<Friend> friends = [
  //   Friend(name: 'John Doe', status: 'Online'),
  //   Friend(name: 'Jane Smith', status: 'Offline'),
  //   Friend(name: 'Mark Johnson', status: 'Online'),
  //   // Add more friends here
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.grey.withOpacity(0.9),
        title: const Text('Friend List'),
      ),
      body: ReorderableListView.builder(
          itemBuilder: (BuildContext context, int index) {
            var gender = friends[index]['childGender'];
            print(gender);
            return Card(
              key: Key('${index}'),
              child: ListTile(
                leading: gender == "male"
                    ? Image.asset('images/male.png')
                    : Image.asset('images/female.png'),
                title: Text(friends[index]['childName']),
                subtitle: Text(friends[index]['childGender']),
                trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      FriendID = friends[index]['_id'];

                      deleteFriend(FriendID);
                    }),
              ),
            );
          },
          itemCount: friends == null ? 0 : friends.length,
          onReorder: ((int oldIndex, int newIndex) {
            setState(() {
              if (newIndex > oldIndex) {
                newIndex -= 1;
              }
              final int tmp = friends[oldIndex];
              friends.removeAt(oldIndex);
              friends.insert(newIndex, tmp);
            });
          })),
    );
  }
}
