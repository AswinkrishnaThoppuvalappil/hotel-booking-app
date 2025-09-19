import 'dart:async';
import 'dart:isolate';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:booking_app/BottomNavigationBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Autootpverification extends StatefulWidget {
  final String phoneNumber;
  final String username;

  const Autootpverification({
    super.key,
    required this.phoneNumber,
    required this.username,
  });

  @override
  State<Autootpverification> createState() => _AutootpverificationState();
}

class _AutootpverificationState extends State<Autootpverification> {
  final TextEditingController otpController = TextEditingController();
  final String staticOtp = "1234"; // ✅ fixed OTP

  @override
  void initState() {
    super.initState();

    // ⏳ simulate receiving OTP automatically after 2 seconds
    Timer(const Duration(seconds: 2), () {
      otpController.text = staticOtp;

      // ✅ Automatically verify once filled
      verifyOtp();
    });
  }

  void verifyOtp() {
    if (otpController.text.trim() == staticOtp) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Bottomnavigationbar(User: "${widget.username}"),
        ),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("❌ Invalid OTP")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          //color: Colors.blueAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                "Verify with OTP",
                maxFontSize: 30,
                maxLines: 1,
                minFontSize: 18,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              AutoSizeText(
                "waiting for automatoically detect an  OTP sent To +919048887393, Wrong number ",
                maxFontSize: 20,
                maxLines: 1,
                minFontSize: 18,
              ),
              PinCodeTextField(
                appContext: context,
                length: 4, // number of OTP digits
                controller: otpController,
                keyboardType: TextInputType.number,
                readOnly: true,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                  selectedColor: Colors.black,
                  inactiveFillColor: Colors.black,
                ),
              ),

              const SizedBox(height: 30),
              const SizedBox(height: 30),

              ElevatedButton(onPressed: () {}, child: const Text("Verify OTP")),
            ],
          ),
        ),
      ),
    );
  }
}

// 
//
//
//
///////////////////////////////////////////////////////////////////////
//import 'dart:async';
// import 'package:flutter/material.dart';
// import 'BottomNavigationBar.dart';

// class Autootpverification extends StatefulWidget {
//   final String phoneNumber;

//   const Autootpverification({super.key, required this.phoneNumber});

//   @override
//   State<Autootpverification> createState() => _AutootpverificationState();
// }

// class _AutootpverificationState extends State<Autootpverification> {
//   final TextEditingController otpController = TextEditingController();
//   final String staticOtp = "1234"; // ✅ fixed OTP

//   @override
//   void initState() {
//     super.initState();

//     // ⏳ simulate receiving OTP automatically after 2 seconds
//     Timer(const Duration(seconds: 2), () {
//       otpController.text = staticOtp;

//       // ✅ Automatically verify once filled
//       verifyOtp();
//     });
//   }

//   void verifyOtp() {
//     if (otpController.text.trim() == staticOtp) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => Bottomnavigationbar()),
//       );
//     } else {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text("❌ Invalid OTP")));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("OTP Verification")),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("Enter OTP sent to ${widget.phoneNumber}"),
//             const SizedBox(height: 20),
//             TextField(
//               controller: otpController,
//               keyboardType: TextInputType.number,
//               readOnly: true, // ✅ prevents typing since auto-filled
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: "Waiting for OTP...",
//               ),
//             ),
//             const SizedBox(height: 20),
//             const Text("🔄 Detecting OTP automatically..."),
//           ],
//         ),
//       ),
//     );
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }

