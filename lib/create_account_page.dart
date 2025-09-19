import 'package:auto_size_text/auto_size_text.dart';
import 'package:booking_app/BottomNavigationBar.dart';
import 'package:booking_app/Login.dart';
import 'package:booking_app/userregistration.modelclass.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _MobileNumber = TextEditingController();
  TextEditingController _Email = TextEditingController();
  String _responseMessage = '';
  //Function For POST Request starting//
  Future<void> makePostRequest() async {
    Dio dio = Dio();
    final formData = FormData.fromMap({
      'username': _name.text,
      'password': _pass.text,
      'phone': _MobileNumber.text,
      "email": _Email.text,
      'image': "jjjjx",
    });
    final url = 'https://hotel.b4production.com/getandpostreg';
    try {
      final Response = await dio.post(url, data: formData);
      print("Response ......$Response");
      if (Response.statusCode == 200) {
        final responseData = Response.data;
        final userRegistration = usersRegistration.fromJson(responseData);
        if (Response.statusCode == 200) {
          setState(() {
            _responseMessage = "Request Was Successful";
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(name: _name.text),
              ),
            );
          });
        }
      }
    } catch (e) {
      print(e);
    }
  }
  //Function For POST Request starting//

  bool _isBoolChecked = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Container For Create Account Text Starts//
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: AutoSizeText(
                          "Create Account ",
                          minFontSize: 20,
                          maxFontSize: 30,
                          maxLines: 7,
                          overflow: TextOverflow
                              .ellipsis, // Add ellipsis if the text overflows
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  //Container For Create Account Text Ends//
                  //Container For Avatar Starts//
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        child: Stack(
                          children: [
                            CircleAvatar(
                              minRadius: 30,
                              maxRadius: 60,
                              backgroundImage: AssetImage(
                                "assets/Person_image.jpg",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  //Container For Avatar  Ends//
                  //Container For Name Input Field Starts Here...//
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        child: TextFormField(
                          controller: _name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ("please Enter Some text");
                            }
                          },

                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text(
                              "Name * ",
                              style: TextStyle(color: Colors.red),
                            ),
                            hintText: "Adith Kiran Xaviour",
                          ),
                        ),
                      ),
                    ),
                  ),

                  //Container For Name Input Field Ends Here...//
                  //Container For Password Input Field Starts Here...//
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        child: TextFormField(
                          controller: _pass,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ("please Enter Some text");
                            }
                          },

                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text(
                              "Password * ",
                              style: TextStyle(color: Colors.red),
                            ),
                            hintText:
                                "Must Contain Alphaneumerical Letters and atleast one Special Characters",
                          ),
                        ),
                      ),
                    ),
                  ),

                  //Container For Password Input Field Ends Here...//
                  //Container for MobileNumber  Input Field &indian flag Starts //
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.black),
                      ),
                      child: Row(
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Image.asset(
                                  "assets/Flag_of_India.svg.png",
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "+91",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: MediaQuery.sizeOf(context).width,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: _MobileNumber,
                                  key: _formkey,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return ("please Enter Phone  Number");
                                    }
                                  },
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Enter Mobile Number",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //Container for MobileNumber  Input Field  &indian flag Ends //
                  //Container For Email Input Field Starts//
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        child: TextFormField(
                          controller: _Email,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ("please Enter Some text");
                            }
                          },

                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text(
                              "Email * ",
                              style: TextStyle(color: Colors.red),
                            ),
                            hintText: "abc@gmail.com",
                          ),
                        ),
                      ),
                    ),
                  ),

                  //Container For Email Input Field Ends//
                  //Container For CheckBox And Aknowledgment Starts //
                  Expanded(
                    child: Container(
                      child: CheckboxListTile(
                        value: _isBoolChecked,
                        onChanged: (newvalue) {
                          setState(() {
                            _isBoolChecked = newvalue!;
                          });
                        },
                        title: AutoSizeText(
                          "I Would Like To Recieve marketing offers and \n Promotional Calls from Booking .com",
                          minFontSize: 15,
                          maxFontSize: 20,
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ),
                  //Container For CheckBox And Aknowledgment Ends //
                  //Sized Box For Elevation Buttons Starting//
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width - 20,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: _isBoolChecked
                              ? Colors.white
                              : Colors.transparent,
                          backgroundColor: _isBoolChecked
                              ? Colors.orangeAccent
                              : Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(25),
                          ),
                        ),
                        onPressed: () {
                          makePostRequest();
                        },
                        child: AutoSizeText(
                          'Create Account',
                          minFontSize: 20,
                          maxFontSize: 30,
                          maxLines: 7,
                          overflow: TextOverflow
                              .ellipsis, // Add ellipsis if the text overflows
                          style: const TextStyle(
                            color: Colors.white,
                          ), // This is a starti
                        ),
                      ),
                    ),
                  ),
                  //Sized Box For Elevation Buttons Ending//
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
