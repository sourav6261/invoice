// import 'package:flutter/material.dart';
// import 'package:invoice/main.dart';
// import 'package:invoice/scr/home.dart';
// import 'package:provider/provider.dart';

// class LandingPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     ScheduleProvider scheduleProvider = Provider.of<ScheduleProvider>(context);
//     scheduleProvider.loadSchedule();

//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                       Container(
//                   height: 50,
//                   width: 60,
//                   child: Image(image: AssetImage("assets/neo-io-logo-vector.png")),
//                 ),
//                 ],
//               ),
//               // Text(scheduleProvider.scheduleAvailable
//               //     ? "Hi Jose, you are available on ${scheduleProvider.selectedSlots.join(', ')}"
//               //     : "Hi Jose, you are not available."),
//               SizedBox(height: 50,),
//               Text("Hello Jose!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
//               SizedBox(height: 10,),
//               Text("Let’s get started",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16),),
//               SizedBox(height: 100,),
//                 Text(scheduleProvider.scheduleAvailable
//                   ? "Hi Jose, you are available on ${scheduleProvider.selectedSlots.join(', ')}"
//                   : "Hi Jose, you are not available."),

//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Color.fromARGB(197, 29, 86, 245),
//         onPressed: () {
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => SchedulingPage()));
//           // Add the action you want to perform when the button is pressed.
//         },
//         child: Icon(Icons.add,size: 30,),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:invoice/main.dart';
import 'package:invoice/scr/home.dart';
import 'package:provider/provider.dart';

class GreetingScreen extends StatefulWidget {
  @override
  State<GreetingScreen> createState() => _GreetingScreenState();
}

class _GreetingScreenState extends State<GreetingScreen> {
    DateTime selectedDate = DateTime.now(); // Initially selected date
  @override
  Widget build(BuildContext context) {
    final preferencesProvider = Provider.of<UserPreferencesProvider>(context);
    final preferences = preferencesProvider.preferences;

    // Create a list of strings to store the selected day and time options
    List<String> selectedOptions = [];

    for (var day in preferences.availability.keys) {
      for (var time in preferences.availability[day]!.keys) {
        if (preferences.availability[day]![time] == true) {
          selectedOptions.add('$day $time');
        }
      }
    }

    // Function to create a row of selected options
    Widget buildOptionRow(List<String> options) {
      return Row(
        children: options.map((option) => Text(
          option,
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
        )).toList(),
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(169, 44, 121, 246),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 60,
                    child: Image(image: AssetImage("assets/neo-io-logo-vector.png")),
                  ),
                     TextButton(
                        onPressed: () => _selectDate(context),
                        child: Text(
                          "${selectedDate.toLocal()}"
                              .split(' ')[0], // Display selected date
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                "Hello Jose!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(height: 5),
              Text(
                "Let’s get started",
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 23),
              ),
              SizedBox(height: 130),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "You’re available in",
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 28),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    buildOptionRow(selectedOptions.take(3).toList()), // Convert to list and show only 3 items per row
                    SizedBox(height: 5), // Add space between rows
                    buildOptionRow(selectedOptions.skip(3).take(3).toList()), // Convert to list and show next 3 items
                    SizedBox(height: 5),
                    // Continue this pattern for more rows as needed
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

    Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000), // Set the minimum date
      lastDate: DateTime(2101), // Set the maximum date
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
