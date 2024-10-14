
// import 'dart:io';
//import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_app/scanner_page.dart';
import 'package:qr_app/viewer.dart';
//import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_app/failure.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? barcode;
  QRViewController? controller;
  bool isFlashOn = false;
  List<String> barcodeHistory = []; 

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  void toggleFlash() async {
    await controller?.toggleFlash();  
    bool? flashStatus = await controller?.getFlashStatus();
    setState(() {
      isFlashOn = flashStatus ?? false; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 459.7,
              width: 356.47,
              child: Column(
                children: [
                  Image.asset('assets/images/LankaQR_Banner.png'),
                  SizedBox(
                    height: 237,
                    width: 237,
                    child: buildQrView(context),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 68,
              width: 61,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: InkWell(
                onTap: toggleFlash, 
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      isFlashOn
                          ? 'assets/icons/flash.png'  
                          : 'assets/icons/flash.png',
                      width: 31,
                      height: 31,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Dev Note - This button work as turn on flash. camera opens ',
              style: TextStyle(fontSize: 10, color: Color(0xFFC90000)),
            ),
            Text(
              'Automatically',
              style: TextStyle(fontSize: 10, color: Color(0xFFC90000)),
            ),
            SizedBox(height: 20),
            Text(
              'Place above square direct to the QR code',
              style: TextStyle(fontSize: 15, color: Color(0xFF201B51)),
            ),
            SizedBox(height: 20),
           Text(
                'You will be re-directed to the result screen ',
                style: TextStyle(fontSize: 15, color: Color(0xFF201B51)),
              ),
            Text(
                'automatically.',
                style: TextStyle(fontSize: 15, color: Color(0xFF201B51)),
              ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                // Navigation to DashboardPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ScannerPage()),
                );
              },
              child: Container(
                height: 43,
                width: 163,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Back to Dashboard',
                      style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
          borderRadius: 10,
        ),
      );

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        barcode = scanData;
        if (barcode?.code != null && barcode!.code!.isNotEmpty) {
          barcodeHistory.add(barcode!.code!);
        }
      });
      if (barcode != null && barcode!.code != null && barcode!.code!.isNotEmpty) {
        controller.pauseCamera();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DashboardPage(barcodeHistory: barcodeHistory),
            //builder: (context) => DashboardPage(data: barcode), 
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FailurePage()),
        );
      }
    });
  }
}
