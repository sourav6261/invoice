import 'package:flutter/material.dart';
import 'package:invoice/model/log.dart';
import 'package:provider/provider.dart';

class OutPut extends StatefulWidget {
  const OutPut({super.key});

  @override
  State<OutPut> createState() => _OutPutState();
}

class _OutPutState extends State<OutPut> {
  // final _formKey = GlobalKey<FormState>();
  String projectName = '';
  String clientAddress = '';
  String description = '';
  double hours = 0;
  double unitPrice = 0;
  double _taxRate = 0.18; // 18% tax
  double _discountRate = 0.12; // 12% discount
  @override
  Widget build(BuildContext context) {
    final projectProvider = Provider.of<ProjectProvider>(context);

    double subtotal = projectProvider.totalUnitPrice;
    double taxAmount = subtotal * _taxRate;
    double discountAmount = subtotal * _discountRate;
    double total = subtotal + taxAmount - discountAmount;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16.0),
                const Text(
                  'Project Items',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 0),
                DataTable(
                  columns: const [
                    DataColumn(label: Text('S.No')),
                    DataColumn(label: Text('Description')),
                    DataColumn(label: Text('Hrs')),
                    DataColumn(label: Text(' Price')),
                  ],
                  rows: projectProvider.projectItems.map((item) {
                    return DataRow(
                      cells: [
                        DataCell(
                          Text(
                              '${projectProvider.projectItems.indexOf(item) + 1}'),
                        ),
                        DataCell(Text(item.description)),
                        DataCell(Text(item.hours.toString())),
                        DataCell(Text(item.unitPrice.toString())),
                      ],
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16.0),
              ],
            ),

            const SizedBox(height: 16.0),
            // Display the total below the DataTable
            Text(
              'Total: ₹${total.toStringAsFixed(2)}', // Format the total as needed
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}



//   // Widget _buildProjectItemInput() {
//   //   return Column(
//   //     children: [
//   //       TextFormField(
//   //         decoration: InputDecoration(labelText: 'Description'),
//   //         onChanged: (value) {
//   //           setState(() {
//   //             description = value;
//   //           });
//   //         },
//   //       ),
//   //       TextFormField(
//   //         decoration: InputDecoration(labelText: 'Hours'),
//   //         onChanged: (value) {
//   //           setState(() {
//   //             hours = double.parse(value);
//   //           });
//   //         },
//   //       ),
//   //       TextFormField(
//   //         decoration: InputDecoration(labelText: 'Unit Price'),
//   //         onChanged: (value) {
//   //           setState(() {
//   //             unitPrice = double.parse(value);
//   //           });
//   //         },
//   //       ),
//   //     ],
//   //   );
//   // }

//    // body: SafeArea(
//       //   child: Column(
//       //     children: [
//       //       Form(
//       //         key: _formKey,
//       //         child: Column(
//       //           crossAxisAlignment: CrossAxisAlignment.start,
//       //           children: [
//       //             SizedBox(height: 16.0),
//       //             Text(
//       //               'Project Items',
//       //               style:
//       //                   TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//       //             ),
//       //             SizedBox(height: 0),
//       //             DataTable(
//       //               columns: const [
//       //                 DataColumn(label: Text('S.No')),
//       //                 DataColumn(label: Text('Description')),
//       //                 DataColumn(label: Text('Hrs')),
//       //                 DataColumn(label: Text('Unit Price')),
//       //                 DataColumn(label: Text('Total')),
//       //               ],
//       //               rows: projectProvider.projectItems.map((item) {
//       //                 return DataRow(
//       //                   cells: [
//       //                     DataCell(
//       //                       Text(
//       //                           '${projectProvider.projectItems.indexOf(item) + 1}'),
//       //                     ),
//       //                     DataCell(Text(item.description)),
//       //                     DataCell(Text(item.hours.toString())),
//       //                     DataCell(Text(item.unitPrice.toString())),
//       //                     DataCell(Text((item.hours * item.unitPrice)
//       //                         .toStringAsFixed(2))),
//       //                   ],
//       //                 );
//       //               }).toList(),
//       //             ),
//       //             SizedBox(height: 16.0),
//       //             SizedBox(height: 16.0),
//       //           ],
//       //         ),
//       //       ),
//       //     ],
//       //   ),
//       // ),




//       //    body: Padding(
//       //   padding: const EdgeInsets.all(8.0),
//       //   child: ListView.builder(
//       //     itemCount: projectProvider.projectItems.length,
//       //     itemBuilder: (context, index) {
//       //       final item = projectProvider.projectItems[index];
//       //       return Column(
//       //         crossAxisAlignment: CrossAxisAlignment.start,
//       //         children: [
//       //           Text('S.No: ${index + 1}'),
//       //           Text('Description: ${item.description}'),
//       //           Text('Hours: ${item.hours.toString()}'),
//       //           Text('Unit Price: ${item.unitPrice.toString()}'),
//       //           Text(
//       //               'Total: ${(item.hours * item.unitPrice).toStringAsFixed(2)}'),
//       //           SizedBox(height: 16.0), // Add spacing between items
//       //         ],
//       //       );
//       //     },
//       //   ),
//       // ),