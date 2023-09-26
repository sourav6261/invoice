// main.dart

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:invoice/model/log.dart';
import 'package:invoice/product.dart';
import 'package:invoice/stack/stack.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProjectProvider()),
      ],
      child: MaterialApp(
          title: 'Flutter Project Calculator',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: AnimatedSplashScreen(
            splash: const Image(
              image: AssetImage(
                "assets/Logo.png",
              ),
            ),
            duration: 3000,
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: Color.fromARGB(255, 50, 151, 234),
            nextScreen: Stack(
              children: [
                DrawerScreen(),
                HomeScreen(),
              ],
            ),
          )),
    );
  }
}

// class InputPage extends StatefulWidget {
//   @override
//   _InputPageState createState() => _InputPageState();
// }

// class _InputPageState extends State<InputPage> {
//   double xOffset = 0;
//   double yOffset = 0;

//   bool isDrawerOpen = false;
//   @override
//   void initState() {
//     super.initState();
//     context.read<ProjectProvider>().loadCounts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final countNotifier = context.watch<ProjectProvider>();
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: 20),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       isDrawerOpen
//                           ? GestureDetector(
//                               child: Icon(Icons.arrow_back_ios),
//                               onTap: () {
//                                 setState(() {
//                                   xOffset = 0;
//                                   yOffset = 0;
//                                   isDrawerOpen = false;
//                                 });
//                               },
//                             )
//                           : GestureDetector(
//                               child: Icon(Icons.menu),
//                               onTap: () {
//                                 setState(() {
//                                   xOffset = 290;
//                                   yOffset = 80;
//                                   isDrawerOpen = true;
//                                 });
//                               },
//                             ),
//                       Text(
//                         'Beautiful Drawer',
//                         style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.black87,
//                             decoration: TextDecoration.none),
//                       ),
//                       Container(),
//                     ],
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text(
//                       "Create Invoice",
//                       style: TextStyle(fontSize: 20),
//                     ),
//                     TextButton(
//                       onPressed: () {},
//                       child: const Text(
//                         "CANCEL",
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 200,
//                 ),
//                 Center(
//                   child: InkWell(
//                     onTap: () {
//                       countNotifier.incrementTaxableCount();
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const InvoiceNonTaxable()));
//                     },
//                     child: Container(
//                       height: 100,
//                       width: 300,
//                       decoration: BoxDecoration(
//                         color: Colors.blue[100],
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(color: Colors.black),
//                       ),
//                       child: const Center(
//                         child: Text("Taxable"),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 Center(
//                   child: InkWell(
//                     onTap: () {
//                       countNotifier.incrementNonTaxableCount();
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => ProjectDetailsScreen()));
//                     },
//                     child: Container(
//                       height: 100,
//                       width: 300,
//                       decoration: BoxDecoration(
//                         color: Colors.blue[100],
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(color: Colors.black),
//                       ),
//                       child: const Center(
//                         child: Text("Non Taxable"),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 280,
//                 ),
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => InputPage()));
//                   },
//                   child: Container(
//                     height: 100,
//                     width: MediaQuery.of(context).size.width,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Colors.grey,
//                       border: Border.all(color: Colors.black),
//                     ),
//                     child: const Center(
//                       child: Text(
//                         "HISTORY",
//                         style: TextStyle(fontSize: 20, color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
