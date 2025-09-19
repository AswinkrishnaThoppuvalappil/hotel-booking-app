import 'package:booking_app/BottomNavigationBar.dart';
import 'package:booking_app/autoOtpverification.dart';
import 'package:booking_app/create_account_page.dart';
import 'package:booking_app/homePage1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class loginDetails {
  String? phone;
  String? password;
  String? username;
  String? email;
  String? image;

  loginDetails({
    this.phone,
    this.password,
    this.username,
    this.email,
    this.image,
  });

  loginDetails.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    password = json['password'];
    username = json['username'];
    email = json['email'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['username'] = this.username;
    data['email'] = this.email;
    data['image'] = this.image;
    return data;
  }
}

class LoginPage extends StatefulWidget {
  String? name;

  LoginPage({super.key, required this.name});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController MobileNumberController = TextEditingController();
  final TextEditingController _pass = TextEditingController();

  String _responseMessage = "";
  bool _isHidden = true;

  Future<void> makePostRequest() async {
    Dio res = Dio();
    final formData = FormData.fromMap({
      "phone": MobileNumberController.text,
      "password": _pass.text,
    });
    Future<void> saveUser(String phone, String username) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("Phone", phone);
      await prefs.setString("username", username);
    }

    final url = "https://hotel.b4production.com/getandpostlog";

    try {
      var response = await res.post(url, data: formData);

      if (response.statusCode == 201) {
        final ResponseData = response.data;
        await saveUser(ResponseData["phone"], ResponseData["username"]);

        final loginRegister = loginDetails.fromJson(ResponseData);

        setState(() {
          _responseMessage = "Request Was Successful ✅";
        });

        // ✅ Navigate to OTP page if login success
        final phone = MobileNumberController.text.trim();
        final Password = _pass.text.trim();
        if (phone.isNotEmpty && phone.length == 10 && Password.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Autootpverification(
                phoneNumber: "+91$phone",
                username: "${widget.name}",
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("📱 Enter a valid phone number")),
          );
        }
      } else {
        setState(() {
          _responseMessage =
              "❌ Login failed: ${response.statusMessage ?? "Unknown error"}";

          print(_responseMessage);
        });
      }
    } catch (e) {
      setState(() {
        _showErrorMessage();
        print("erorrrrrrrrrrrrrrrrrrrrrr $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.amber,
            content: Text(
              "Login failed ❌Try Again!",
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      });
    }
  }

  void _showSuccessMessage() {
    if (_responseMessage.isNotEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(_responseMessage)));
    }
  }

  void _showErrorMessage() {
    if (_responseMessage.isNotEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(_responseMessage)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true, // default is true, but set explicitly
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                //This Container 1 for Heading and welcome message starting //
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/Login_background1.jpg"),
                      fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode(
                        Colors.white.withOpacity(0.1), // apply opacity
                        BlendMode.dstIn,
                      ),
                    ),
                  ),
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height / 3,
                  child: Stack(
                    children: [
                      //Website Name Starts Here//
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Booking",
                                style: TextStyle(
                                  color: const Color.fromARGB(252, 11, 11, 11),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                width: 60,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.transparent,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    ".com",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Website Name Ends Here//
                      //Welcome Message And Offer Texts Starts here//
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 140),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome to\nBooking.com",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Get 2000 Rs off when you sign up!",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Welcome Message And Offer Texts Starts here//
                    ],
                  ),
                ),
                //This Container 1 for Heading and welcome message closing //
                SizedBox(height: 20),
                //This Container 2 For input Field And Login Button  starts Here//
                Expanded(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,

                    height: MediaQuery.sizeOf(context).height * 8,
                    color: Colors.white,
                    //Column 1 container 2 Starting //
                    child: Column(
                      children: [
                        //Container For Input Field Starts Here//
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 1,
                                color: const Color.fromARGB(255, 232, 231, 231),
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 25,
                                      height: 15,
                                      child: Image.asset(
                                        "assets/Flag_of_India.svg.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  "+91",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        controller: MobileNumberController,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          LengthLimitingTextInputFormatter(10),
                                        ],
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Enter Mobile Number",
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //Container For Input Field Endss Here//
                        //This Container 2 For input Field And Login Button  starts Here//
                        Expanded(
                          child: Container(
                            width: MediaQuery.sizeOf(context).width,

                            height: MediaQuery.sizeOf(context).height * 10,
                            color: Colors.white,
                            //Column 1 container 2 Starting //
                            child: Column(
                              children: [
                                //Container For Input Field for password Starts Here//
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    width: MediaQuery.sizeOf(context).width,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        width: 1,
                                        color: const Color.fromARGB(
                                          255,
                                          232,
                                          231,
                                          231,
                                        ),
                                      ),
                                    ),
                                    child: Expanded(
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextField(
                                            controller: _pass,
                                            obscureText: _isHidden,

                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Enter your Password",
                                              prefixIcon: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    _isHidden = !_isHidden;
                                                  });
                                                },
                                                icon: Icon(
                                                  _isHidden
                                                      ? Icons.visibility_off
                                                      : Icons.visibility,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //Container For Input Field for Password Endss Here//
                                SizedBox(height: 10),
                                //Container for Login Button starting//
                                SizedBox(
                                  width: MediaQuery.sizeOf(context).width - 20,
                                  height: 45,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white, //
                                      backgroundColor: Colors.orange,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusGeometry.circular(30),
                                      ),
                                    ),
                                    onPressed: () {
                                      makePostRequest();
                                      _showSuccessMessage();
                                    },
                                    child: Text(
                                      "Login",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CreateAccountPage(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Don't Have An Accout? Create One",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            //Column 1 container ending  //
                          ),
                        ),
                        //This Container 2 For input Field And Login Button ends Here//
                        //This Container 3 For google signin And facebook sign in Button starts Here//
                        Expanded(
                          child: Container(
                            width: MediaQuery.sizeOf(context).width,
                            color: Colors.white,
                            child: Center(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Expanded(
                                      child: Container(
                                        width: MediaQuery.sizeOf(context).width,

                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,

                                          children: [
                                            SizedBox(height: 20),
                                            Container(
                                              width:
                                                  MediaQuery.sizeOf(
                                                    context,
                                                  ).width /
                                                  7,
                                              height: 2,
                                              color: Colors.transparent,
                                            ),
                                            Text("or Login With"),
                                            Container(
                                              width:
                                                  MediaQuery.sizeOf(
                                                    context,
                                                  ).width /
                                                  5,
                                              height: 2,
                                              color: Colors.transparent,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(width: 10),
                                      GestureDetector(
                                        onTap: () {},
                                        child: CircleAvatar(
                                          minRadius: 15,
                                          maxRadius: 20,
                                          backgroundColor: Colors.white,
                                          backgroundImage: AssetImage(
                                            "assets/Google__G_logo.png",
                                          ),
                                        ),
                                      ),

                                      GestureDetector(
                                        onTap: () {},
                                        child: CircleAvatar(
                                          minRadius: 15,
                                          maxRadius: 20,
                                          backgroundImage: AssetImage(
                                            "assets/fb_logo.png",
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                    ],
                                  ),
                                  Center(
                                    child: Container(
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  Bottomnavigationbar(
                                                    User: "Guest",
                                                  ),
                                            ),
                                          );
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 15,
                                          ),
                                          child: Text(
                                            "Continue as guest",
                                            style: TextStyle(
                                              color: Colors.black,
                                              //fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        //This Container 3 For google signin And facebook sign in Button Ends Here//
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
