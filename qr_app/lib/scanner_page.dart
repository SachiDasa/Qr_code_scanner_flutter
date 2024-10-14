import 'package:flutter/material.dart';
import 'success.dart';  
//import 'package:image_picker/image_picker.dart';
//import 'package:qr_code_tools/qr_code_tools.dart';
import 'viewer.dart';
import 'failure.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});
  
  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {

  // Future<void> pickImageFromGallery() async {
  //   final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

  //   if (pickedFile != null) {
  //     try {
  //       final qrCode = await QrCodeToolsPlugin.decodeFrom(pickedFile.path);
  //       if (qrCode != null) {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => DashboardPage(barcodeHistory: qrCode), 
  //           ),
  //         );
  //       } else {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(builder: (context) => FailurePage()), 
  //         );
  //       }
  //     } catch (e) {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => FailurePage()), 
  //       );
  //     }
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Home_Screen.png"),
                fit: BoxFit.cover,
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: 382.56,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/LankaQR.png',
                  width: 139,
                  height: 139,
                  fit: BoxFit.cover,
                ),
                const Text(
                  'Qr Code Validator',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Use this application to validate any LankaQR codes',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
                const Text(
                  'easily. fast. and accurately.',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
                const SizedBox(height: 20),
                Column(
                  children: const [
                    Text(
                      'Dev Note - This above element should be scaled',
                      style: TextStyle(fontSize: 10, color: Color(0xFFC90000)),
                    ),
                    Text(
                      'according to the screen size',
                      style: TextStyle(fontSize: 10, color: Color(0xFFC90000)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          InkWell( 
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SuccessPage()),
              );
            },
            child: Container(
              height: 123,
              width: 279,
              padding: EdgeInsets.all(20),
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
                  Image.asset(
                    'assets/icons/scan.png',
                    width: 92,
                    height: 56,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'SCAN',
                        style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF201B51),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'QR',
                        style: TextStyle(fontSize: 10, color: Color(0xFFC90000)),
                      ),
                      Text(
                        'CODE',
                        style: TextStyle(fontSize: 10, color: Color(0xFF201B51)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          const Text(
            'Scan QR code from Gallery',
            style: TextStyle(fontSize: 15, color: Color(0xFF201B51)),
          ),
          Text(
            'Once upload the QR to the App, you will be ',
            style: TextStyle(fontSize: 10, color: Color(0xFF201B51)),
          ),
          const Text(
            ' redirected to the result screen.',
            style: TextStyle(fontSize: 10, color: Color(0xFF201B51)),
          ),
          SizedBox(height: 20),
                    Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          //SizedBox(),
          InkWell(
            //onTap: () async => pickImage(),
            child: Container(
             height:71 ,
             width: 228,
             padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),],
              ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                    Text(
                        'Choose QR Code',
                        style: TextStyle(fontSize: 15, color: Color(0xFF525252)),
                    ),
                   ],
                  ),
            ),
          ),

          Container(
           height:71 ,
           width: 74,
           padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),],
            ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                  Image.asset(
                  'assets/icons/upload.png',
                  width: 30, 
                  height: 30,
                  ),
                ],
                  
                ),
          )
          ]),
          SizedBox(height: 20),
          Text(
            'Dev note - 1. choose file from dashed line button and',
            style: TextStyle(fontSize: 10, color: Color(0xFFC90000)),
          ),
          Text(
            'upload with upload icon button',
            style: TextStyle(fontSize: 10, color: Color(0xFFC90000)),
          ), 
          SizedBox(height: 20),
          Text(
            'This application developed by DirectPay for developers,',
            style: TextStyle(fontSize: 10, color: Color(0xFF525252)),
          ), 
          Text(
            'merchants and community. Version 1.0',
            style: TextStyle(fontSize: 10, color: Color(0xFF525252)),
          ), 
        ]
        ),
        );
  }
}
