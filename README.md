# invoice

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



Scaffold(
      appBar: AppBar(
        title: const Text('PDF Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: inputController1,
              decoration: const InputDecoration(labelText: 'Input 1'),
            ),
            TextField(
              controller: inputController2,
              decoration: const InputDecoration(labelText: 'Input 2'),
            ),
            TextField(
              controller: inputController3,
              decoration: const InputDecoration(labelText: 'Input 3'),
            ),
            TextField(
              controller: inputController4,
              decoration: const InputDecoration(labelText: 'Input 4'),
            ),
            TextField(
              controller: inputController5,
              decoration: const InputDecoration(labelText: 'Input 5'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final pdfFile = await generatePdf(
                  inputController1.text,
                  inputController2.text,
                  inputController3.text,
                  inputController4.text,
                  inputController5.text,
                );

                Navigator.pushNamed(context, '/pdf', arguments: pdfFile);
              },
              child: const Text('Generate PDF'),
            ),
          ],
        ),
      ),
    );


    pdf function


     Future<String> generatePdf(String input1, String input2, String input3,
      String input4, String input5) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (context) {
          return pw.Container(
            child: pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [
                pw.Text('Input 1: $input1'),
                pw.Text('Input 2: $input2'),
                pw.Text('Input 3: $input3'),
                pw.Text('Input 4: $input4'),
                pw.Text('Input 5: $input5'),
              ],
            ),
          );
        },
      ),
    );

    final externalDir = await getExternalStorageDirectory();
    final pdfFile = '${externalDir!.path}/generated.pdf';
    final file = File(pdfFile);
    await file.writeAsBytes(await pdf.save());

    return pdfFile;
  }



  //finel

  import 'package:flutter/material.dart';
import 'package:invoice/model/log.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:provider/provider.dart';

class OutPut extends StatefulWidget {
  const OutPut({super.key});

  @override
  State<OutPut> createState() => _OutPutState();
}

class _OutPutState extends State<OutPut> {
  final _formKey = GlobalKey<FormState>();
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

    // Create a PDF document
    final pdf = pw.Document();

    // Build the PDF content
    pdf.addPage(
      pw.Page(
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Project Invoice', style: pw.TextStyle(fontSize: 24)),
              pw.SizedBox(height: 20),
              for (int index = 0;
                  index < projectProvider.projectItems.length;
                  index++)
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('S.No: ${index + 1}'),
                    pw.Text(
                        'Description: ${projectProvider.projectItems[index].description}'),
                    pw.Text(
                        'Hours: ${projectProvider.projectItems[index].hours.toString()}'),
                    pw.Text(
                        'Unit Price: ${projectProvider.projectItems[index].unitPrice.toString()}'),
                    pw.SizedBox(height: 16),
                  ],
                ),
              pw.Text(
                'Subtotal: $subtotal',
                style:
                    pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
              ),
              pw.Text(
                'Tax: $taxAmount',
                style:
                    pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
              ),
              pw.Text(
                'Discount: $discountAmount',
                style:
                    pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
              ),
              pw.Text(
                'Total: $total',
                style:
                    pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
              ),
            ],
          );
        },
      ),
    );

    // Save the PDF to a file (optional)
    // final output = File('example.pdf');
    // await pdf.save().then((value) {
    //   output.writeAsBytesSync(value);
    // });

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Save the PDF to the device and open it (optional)
            pdf.save().then((value) {
              // Use a package like 'open_file' to open the generated PDF
              // See https://pub.dev/packages/open_file
            });
          },
          child: Text('Generate PDF'),
        ),
      ),
    );
  }





////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



User Registration and Authentication:

User registration and login through email, social media, or phone number.
Password reset and recovery options.

Product Catalog:
Browse and search for products.
Product categories and filters.
Product details with images, descriptions, prices, and reviews.

Shopping Cart:
Add and remove items from the cart.
View and edit the cart.
Calculate and display the total order value.

Checkout and Payment:
Secure checkout process.
Multiple payment options (credit/debit cards, mobile wallets, PayPal, etc.).
Billing and shipping address management.
Order summary and confirmation.

Order History and Tracking:
View past orders.
Track order status and delivery.

Wishlist/Favorites:
Share wishlists with others.

User Profiles:
Edit profile information.
View order history and saved addresses.
Manage payment methods.

Notifications:
Push notifications for order updates, promotions, and offers.

Reviews and Ratings:
Rate and review products.
Read and filter product reviews.

Search and Filters:
Advanced search functionality.
Sorting and filtering options for products.

Customer Support:
Live chat or customer support chatbot.
Contact forms and FAQs.

Inventory Management (for sellers):
Add, edit, and delete product listings.
Manage product stock levels.
Seller registration and verification.
Seller dashboard for managing products and orders.
Security:

Secure payment processing (SSL certificates).
User data protection (GDPR compliance).
Shipping and Delivery:

Shipping cost calculation.
Order tracking with real-time updates.
Multiple shipping options (standard, express, etc.).
Returns and Refunds:

Return request submission.
Refund status tracking.
Localization:

Multiple languages and currencies.
Geolocation for local deals and store locations.

Social Sharing:
Share products on social media.
Social login and integration.
Analytics and Reporting:
Sales reports.
User behavior analytics.
Inventory tracking and insights.

Admin Panel:
Dashboard for managing users, products, orders, and content.

Mobile Responsiveness:
Support for mobile devices and tablets.
Offline Access (optional):

Some apps offer offline access for browsing and saving items.

Augmented Reality (AR) Shopping (optional):
Try-before-you-buy features using AR.

Voice Search (optional):
Voice-activated product search and commands.
Integration with Third-Party Services:
Integration with external payment gateways, shipping providers, and marketing tools.

Push Notifications:
Sending updates, promotions, and alerts to users' devices.