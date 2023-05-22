// ignore_for_file: must_be_immutable, avoid_unnecessary_containers, unnecessary_string_interpolations

import 'package:flutter/material.dart';

class PlanContainer extends StatelessWidget {
  String price;
  PlanContainer({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(30),
        ),
      child: Container(

        child: Column(

          children: [
            Container(
              padding: const EdgeInsets.only(right: 55,left: 55,top: 35,bottom: 10),

              child: Text("$price" ,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 27
                ),
              ),
            ),

            Container(
              width: 250,
              padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 20),
              child: Column(
                children: [

                  Row(
                    children: const [
                      Icon(
                        Icons.more_horiz_outlined,
                        size: 20,
                        color: Colors.white,
                      ),
                      Text(" Unlock More Planets",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400
                        ) ,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: const [
                      Icon(
                        Icons.more_horiz_outlined,
                        size: 20,
                        color: Colors.white,
                      ),
                      Text(" Unlock More Levels",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400
                        ) ,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),

                  Row(
                    children: const [
                      Icon(
                        Icons.more_horiz_outlined,
                        size: 20,
                        color: Colors.white,
                      ),
                      Text(" Unlock More Avatars",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400
                        ) ,
                      ),
                    ],
                  ),
                ],
              ),
            )



          ],
        ),
      ),
    );
  }
}
