import 'package:flutter/material.dart';
import 'scanner_page.dart';
import 'failure.dart';

class DashboardPage extends StatelessWidget {
  final List<String> barcodeHistory;

  const DashboardPage({Key? key, required this.barcodeHistory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use SafeArea to avoid intrusions by system UI
      body: SafeArea(
        child: Column(
          children: [
            // Header Section
            Container(
              color: const Color(0xFF201B51),
              width: double.infinity,
              height: 230,
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/LankaQR.png',
                    height: 139,
                    width: 139,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'QR Code Validator',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
            // Barcode History List
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: barcodeHistory.isEmpty
                    ? const Center(
                        child: Text(
                          'No barcode history available.',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      )
                    : ListView.builder(
                        itemCount: barcodeHistory.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 2,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: ListTile(
                              leading: const Icon(Icons.qr_code),
                              title: Text(
                                barcodeHistory[index],
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
            // Navigation Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FailurePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      primary: Colors.white,
                    ),
                    child: const Text(
                      'Go to Failure Page',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Home Icon Button
                      InkWell(
                        onTap: () {
                          // Optionally navigate or perform an action
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Image.asset(
                            'assets/icons/home.png',
                            height: 36,
                            width: 36,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Back to Scanner Button
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ScannerPage()),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: const Text(
                            'Back to Scanner',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
