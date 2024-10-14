// //import 'dart:html';

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:qr_app/viewer.dart';
// //import 'package:qr_flutter/qr_flutter.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

// class SuccessPage extends StatefulWidget {
//   const SuccessPage({super.key});

//   @override
//   State<SuccessPage> createState() => _SuccessPageState();
// }

// class _SuccessPageState extends State<SuccessPage> {
//   final qrKey = GlobalKey(debugLabel: "QR");
//   Barcode? barcode;
//   QRViewController? controller ; 

//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
  
//   @override
//   void reassemble() async{
//     super.reassemble();
    
//     if(Platform.isAndroid){
//       await controller!.pauseCamera();
//     }
//     controller!.resumeCamera();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//            // SizedBox(height: 40,),
//             Container(
//               height:459.7,
//               width: 356.47,
//               child: Column(
                
//                 children: [
//                 Image.asset('assets/images/LankaQR_Banner.png'),
//                 SizedBox(height:237, width: 237, child: buildQrView(context),)
//               ]),
//             ),

//           ]
//         ),)

//         ?
//   void onQRViewCreated(QRViewController controller) {
//     setState(() => this.controller = controller);{
    
//     //controller.scannedDataStream .listen( (this.barcode = barcode));
//   }
//   }
