



import 'package:flutter/material.dart';
import 'package:invoice/main.dart';
import 'package:invoice/scr/indroscreen.dart';
import 'package:provider/provider.dart';



class SecondScreen extends StatefulWidget {
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  Map<String, Map<String, bool?>> _availability = {
    'Sunday': {
      'Morning': false,
      'Afternoon': false,
      'Evening': false,
    },
    'Monday': {
      'Morning': false,
      'Afternoon': false,
      'Evening': false,
    },
    'Tuesday': {
      'Morning': false,
      'Afternoon': false,
      'Evening': false,
    },
    'Wednesday': {
      'Morning': false,
      'Afternoon': false,
      'Evening': false,
    },
    'Thursday': {
      'Morning': false,
      'Afternoon': false,
      'Evening': false,
    },
    'Friday': {
      'Morning': false,
      'Afternoon': false,
      'Evening': false,
    },
    'Saturday': {
      'Morning': false,
      'Afternoon': false,
      'Evening': false,
    },
  };

  String? selectedDay;

  @override
  Widget build(BuildContext context) {
    final preferencesProvider = Provider.of<UserPreferencesProvider>(context);

    return Scaffold(
    
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Container(
                    height: 50,
                    width: 60,
                    child: Image(
                        image: AssetImage("assets/neo-io-logo-vector.png")),
                  ),
                  SizedBox(height: 5,),
                  Text("Set your weekly hours",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 25),),
                Column(
                  children: _availability.keys.map((day) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CheckboxListTile(
                          title: Text(day),
                          value: selectedDay == day,
                          onChanged: (value) {
                            setState(() {
                              if (value!) {
                                selectedDay = day;
                              } else {
                                selectedDay = null;
                              }
                            });
                          },
                          controlAffinity: ListTileControlAffinity
                              .leading, // Set control on the left
                          activeColor: Colors
                              .green, // Set the color for the checked checkbox
                        ),
                        if (selectedDay == day)
                          Row(
                            children: _availability[day]!.keys.map((time) {
                              return Row(
                                children: [
                                  Checkbox(
                                    value: _availability[day]![time] ?? false,
                                    onChanged: (value) {
                                      setState(() {
                                        _availability[day]![time] = value;
                                      });
                                    },
                                    activeColor: Colors
                                        .green, // Set the color for the checked checkbox
                                  ),
                                  Text(time),
                                ],
                              );
                            }).toList(),
                          ),
                        if (selectedDay != _availability.keys.last)
                          Divider(), // Add a divider if it's not the last day
                      ],
                    );
                  }).toList(),
                ),
                InkWell(
                  onTap: () {
                      final userPreferences = UserPreferences()
                      ..availability = _availability;
        
                    preferencesProvider.updatePreferences(userPreferences);
        
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GreetingScreen()),
                    );
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(169, 44, 121, 246),
                      borderRadius: BorderRadius.circular(10)
                
                    ),
                    child: Center(child: Text("Save"),),
                  ),
                ),
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}
