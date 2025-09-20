import 'package:booking_app/Login.dart';
import 'package:booking_app/userregistration.modelclass.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _showPassord = false;
  bool _checkBoxSatet = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _responseMessage = "";

  Future<void> makePostRequest() async {
    Dio dio = Dio();
    final formData = FormData.fromMap({
      'username': _nameController.text,
      'password': _passwordController.text,
      'phone': _phoneController.text,
      "email": _emailController.text,
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
                builder: (context) => LoginPage(name: _nameController.text),
              ),
            );
          });
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Create account',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/Vector.png',
                          width: 40,
                          height: 40,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),

                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(255, 153, 51, 1),
                      ),
                      child: Center(
                        child: Icon(Icons.add, color: Colors.white, size: 12),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                Text.rich(
                  TextSpan(
                    text: 'Name',
                    style: TextStyle(color: Colors.grey),
                    children: <TextSpan>[
                      TextSpan(
                        text: '*',

                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),

                TextFormField(
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name is required";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    errorStyle: const TextStyle(fontFamily: 'Poppins'),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1.5,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(189, 189, 189, 1),
                        width: 0.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(189, 189, 189, 1),
                        width: 0.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(189, 189, 189, 1),
                        width: 0.5,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(189, 189, 189, 1),
                        width: 0.5,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                  ),
                ),

                SizedBox(height: 40),

                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Mobile number is required";
                    }
                    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                      return "Enter a valid 10-digit number";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  controller: _phoneController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    errorStyle: const TextStyle(fontFamily: 'Poppins'),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1.5,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(189, 189, 189, 1),
                        width: 0.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(189, 189, 189, 1),
                        width: 0.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(189, 189, 189, 1),
                        width: 0.5,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(189, 189, 189, 1),
                        width: 0.5,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    prefix: SizedBox(
                      width: 70,
                      child: Row(
                        children: [
                          SizedBox(
                            height: 20,
                            width: 20,
                            child: Image.asset('assets/flag_india.png'),
                          ),
                          const SizedBox(width: 5),
                          Text('+91', style: TextStyle(fontSize: 16)),
                          const SizedBox(width: 5),
                          Container(height: 25, width: 1, color: Colors.grey),
                          const SizedBox(width: 5),
                        ],
                      ),
                    ),
                    label: Text.rich(
                      TextSpan(
                        text: 'Mobile Number',
                        style: TextStyle(color: Colors.grey),
                        children: <TextSpan>[
                          TextSpan(
                            text: '*',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    labelStyle: TextStyle(color: Colors.grey),
                  ),
                ),

                SizedBox(height: 40),

                Text.rich(
                  TextSpan(
                    text: 'Email ID',
                    style: TextStyle(color: Colors.grey),
                    children: <TextSpan>[
                      TextSpan(
                        text: '*',

                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5),

                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }
                    if (!RegExp(
                      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                    ).hasMatch(value)) {
                      return "Enter a valid email";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    errorStyle: const TextStyle(fontFamily: 'Poppins'),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1.5,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(189, 189, 189, 1),
                        width: 0.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(189, 189, 189, 1),
                        width: 0.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(189, 189, 189, 1),
                        width: 0.5,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(189, 189, 189, 1),
                        width: 0.5,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                  ),
                ),

                SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    text: 'Password',
                    style: TextStyle(color: Colors.grey),
                    children: <TextSpan>[
                      TextSpan(
                        text: '*',

                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),

                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }
                    return null;
                  },
                  controller: _passwordController,
                  obscureText: _showPassord,
                  decoration: InputDecoration(
                    suffix: GestureDetector(
                      onTap: () => setState(() {
                        _showPassord = !_showPassord;
                      }),
                      child: Icon(
                        _showPassord
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    errorStyle: const TextStyle(fontFamily: 'Poppins'),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1.5,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(189, 189, 189, 1),
                        width: 0.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(189, 189, 189, 1),
                        width: 0.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(189, 189, 189, 1),
                        width: 0.5,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(189, 189, 189, 1),
                        width: 0.5,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                  ),
                ),

                Spacer(),
                Row(
                  children: [
                    Checkbox(
                      activeColor: Colors.black,
                      value: _checkBoxSatet,
                      onChanged: (value) {
                        setState(() {
                          _checkBoxSatet = value!;
                        });
                      },
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'I would like to receive marketing offers and \npromotional communications from Booking.com.',
                      style: TextStyle(
                        fontSize: 10,
                        color: Color.fromRGBO(12, 16, 21, 1),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
                const SizedBox(height: 10),
                Center(
                  child: SizedBox(
                    width: 350,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          _checkBoxSatet ? Colors.orange : Colors.grey,
                        ),
                      ),
                      onPressed: !_checkBoxSatet
                          ? () {}
                          : () {
                              if (_formKey.currentState!.validate()) {
                                makePostRequest();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Account created!")),
                                );
                              }
                            },
                      child: Text(
                        'Create account',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
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
    );
  }
}
