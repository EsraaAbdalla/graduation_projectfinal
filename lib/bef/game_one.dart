import 'dart:async';

import 'package:flutter/material.dart';

import 'login_child.dart';
import 'login_parent_screen.dart';

class GameOne extends StatefulWidget {
  const GameOne({super.key});

  @override
  State<GameOne> createState() => _GameOneState();
}

class _GameOneState extends State<GameOne> {
  double _initial = 0.0;
  bool _showButton = false;

  void update() {
    Timer.periodic(const Duration(microseconds: 100), (timer) {
      setState(() {
        _initial = _initial + 0.0001;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    // Wait for 4 seconds before showing the button
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _showButton = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    update();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/home background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: _showButton
                    ? SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 60.0,
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.black, // Background color
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Login_Child()),
                                  );
                                },
                                child: const Text(
                                  'Child',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.black, // Background color
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Login()),
                                );
                              },
                              child: const Text(
                                'Parent',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : LinearProgressIndicator(
                        backgroundColor: Colors.black,
                        valueColor: const AlwaysStoppedAnimation(
                          Colors.white,
                        ),
                        minHeight: 8.0,
                        value: _initial,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
