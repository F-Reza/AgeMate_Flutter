
import 'package:agemate/views/result.dart';
import 'package:flutter/material.dart';
import '../controller/age_calculator.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({ super.key });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20), // Add padding at the top if needed
              Image.asset(
                'images/age.jpg',
                width: double.infinity, // Adjust image width to fit screen
                height: 200, // Specify a height or make it dynamic
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 0), // Space between widgets
              const Text(
                'Discover exactly how old you are and how many days there are until your next birthday.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Select date of birth',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF025eff),
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () => _selectDate(context, selectedBrithDate, "BirthDate"),
                child: IgnorePointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: getFormatedDate(selectedBrithDate),
                      hintStyle: const TextStyle(color: Colors.black),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        borderSide: BorderSide(width: 2.0, color: Colors.black),
                      ),
                      suffixIcon: const Icon(
                        Icons.calendar_today,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Select today\'s date',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF025eff),
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () => _selectDate(context, selectedCurrentDate, "CurrentDate"),
                child: IgnorePointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: getFormatedDate(selectedCurrentDate),
                      hintStyle: const TextStyle(color: Colors.black),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        borderSide: BorderSide(width: 2.0, color: Colors.black),
                      ),
                      suffixIcon: const Icon(
                        Icons.calendar_today,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 56,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    Route route = MaterialPageRoute(
                      builder: (context) => const ResultScreen(),
                    );
                    Navigator.push(context, route);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xFF025eff),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
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
              const SizedBox(height: 20),
            ],
          ),
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





