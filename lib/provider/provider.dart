



import 'package:flutter/material.dart';
import 'package:invoice/presentation/to_do_list_screen/to_do_list_screen.dart';
import 'package:provider/provider.dart';

class PasswordModel extends ChangeNotifier {
  String enteredPassword = "";
  final String correctPassword = "123450"; // Updated password

  void addToPassword(int digit) {
    enteredPassword += digit.toString();
    notifyListeners();
  }

  void clearPassword() {
    enteredPassword = "";
    notifyListeners();
  }

  bool isPasswordCorrect() {
    return enteredPassword == correctPassword;
  }
}



class DigitButton extends StatelessWidget {
  final int digit;

  DigitButton({required this.digit});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<PasswordModel>(context, listen: false).addToPassword(digit);

        final passwordModel = Provider.of<PasswordModel>(context, listen: false);
        if (passwordModel.enteredPassword.length == 6) {
          if (passwordModel.isPasswordCorrect()) {
            print("Password is correct!");
            // Notify listeners that the password is correct
            passwordModel.notifyListeners();
          } else {
            print("Incorrect password. Try again.");
            passwordModel.clearPassword();
          }
        }
      },
      child: Container(
        margin: EdgeInsets.all(15),
        width: 60, // Set the width
        height: 60, // Set the height
        decoration: BoxDecoration(
        
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            digit.toString(),
            style: TextStyle(fontSize: 24), // Set the font size
          ),
        ),
      ),
    );
  }
}





class LockScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SingleChildScrollView(
        child: Center(
          child: Consumer<PasswordModel>(
            builder: (context, passwordModel, _) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start, // Align to the top
                children: [
                  SizedBox(height: 50,),
                  Text("Unlock using your PIN",style: TextStyle(fontSize: 20),),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < passwordModel.correctPassword.length; i++)
                        Container(
                          margin: EdgeInsets.all(5),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                            child: Text(
                              passwordModel.enteredPassword.length > i
                                  ? "*"
                                  : "",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 1; i <= 3; i++)
                        DigitButton(digit: i),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 4; i <= 6; i++)
                        DigitButton(digit: i),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 7; i <= 9; i++)
                        DigitButton(digit: i),
                    ],
                  ),
                  SizedBox(height: 20),
                  DigitButton(digit: 0),
                  SizedBox(height: 20),
                  // Continue button
                  if (passwordModel.isPasswordCorrect())

                    InkWell(
                      onTap: () {
                               // Navigate to the next page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ToDoListScreen(),
                          ),
                        );
                      },
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width/1.5,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Center(child: Text("CONTINUE",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),),
                      ),
                    )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
