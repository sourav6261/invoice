import 'package:flutter/material.dart';

class HistoryPag extends StatefulWidget {
  const HistoryPag({super.key});

  @override
  State<HistoryPag> createState() => _HistoryPagState();
}

class _HistoryPagState extends State<HistoryPag> {
  DateTime selectedDate = DateTime.now(); // Initially selected date
  final List<String> items = List.generate(10, (index) => 'Invoice $index');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: ListView.builder(
        itemCount: items.length * 2 - 1, // Double the itemCount for dividers
        itemBuilder: (context, index) {
          // Check if the index is even (for items) or odd (for dividers)
          if (index.isEven) {
            final itemIndex = index ~/ 2; // Calculate the item index
            return ListTile(
              // title: Text(items[itemIndex]),
              leading: Expanded(
                  child: SizedBox(
                height: 100,
                width: 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(items[itemIndex]),
                    Text(
                      "${selectedDate.toLocal()}"
                          .split(' ')[0], // Display selected date
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ],
                ),
              )),
              onTap: () {
                // You can add onTap functionality here if needed
              },
            );
          } else {
            // Return a Divider
            return const Divider();
          }
        },
      ),
    );
  }
}
