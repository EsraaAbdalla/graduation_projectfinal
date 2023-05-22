// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously, unnecessary_brace_in_string_interps, avoid_print, unnecessary_null_comparison, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:graduation_final/bef/login_child.dart';
import 'package:graduation_final/tab2.dart';
import 'package:http/http.dart' as http;

var friendId;

class Tab3 extends StatefulWidget {
  const Tab3({super.key});

  @override
  State<Tab3> createState() => _Tab3State();
}

class _Tab3State extends State<Tab3> {
  @override
  void initState() {
    super.initState();
    fetchFriendRequests();
  }

  Future<void> fetchFriendRequests() async {
    final url = Uri.parse(
        'https://graduation-project-svct.onrender.com/child/friendrequests');
    final response = await http.post(
      url,
      body: {
        "userId": childId,
      },
    );
    print(childId.runtimeType);
    if (response.statusCode == 200) {
      // Friend requests retrieved successfully
      setState(() {
        friendRequests = jsonDecode(response.body);

        print(friendRequests);
      });
    } else {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to retrieve friend requests')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.grey.withOpacity(0.9),
        title: const Text('Friend Requests'),
      ),
      body: ReorderableListView.builder(
          itemBuilder: (BuildContext context, int index) {
            var gender = friendRequests[index]['childGender'];
            print(gender);
            return Card(
              key: Key('${index}'),
              child: ListTile(
                leading: gender == "male"
                    ? Image.asset('images/male.png')
                    : Image.asset('images/female.png'),
                title: Text(friendRequests[index]['childName']),
                subtitle: Text(friendRequests[index]['childGender']),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                        onPressed: () {
                          friendId = friendRequests[index]['_id'];
                          void AcceptRequest(id) async {
                            final url = Uri.parse(
                                'https://graduation-project-svct.onrender.com/child/$childId/friend-requests/$friendId');
                            final response = await http.put(url);
                            print(friendId);
                            print(childId);
                            if (response.statusCode == 200) {
                              // Friend request accepted successfully
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Friend request accepted')),
                              );
                            } else {
                              // Handle error
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Failed to accept friend request')),
                              );
                            }
                          }

                          AcceptRequest(friendId);
                        },
                        child: const Text("Accept")),
                    TextButton(
                        onPressed: () {
                          friendId = friendRequests[index]['_id'];
                          void RejectRequest(id) async {
                            final url = Uri.parse(
                                'https://graduation-project-svct.onrender.com/child/$childId/friend-requests/$friendId');
                            final response = await http.put(url);
                            if (response.statusCode == 200) {
                              // Friend request rejected successfully
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Friend request rejected')),
                              );
                            } else {
                              // Handle error
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Failed to reject friend request')),
                              );
                            }
                          }

                          RejectRequest(friendId);
                        },
                        child: const Text("Reject"))
                  ],
                ),
              ),
            );
          },
          itemCount: friendRequests == null ? 0 : friendRequests.length,
          onReorder: ((int oldIndex, int newIndex) {
            setState(() {
              if (newIndex > oldIndex) {
                newIndex -= 1;
              }
              final int tmp = friendRequests[oldIndex];
              friendRequests.removeAt(oldIndex);
              friendRequests.insert(newIndex, tmp);
            });
          })),
    );
  }
}
