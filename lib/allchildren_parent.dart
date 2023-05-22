/// ignore_for_file: unused_field, unnecessary_brace_in_string_interps, prefer_typing_uninitialized_variables, avoid_print

// ignore_for_file: avoid_print, unused_field, prefer_typing_uninitialized_variables, prefer_const_declarations, unnecessary_brace_in_string_interps, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graduation_final/bef/login_parent_screen.dart';

import 'package:http/http.dart' as http;

String ChildName = '';
String ChildPassword = '';
String ChildGender = '';
String ChildAge = '';

class ChildrenPage extends StatefulWidget {
  const ChildrenPage({super.key});

  @override
  State<ChildrenPage> createState() => _ChildrenPageState();
}

class _ChildrenPageState extends State<ChildrenPage> {
  final List<int> _itemList = List<int>.generate(60, (index) => index);

  @override
  void initState() {
    super.initState();
    // fetchData();
    print(jsonList);
    getParentnameById(parentId);
  }

  // Future<void> fetchData() async {
  //   final url = Uri.parse(
  //       'https://graduation-project-svct.onrender.com/parent/allchilds');
  //   final headers = {'Authorization': 'Bearer ${token}'};
  //   final response = await http.get(url, headers: headers);
  //   if (response.statusCode == 200) {
  //     var newData = json.decode(response.body);
  //     print(newData);
  //     jsonList = newData as List;
  //   } else {
  //     // Handle error
  //     print('Error fetching data: ${response.statusCode}');
  //   }
  // }

  Future<void> _deleteChild(id) async {
    print(id);
    final url =
        'https://graduation-project-svct.onrender.com/admin/deletechild';
    final body = json.encode({"Id": id});
    print(body);
    final response = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'}, body: body);
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print("A network error occurred");
    }
  }

  dynamic Data;
  //Add  Another Child:
  void SaveChildData() async {
    final headers = {'Authorization': 'Bearer ${token}'};
    print("ana hena");
    var url = Uri.parse(
        'https://graduation-project-svct.onrender.com/parent/addchild');
    var response = await http.post(url, headers: headers, body: {
      'childName': ChildName,
      'childPassword': ChildPassword,
      'childGender': ChildGender,
      'childAge': ChildAge,
    });

    if (response.statusCode == 200) {
      fetchData().then((jsonList) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ChildrenPage()),
        );
      });
      print('Child data saved successfully');
    } else {
      print('Failed to save Child data');
    }
  }

  @override
  Widget build(BuildContext context) {
    getParentnameById(parentId);
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('images/father.png'),
        title: Text("${user['parentName']}"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          title: Container(
                            height: 35.0,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: const Center(
                              child: Text(
                                'Add Child',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          content: Column(
                            children: [
                              TextField(
                                onChanged: (text) {
                                  ChildName = text;
                                },
                                decoration: const InputDecoration(
                                    //  border: OutlineInputBorder(),
                                    hintText: ' Child Name',
                                    hintStyle: TextStyle(
                                      color: Colors.blue,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue))),
                              ),
                              const SizedBox(
                                height: 25.0,
                              ),
                              TextField(
                                onChanged: (text) {
                                  ChildPassword = text;
                                },
                                decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue)),
                                  hintText: ' Child Password',
                                  hintStyle: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 25.0,
                              ),
                              TextField(
                                onChanged: (text) {
                                  ChildGender = text;
                                },
                                decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue)),
                                    hintText: ' Child Gender',
                                    hintStyle: TextStyle(
                                      color: Colors.blue,
                                    )),
                              ),
                              const SizedBox(
                                height: 25.0,
                              ),
                              TextField(
                                onChanged: (text) {
                                  ChildAge = text;
                                },
                                decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue)),
                                    hintText: ' Child Age',
                                    hintStyle: TextStyle(
                                      color: Colors.blue,
                                    )),
                              ),
                            ],
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('CANCEL'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                print(ChildName);
                                SaveChildData();
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text(
                    "Add Child",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  )),
            ),
          ),
        ],
      ),
      body: ReorderableListView.builder(
          itemBuilder: (BuildContext context, int index) {
            var gender = jsonList[index]['childGender'];
            print(gender);
            return Card(
              key: Key('${index}'),
              child: ListTile(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: ((context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          backgroundColor: Colors.blue,
                          title: Text(
                            "Name :${jsonList[index]['childName']}",
                            style: const TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                          content: Text(
                            " Gender: ${jsonList[index]['childGender']}",
                            style: const TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  "ok",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0),
                                ))
                          ],
                        );
                      }));
                },
                leading: gender == "male"
                    ? Image.asset('images/male.png')
                    : Image.asset('images/female.png'),
                title: Text(jsonList[index]['childName']),
                subtitle: Text(jsonList[index]['childGender']),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    _deleteChild(jsonList[index]["_id"]);

                    setState(() {
                      jsonList.removeAt(index);
                    });
                  },
                ),
              ),
            );
          },
          itemCount: jsonList == null ? 0 : jsonList.length,
          onReorder: ((int oldIndex, int newIndex) {
            setState(() {
              if (newIndex > oldIndex) {
                newIndex -= 1;
              }
              final int tmp = jsonList[oldIndex];
              jsonList.removeAt(oldIndex);
              jsonList.insert(newIndex, tmp);
            });
          })),
    );
  }
}
