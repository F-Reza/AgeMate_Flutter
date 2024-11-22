
import 'package:flutter/material.dart';
import '../constant/color.dart';
import '../controller/age_calculator.dart';
import '../widget/custom_divider.dart';
import '../widget/custom_list_tile.dart';
import '../widget/summary_card_builder.dart';


class ResultPage extends StatefulWidget {
  const ResultPage({ super.key });

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF025eff),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.auto_graph_outlined),
            SizedBox(width: 10,),
            Text('AgeMate',style: TextStyle(fontWeight: FontWeight.w500,fontStyle: FontStyle.italic),),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                CustomListTile(
                  leading: "Date of birth",
                  trailing: getFormatedDate(selectedBrithDate),
                ),
                const SizedBox(height: 20,),
                CustomListTile(
                  leading: "Today's",
                  trailing: getFormatedDate(selectedCurrentDate),
                ),
              ],
            )
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(15),
            height: 120,
            decoration: BoxDecoration(
              color: const Color(0xFF025eff),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Age"),
                      Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: AgeController.age(selectedBrithDate, today: selectedCurrentDate).years.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),),
                          const TextSpan(
                            text: ' Years',
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ],
                       ),
                      ),
                      Text("${AgeController.age(selectedBrithDate, today: selectedCurrentDate).months.toString()} Months | ${AgeController.age(selectedBrithDate, today: selectedCurrentDate).days.toString()} Days"),
                    ],
                  ),
                ),
                const CustomDivider(),
                Expanded(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     const Text("Next Birthday"),
                     Text(AgeController.findDayName().toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                     Text("${AgeController.timeToNextBirthday(selectedBrithDate, fromDate: selectedCurrentDate).months} Months | ${AgeController.timeToNextBirthday(selectedBrithDate, fromDate: selectedCurrentDate).days} Days"),
                   ],
                 ),
               )
              ],
            )
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color(0xFF025eff),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              children: [
                Text("Age in", style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w700),),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SummaryCardBuilder(
                          title: "Years",
                          subTitle: AgeController.age(selectedBrithDate, today: selectedCurrentDate).years.toString(),
                        ),
                        const SizedBox(height: 20,),
                        SummaryCardBuilder(
                          title: "Weeks",
                          subTitle: (AgeController.age(selectedBrithDate, today: selectedCurrentDate).years * 52).toString(),
                          fontSize: 14,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SummaryCardBuilder(
                          title: "Months",
                          subTitle: (AgeController.age(selectedBrithDate, today: selectedCurrentDate).years * 12).toString(),
                        ),
                        const SizedBox(height: 20,),
                        SummaryCardBuilder(
                          title: "Hours",
                          subTitle: AgeController.hoursBetween(selectedBrithDate, selectedCurrentDate).toString(),
                          fontSize: 14,
                        ),
                      ],
                    ),
                     Column(
                       children: [
                         SummaryCardBuilder(
                           title: "Days",
                           subTitle: AgeController.daysBetween(selectedBrithDate, selectedCurrentDate).toString(),
                         ),
                         const SizedBox(height: 20,),
                         SummaryCardBuilder(
                           title: "Minutes",
                           subTitle: AgeController.minutesBetween(selectedBrithDate, selectedCurrentDate).toString(),
                           fontSize: 14,
                         ),
                       ],
                     )
                  ],
                )
              ],
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 56,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              style: ButtonStyle(
                  backgroundColor:  WidgetStateProperty.all<Color>(const Color(0xFF025eff),),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )
                  )
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
    );
  }
}







