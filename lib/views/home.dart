
import 'package:agemate/views/result.dart';
import 'package:flutter/material.dart';
import '../constant/color.dart';
import '../controller/age_calculator.dart';
class HomePage extends StatefulWidget {
  const HomePage({ super.key });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFecf2fe),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Image.asset('images/age.jpg'),
            const Text(
              'Discover exactly how old you are and how many days there are until your next birthday.',
              style: TextStyle(
                fontSize: 18,
                height: 1.5,
                fontWeight: FontWeight.w400,
                color: Colors.blueAccent,
              ),
            ),
            const Spacer(),
            const Text(
              'Select date of birth',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF025eff),
              ),
            ),
            const SizedBox(height: 10,),
            InkWell(
              onTap: ()=> _selectDate(context, selectedBrithDate, "BirthDate" ),
              child: IgnorePointer(
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: getFormatedDate(selectedBrithDate),
                      hintStyle: TextStyle(color: textColor),
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                        borderSide: BorderSide(width: 2.0, color: primaryColor),
                      ),
                      suffixIcon: Icon(Icons.calendar_today, color: textColor,)
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            const Text(
              'Select today\'s date',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF025eff),
              ),
            ),
            const SizedBox(height: 10,),
            InkWell(
              onTap: ()=> _selectDate(context, selectedCurrentDate, "CurrentDate"),
              child: IgnorePointer(
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: getFormatedDate(selectedCurrentDate),
                      hintStyle: TextStyle(color: textColor),
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                        borderSide: BorderSide(width: 2.0, color: primaryColor),
                      ),
                      suffixIcon: Icon(Icons.calendar_today, color: textColor,)
                  ),
                ),
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 56,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: (){
                  Route route = MaterialPageRoute(builder: (context)=>const ResultPage());
                  Navigator.push(context, route);
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
                  'Calculate',
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

  //This function used for open date picker 
  Future<void> _selectDate(BuildContext context, DateTime initialDate, String from) async {
    if(from == 'BirthDate') {
       final DateTime? pickedBirthDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2101),
      );
      if (pickedBirthDate != null && pickedBirthDate != selectedBrithDate) {
        setState(() {
        selectedBrithDate = pickedBirthDate;
      });
      }
    } 
    if(from == "CurrentDate"){
      final DateTime? pickedCurrentDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2101),
      );

      if (pickedCurrentDate != null && pickedCurrentDate != selectedCurrentDate) {
        setState(() {
        selectedCurrentDate = pickedCurrentDate;
      });
      }
    }

  }
}





