import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'scanner_page.dart';  
//import 'retrev.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: LoadPage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {}

class LoadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/Loading_Screen_Image.png',
            width: MediaQuery.of(context).size.width,
            height: 546,
            fit: BoxFit.cover,
          ),
          Container(
            color: const Color(0xFF201B51),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.35,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell( onTap:() {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ScannerPage()),
                    );
                    },
                  child: Image.asset(
                    'assets/images/LankaQR.png',
                    width: 139,
                    height: 139,
                  ),
                ),
                const Text(
                  'Qr Code Validator',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(height: 20),
                const Text(
                  'From',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
                const Text(
                  'DirectPay',
                  style: TextStyle(fontSize: 15, color: Colors.white),
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
          )
        ],
      ),
    );
  }
}
