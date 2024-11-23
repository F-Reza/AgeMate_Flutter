import 'package:flutter/material.dart';
import '../controller/age_calculator.dart';
import '../data/health_tips.dart'; // Import the file containing the health tips dataset.

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  Map<String, dynamic> _getHealthTips(int age) {
    // Find the appropriate health tips based on age
    for (var tip in healthTips) {
      final range = tip['ageRange'].split('-');
      final minAge = int.parse(range[0]);
      final maxAge = int.parse(range[1]);

      if (age >= minAge && age <= maxAge) {
        return tip;
      }
    }
    return {
      'ageRange': 'N/A',
      'title': 'No Data',
      'tips': ['No health tips available for this age range.']
    };
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final int age = AgeController.age(selectedBrithDate, today: selectedCurrentDate).years;
    final Map<String, dynamic> healthTip = _getHealthTips(age);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF025eff),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.auto_graph_outlined),
            SizedBox(width: 10),
            Text(
              'AgeMate',
              style: TextStyle(fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Date of birth",
                  style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.normal),
                ),
                Text(
                  getFormatedDate(selectedBrithDate),
                  style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Today's",
                  style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.normal),
                ),
                Text(
                  getFormatedDate(selectedCurrentDate),
                  style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  height: 120,
                  decoration: BoxDecoration(
                    color: const Color(0xFF025eff),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Age",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: age.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: ' Years',
                                    style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "${AgeController.age(selectedBrithDate, today: selectedCurrentDate).months} Months | ${AgeController.age(selectedBrithDate, today: selectedCurrentDate).days} Days",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        height: 100,
                        color: Colors.black,
                        width: 1,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Next Birthday"),
                            Text(
                              AgeController.findDayName().toString(),
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                            Text(
                              "${AgeController.timeToNextBirthday(selectedBrithDate, fromDate: selectedCurrentDate).months} Months | ${AgeController.timeToNextBirthday(selectedBrithDate, fromDate: selectedCurrentDate).days} Days",
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Positioned(
                  top: 20,
                  right: 15,
                  child: Icon(Icons.access_alarm, size: 35, color: Colors.white),
                )
              ],
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: const Color(0xFF025eff),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                children: [
                  const Text("Age in", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const Text("Years",style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500, height: 1.5)),
                              Text(AgeController.age(selectedBrithDate, today: selectedCurrentDate).years.toString(),
                                style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, height: 1.5),),
                            ],
                          ),

                          const SizedBox(height: 20,),
                          Column(
                            children: [
                              const Text("Weeks",style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500, height: 1.5)),
                              Text((AgeController.age(selectedBrithDate, today: selectedCurrentDate).years * 52).toString(),
                                style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold, height: 1.5),),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Column(
                            children: [
                              const Text("Months",style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500, height: 1.5)),
                              Text((AgeController.age(selectedBrithDate, today: selectedCurrentDate).years * 12).toString(),
                                style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, height: 1.5),),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Column(
                            children: [
                              const Text("Hours",style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500, height: 1.5)),
                              Text(AgeController.hoursBetween(selectedBrithDate, selectedCurrentDate).toString(),
                                style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold, height: 1.5),),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Column(
                            children: [
                              const Text("Days",style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500, height: 1.5)),
                              Text(AgeController.daysBetween(selectedBrithDate, selectedCurrentDate).toString(),
                                style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, height: 1.5),),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Column(
                            children: [
                              const Text("Minutes",style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500, height: 1.5)),
                              Text(AgeController.minutesBetween(selectedBrithDate, selectedCurrentDate).toString(),
                                style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold, height: 1.5),),
                            ],
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Stack(
              children: [
                Container(
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color(0xFF025eff),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Health Tips',
                            style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Age ${healthTip['ageRange']}: ${healthTip['title']}",
                        style: const TextStyle(color: Colors.white70, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      ...List.generate(
                        healthTip['tips'].length,
                            (index) => Text(
                          "-> ${healthTip['tips'][index]}",
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                ),
                const Positioned(
                  top: 20,
                  right: 15,
                    child: Icon(Icons.health_and_safety,size: 35,color: Colors.white,),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              height: 56,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(const Color(0xFF025eff)),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                child: const Text(
                  'Re-Calculate',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
