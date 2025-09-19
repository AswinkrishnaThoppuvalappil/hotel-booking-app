import 'package:booking_app/BottomNavigationBar.dart';
import 'package:booking_app/Checkin_Checkout_AddRoom.dart';
import 'package:booking_app/Login.dart';
import 'package:booking_app/Search_page.dart';
import 'package:booking_app/SplashScreen.dart';
import 'package:booking_app/account_info_page.dart';
import 'package:booking_app/autoOtpverification.dart';
import 'package:booking_app/create_account_page.dart';
import 'package:booking_app/deatils_Page.dart';
import 'package:booking_app/firebase_options.dart';
import 'package:booking_app/homePage.dart';
import 'package:booking_app/homePage1.dart';
import 'package:booking_app/mybooking.dart';
import 'package:booking_app/rewardPage.dart';
import 'package:booking_app/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Padding(padding: const EdgeInsets.all(8.0), child: Splashscreen()),
    );
  }
}
