import 'package:flutter/material.dart';
import 'package:graduation_final/your_score_star.dart';

class CompletedMission extends StatefulWidget {
  static const String routeName = "completed mission";

  const CompletedMission({super.key});

  @override
  State<CompletedMission> createState() => _CompletedMissionState();
}

class _CompletedMissionState extends State<CompletedMission> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/Space.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 50, left: 50, top: 350),
              child: const Text(
                "  Great! You Have \n Done The Missions ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //  Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: const[
                //     SizedBox(
                //       width: 10.0,
                //     ),
                //
                //      Icon(Icons.arrow_back, size: 20 , color: Colors.white,),
                //
                //      SizedBox(
                //        width: 5.0,
                //      )
                //
                //      Text('Back' ,
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 20,
                //
                //       ),
                //       textAlign: TextAlign.end,
                //     ),
                //
                //   ],
                // ),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const YourScoreStar(),
                        ));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'See Scores',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.end,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 20,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10.0,
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
