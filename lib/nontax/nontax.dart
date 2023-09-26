import 'package:flutter/material.dart';
import 'package:invoice/model/log.dart';
import 'package:invoice/model/model.dart';
import 'package:invoice/nontaxs/nontaxtabel.dart';
import 'package:invoice/product.dart';
import 'package:provider/provider.dart';

class ProjectDetailsScreen extends StatefulWidget {
  @override
  _ProjectDetailsScreenState createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  String selectedValue = 'Select from the list'; // Initially selected value
  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now(); // Initially selected date
  String projectName = '';
  String clientAddress = '';
  String _description = '';
  double _hours = 0;
  double _unitPrice = 0;
  bool isLibraryBooksSelected = false;
  bool isAccessTimeSelected = true;
  TextEditingController projectNameController = TextEditingController();
  TextEditingController clientAddressController = TextEditingController();
  TextEditingController gstNoController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController hoursController = TextEditingController();
  TextEditingController unitPriceController = TextEditingController();

  List<TextEditingController> listController = [TextEditingController()];
  double _discountRate = 0.12; // 12% discount
  List<String> dropdownItems = [
    'Select from the list',
    '998314',
    '998313',
    '998311',
  ];

  bool isQty = false;

  @override
  Widget build(BuildContext context) {
    final projectProvider = Provider.of<ProjectProvider>(context);
    final countNotifier = context.watch<ProjectProvider>();
    final iconSelectionProvider = Provider.of<ProjectProvider>(context);

    double subtotal = projectProvider.totalUnitPrice;
    double discountAmount = subtotal * _discountRate;
    double total = subtotal - discountAmount;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Create Invoice",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "CANCEL",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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

                Center(
                  child: Container(
                    height: 150,
                    width: 380,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [Text("GSTIN:"), Text("Invoice:")],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("27AXIPT8068J1ZM"),
                                Text("#0${countNotifier.nonTaxableCount}")
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text("HSN No."),
                            Center(
                              child: DropdownButton<String>(
                                value: selectedValue,
                                onChanged: (newValue) {
                                  setState(() {
                                    selectedValue = newValue!;
                                  });
                                },
                                items: dropdownItems.map((item) {
                                  return DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(item),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    width: 380,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [Text("Project Details")],
                            ),
                            TextFormField(
                              controller: projectNameController,
                              decoration: const InputDecoration(
                                  labelText: 'Project Name'),
                              onChanged: (value) {
                                setState(() {
                                  projectName = value;
                                });
                              },
                            ),
                            TextFormField(
                              controller: clientAddressController,
                              decoration: const InputDecoration(
                                  labelText: "Client's Address"),
                              onChanged: (value) {
                                setState(() {
                                  clientAddress = value;
                                });
                              },
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [Text("GST No.")],
                            ),
                            TextFormField(
                              decoration: const InputDecoration(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 30,
                      width: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.black),
                        color: iconSelectionProvider.isLibraryBooksSelected
                            ? Colors.grey
                            : Colors.white,
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isQty =
                                !isQty; // Toggle the label between "Hrs" and "Qty"
                          });
                          iconSelectionProvider.selectLibraryBooks();
                        },
                        child: Center(
                          child: Icon(
                            Icons.my_library_books,
                            color: iconSelectionProvider.isLibraryBooksSelected
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.black),
                        color: iconSelectionProvider.isAccessTimeSelected
                            ? Colors.grey
                            : Colors.white,
                      ),
                      child: InkWell(
                        onTap: () {
                          iconSelectionProvider.selectAccessTime();
                          setState(() {
                            isQty =
                                !isQty; // Toggle the label between "Hrs" and "Qty"
                          });
                        },
                        child: Center(
                          child: Icon(
                            Icons.access_time,
                            color: iconSelectionProvider.isAccessTimeSelected
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 8,
                ),
                Container(
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Description"),
                        Text(
                          isQty ? 'Hrs' : 'Qty',
                          style: const TextStyle(fontSize: 18.0),
                        ),
                        const Text("Unit Price"),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      height: 60,
                      width: 365,
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        shrinkWrap: true,
                        itemCount: listController.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0),
                                        height: 60,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  height: 30,
                                                  width: 80,
                                                  child: Flexible(
                                                    child: TextFormField(
                                                      decoration:
                                                          const InputDecoration(
                                                        border:
                                                            OutlineInputBorder(),
                                                      ),
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _description = value;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                SizedBox(
                                                  height: 30,
                                                  width: 45,
                                                  child: Flexible(
                                                    child: TextFormField(
                                                      keyboardType:
                                                          TextInputType.number,
                                                      decoration:
                                                          const InputDecoration(
                                                        border:
                                                            OutlineInputBorder(),
                                                      ),
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _hours = double.parse(
                                                              value);
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 23,
                                                ),
                                                SizedBox(
                                                  height: 30,
                                                  width: 80,
                                                  child: Flexible(
                                                    child: TextFormField(
                                                      keyboardType:
                                                          TextInputType.number,
                                                      decoration:
                                                          const InputDecoration(
                                                        border:
                                                            OutlineInputBorder(),
                                                      ),
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _unitPrice =
                                                              double.parse(
                                                                  value);
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final projectItem = ProjectItem(
                            description: _description,
                            hours: _hours,
                            unitPrice: _unitPrice,
                          );
                          projectProvider.addProjectItem(projectItem);
                          projectProvider.addProjectItems(projectItem);

                          // Clear the input fields
                          setState(() {
                            _description = '';
                            _hours = 0;
                            _unitPrice = 0;
                          });
                        }
                      },
                      child: const Text("Add New"),
                    ),
                  ],
                ),

                Center(
                  child: Container(
                    height: 240,
                    width: 380,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Subtotal"),
                              Text(
                                ' $subtotal',
                                style: const TextStyle(fontSize: 18.0),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Discount"),
                              Text(
                                ' $discountAmount',
                                style: const TextStyle(fontSize: 18.0),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 1.0,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Total"),
                              Text(
                                'Total: $total',
                                style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 1.0,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const OudtPut()));
                                  },
                                  child: const Text(
                                    "PREVIEW",
                                    style: TextStyle(color: Colors.black),
                                  )),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 40,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 41, 54, 139),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "DOWNLOAD",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            "Saved in Draft",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                const SizedBox(height: 16.0),

                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final projectItem = ProjectItem(
                        description: _description,
                        hours: _hours,
                        unitPrice: _unitPrice,
                      );
                      projectProvider.addProjectItems(projectItem);
                      projectProvider.addProjectItem(projectItem);

                      // Clear the input fields
                      setState(() {
                        _description = '';
                        _hours = 0;
                        _unitPrice = 0;
                      });
                    }
                  },
                  child: const Text('Add Item'),
                ),

                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Container(
                    height: 100,
                    width: 380,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                      border: Border.all(color: Colors.black),
                    ),
                    child: const Center(
                      child: Text(
                        "CREATE NEW",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to show the date picker
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
