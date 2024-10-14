import 'package:flutter/material.dart';
//import 'package:qr_app/viewer.dart';
import 'package:qr_app/scanner_page.dart';


class FailurePage extends StatelessWidget {
  const FailurePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
            color: const Color(0xFF201B51),
            width: MediaQuery.of(context).size.width,
            height: 230,
            child: Column( 
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                const SizedBox(height: 30),
                Image.asset(
              'assets/images/LankaQR.png',
               height: 139,
               width: 139,
              fit: BoxFit.cover
            ),
              const Text(
              'Qr Code Validator',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ])
               
            ),
            const SizedBox(height: 19),
            const Text(
              'Scan Result',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            Image.asset(
              'assets/icons/wrong.png',
               height: 75,
               width: 75,
              fit: BoxFit.cover
            ),
            const SizedBox(height: 32,),
            const Text(
              'Validation Failed.',
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
            const SizedBox(height: 20),
            const Text(
              'No Data found',
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
            const SizedBox(height:40),
            InkWell(
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => ScannerPage())); 
                // Navigate to the Dashboard
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
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
                child: const Text(
                  'Back to Scanner',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 20),
             InkWell(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardPage())); 
              },
              child: Container(
                //padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
              'assets/icons/home.png',
               height: 36,
               width: 36,
              fit: BoxFit.cover
            ),
                ),
              ),
              ],),
            ),
    );
  }
}
