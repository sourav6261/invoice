import 'package:flutter/material.dart';
import 'package:invoice/model/log.dart';
import 'package:provider/provider.dart';

class OudtPut extends StatefulWidget {
  const OudtPut({super.key});

  @override
  State<OudtPut> createState() => _OutPutState();
}

class _OutPutState extends State<OudtPut> {
  final _formKey = GlobalKey<FormState>();
  String projectName = '';
  String clientAddress = '';
  String description = '';
  double hours = 0;
  double unitPrice = 0;
  double _discountRate = 0.12; // 12% discount
  @override
  Widget build(BuildContext context) {
    final projectProvider = Provider.of<ProjectProvider>(context);

    double subtotal = projectProvider.totalUnitPrice;
    double discountAmount = subtotal * _discountRate;
    double total = subtotal - discountAmount;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16.0),
                  const Text(
                    'Project Items',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 0),
                  DataTable(
                    columns: const [
                      DataColumn(label: Text('S.No')),
                      DataColumn(label: Text('Description')),
                      DataColumn(label: Text('Hrs')),
                      DataColumn(label: Text('Price')),
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
            ),
            const SizedBox(height: 16.0),
            // Display the total without tax below the DataTable
            Text(
              'Total: \$${total.toStringAsFixed(2)}', // Format the total as needed
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
