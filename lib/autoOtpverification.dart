import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:booking_app/BottomNavigationBar.dart';
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
  int otpTimeout = 60; // seconds
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    startTimer();
    // ⏳ simulate receiving OTP automatically after 2 seconds
    Timer(const Duration(seconds: 2), () {
      otpController.text = staticOtp;

      // ✅ Automatically verify once filled
      verifyOtp();
    });
  }

  void startTimer() {
    otpTimeout = 60; // reset timer
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (otpTimeout == 0) {
        timer.cancel();
      } else {
        setState(() {
          otpTimeout--;
        });
      }
    });
  }

  void verifyOtp() {
    if (otpController.text.trim() == staticOtp) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => Bottomnavigationbar(User: "${widget.username}"),
        ),
        (Route<dynamic> route) => false, 
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
          padding: const EdgeInsets.all(20.0),
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          //color: Colors.blueAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                "Verify with OTP",
                maxFontSize: 30,
                maxLines: 1,
                minFontSize: 18,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              Text.rich(
                TextSpan(
                  text: "Wating to automatically detect an OTP sent to ",
                  style: TextStyle(fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                      text: "${widget.phoneNumber}. ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    TextSpan(
                      text: "Worng number?",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 240,
                    child: PinCodeTextField(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      appContext: context,
                      length: 4,
                      controller: otpController,
                      keyboardType: TextInputType.number,
                      readOnly: true,
                      pinTheme: PinTheme(
                        activeBorderWidth: 0.5,
                        inactiveBorderWidth: 0.5,
                        selectedBorderWidth: 0.5,
                        activeColor: Colors.black,
                        inactiveColor: Colors.black,
                        selectedColor: Colors.black,
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 50,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text('00:$otpTimeout', style: TextStyle(fontSize: 20)),
                ],
              ),

              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {},

                child: Text(
                  'Resend OTP',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Text(
                    'Having trouble logging in ? ',
                    style: TextStyle(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Get help',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
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

