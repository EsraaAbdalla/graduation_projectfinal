import 'package:flutter/material.dart';
import 'package:graduation_final/plan_container.dart';
import 'package:graduation_final/unlock_planets.dart';

class PlanScreen extends StatefulWidget {
  static const String routeName = 'plan';

  const PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  List<bool> isSelected = [true, false];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // bool vertical = false;

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
              margin: const EdgeInsets.only(top: 100),
              child: const Center(
                child: Text(
                  "Plans",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                  ),
                  // textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(35)),
                  child: ToggleButtons(
                    // direction: vertical ? Axis.vertical : Axis.horizontal,
                    onPressed: (int index) {
                      setState(() {
                        // looping through the list of booleans values
                        for (int i = 0; i < isSelected.length; i++) {
                          // checking for the index value
                          if (i == index) {
                            // one button is always set to true
                            isSelected[i] = true;
                            selectedIndex = i;
                          } else {
                            // other two will be set to false and not selected
                            isSelected[i] = false;
                          }
                        }
                      });
                    },
                    isSelected: isSelected,

                    selectedColor: Colors.black,
                    color: Colors.white,
                    fillColor: Colors.white,
                    disabledColor: Colors.white,
                    renderBorder: true,
                    borderColor: Colors.black,
                    borderRadius: BorderRadius.circular(25),
                    borderWidth: 1.6,
                    selectedBorderColor: Colors.white,
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                    // direction: vertical ? Axis.vertical : Axis.horizontal,
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: Text('Monthly'),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: Text('Annually'),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            selectedIndex == 0
                ? PlanContainer(
                    price: "1.99 \$",
                  )
                : PlanContainer(
                    price: "18.99 \$",
                  ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const unlock(),
                    ));
              },
              child: Container(
                width: 400,
                height: 50.0,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "See What Will Be Unlocked",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 20,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),

/*
            FloatingActionButton.extended(
              onPressed: (){

                },
              label: Row(
                children: [
                  Text("See What Will Be Unlocked" ,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,

                  ),
                  ),
                  SizedBox(width: 5,),
                  Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: Colors.white,
                  ),
                ],
              ),
              backgroundColor: Colors.black,
            ),
*/

            /*  Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop(CompletedMission.routeName);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.arrow_back,
                        size: 20,
                        color: Colors.white,
                      ),
                      Text(
                        'Back',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(QuestionOneScreen.routeName);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.end,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 20,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),*/
          ],
        ),
      ),
    );
  }
}
