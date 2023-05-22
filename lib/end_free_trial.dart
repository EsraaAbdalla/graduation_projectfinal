import 'package:flutter/material.dart';
import 'package:graduation_final/plan.dart';

class OppsScreen extends StatelessWidget {
  static const String routeName = "oops";

  const OppsScreen({super.key});

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
                "  OOPS ! Your Free \n   Trial Has Ended ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PlanScreen(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    'See Plans',
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
                  )
                ],
              ),
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
