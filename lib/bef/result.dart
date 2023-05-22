// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable, prefer_collection_literals, unused_label, dead_code, use_build_context_synchronously, avoid_print, duplicate_import, non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:graduation_final/fetch_friends.dart';
import 'package:graduation_final/friends.dart';
import 'package:graduation_final/friends.dart';

var friends;

var AllFriend;
var grade;

class Result extends StatelessWidget {
  var result;
  Result({super.key, required this.result});
  setGrade() {
    if (result >= 6) {
      grade = "Very Good";
    } else {
      grade = "Good";
    }
  }
  // Future<void> fetchAllFriend() async {

  @override
  Widget build(BuildContext context) {
    check() {
      fetchAllFriend().then(
        (value) => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Friends(),
          ),
        ),
      );
    }

    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/Base.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 50, left: 50, top: 250),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Result : $result ",
                    style: const TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 36),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  result >= 6
                      ? const Text(
                          "Very Good",
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 35,
                              color: Colors.green,
                              fontWeight: FontWeight.w500),
                        )
                      : const Text(
                          "Good",
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 40,
                              color: Colors.green,
                              fontWeight: FontWeight.bold),
                        ),
                  const SizedBox(
                    height: 25,
                  ),
                  result >= 6
                      ? const CircleAvatar(
                          radius: 90.0,
                          backgroundImage: AssetImage("images/very_good4.png"),
                          backgroundColor: Colors.transparent,
                        )
                      : const CircleAvatar(
                          radius: 90.0,
                          backgroundImage: AssetImage("images/good6.png"),
                          backgroundColor: Colors.transparent,
                        ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    setGrade();
                    check();
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const Friends(),
                    //   ),
                    // );
                    // Future<void> fetchAllFriend() async {
                    //   final url = Uri.parse(
                    //       'https://graduation-project-svct.onrender.com/child/allfriends');
                    //   final response = await http.post(url, body: {
                    //     'userId': childId,
                    //   });
                    //   if (response.statusCode == 200) {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => const Friends(),
                    //       ),
                    //     );
                    //     var newData = json.decode(response.body);

                    //     friends = newData as List;
                    //   } else {
                    //     // Handle error
                    //     print('Error fetching data: ${response.statusCode}');
                    //   }
                    //   return friends;
                    // }

                    fetchAllFriend();
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
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 20,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
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
