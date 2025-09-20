import 'dart:developer';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:booking_app/Checkin_Checkout_AddRoom.dart';
import 'package:booking_app/Search_page.dart';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage1 extends StatefulWidget {
  String? Uname;
  String? phone;

  Homepage1({super.key, required this.Uname, required this.phone});

  @override
  State<Homepage1> createState() => _Homepage1State();
}

class _Homepage1State extends State<Homepage1> {
  List<int> selectedIndex = [];

  String? selecteddropdownvalue;
  String? username;
  List<String> cities_available = [
    "Vytila, kochi",
    "Palarivattom, kochi",
    "HighCourt_Junction,Kochi ",
    "Edappally, Kochi",
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();

    selecteddropdownvalue = cities_available.first; // default value
  }

  var jsonList;

  Future<void> fetchData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        username = prefs.getString("username");
      });

      Dio fetch = Dio();
      var response = await fetch.get(
        "https://hotel.b4production.com/getandposthostel",
      );
      inspect(response);
      if (response.statusCode == 200) {
        print("Response ------$response");
        setState(() {
          jsonList = response.data as List;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          // Show a confirmation dialog before popping the screen
          return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Confirm Exit"),
              content: Text("Are you sure you want to exit?"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text("No"),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text("Yes"),
                ),
              ],
            ),
          );
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,

          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Booking",
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                      252,
                                      11,
                                      11,
                                      11,
                                    ),
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  width: 50,
                                  height: 25,
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
                                        fontWeight: FontWeight.w900,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(child: Icon(Icons.notification_add)),
                    ],
                  ),
                ),
                //Container For LoctaionDropDownList Starts//
                Container(
                  padding: EdgeInsets.all(5),
                  width: 275,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(50),
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.location_history,
                          color: Colors.orange,
                          size: 30,
                        ),
                      ),
                      DropdownButton(
                        underline: Container(),
                        value: selecteddropdownvalue,
                        icon: Icon(Icons.keyboard_arrow_down),
                        elevation: 18,
                        onChanged: (String? Value) {
                          setState(() {
                            selecteddropdownvalue = Value;
                          });
                        },
                        items: cities_available.map<DropdownMenuItem<String>>((
                          String value,
                        ) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                //Container For LoctaionDropDownList Ends//
                //Container For Greetings Customer Starts//
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: AutoSizeText(
                      "Hello ${widget.Uname == '' ? username : widget.Uname}! ❤",
                      minFontSize: 30,
                      maxFontSize: 90,
                      maxLines: 1,
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                  ),
                ),

                //Container For Greetings Customer Ends//
                //Container For Paragraph Starts//
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Text(
                      "Lets find the best hotels \n around the worls",

                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                //Container For Paragraph Ends//
                //Container For Search Bar Starts //
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SearchPage(location: selecteddropdownvalue!),
                      ),
                    );
                  },
                  child: Center(
                    child: Container(
                      width: MediaQuery.sizeOf(context).width - 20,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          width: 1,
                          color: const Color.fromARGB(255, 189, 188, 188),
                        ),
                        // boxShadow: [
                        //   BoxShadow(
                        //     blurRadius: .5,
                        //     color: Colors.black26,
                        //     spreadRadius: 1,
                        //     offset: Offset(0.5, .8),
                        //   ),
                        // ],
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.search, size: 20),
                          Text(
                            "${selecteddropdownvalue}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("27-feb "),
                          Text("To "),
                          Text("28 feb"),
                          Text("1 guest"),
                        ],
                      ),
                    ),
                  ),
                ),
                //Container For Search Bar Ends//
                SizedBox(height: 10),
                //Container For Offer Text Starts//
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Offers",

                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                ////////////////////////////////////////////////////////////////////////////////////////////////////////
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        //color: Colors.blue,
                        width: double.infinity,
                        height: 380,

                        child: jsonList == null
                            ? Center(
                                child: CircularProgressIndicator(),
                              ) // loader
                            : ListView.builder(
                                itemCount: jsonList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      //height: 80,
                                      width: 300,
                                      //color: Colors.red,
                                      child: Column(
                                        children: [
                                          SizedBox(height: 20),
                                          Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadiusGeometry.circular(
                                                      15.0,
                                                    ),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 180,
                                                  color: Colors.white,
                                                  child: InkWell(
                                                    onTap: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) => CheckinCheckoutAddroom(
                                                            hname:
                                                                "${jsonList[index]['hname']}",
                                                            himage:
                                                                "${jsonList[index]['himage']}",
                                                            haddr:
                                                                "${jsonList[index]['haddr']}",
                                                            hdesc:
                                                                "${jsonList[index]['hdesc']}",
                                                            hloc:
                                                                "${jsonList[index]['hloc']}",
                                                            hprice:
                                                                jsonList[index]['hprice'],
                                                            Location:
                                                                "${selecteddropdownvalue!}",
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Image.network(
                                                      jsonList[index]['himage'],
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadiusGeometry.circular(
                                                          18.0,
                                                        ),

                                                    child: Container(
                                                      color:
                                                          const Color.fromARGB(
                                                            206,
                                                            232,
                                                            28,
                                                            14,
                                                          ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(
                                                              8.0,
                                                            ),
                                                        child: Text(
                                                          "70% Off",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 120),
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadiusGeometry.circular(
                                                          25,
                                                        ),
                                                    child: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          print("icon button ");
                                                          if (selectedIndex
                                                              .contains(
                                                                index,
                                                              )) {
                                                            selectedIndex
                                                                .remove(index);
                                                          } else {
                                                            selectedIndex.add(
                                                              index,
                                                            );
                                                          }
                                                        });
                                                      },
                                                      icon: CircleAvatar(
                                                        minRadius: 8,
                                                        maxRadius: 15,
                                                        backgroundColor:
                                                            Colors.white,
                                                        child: Icon(
                                                          selectedIndex
                                                                  .contains(
                                                                    index,
                                                                  )
                                                              ? Icons.favorite
                                                              : Icons
                                                                    .favorite_outline_outlined,
                                                          color:
                                                              selectedIndex
                                                                  .contains(
                                                                    index,
                                                                  )
                                                              ? Colors.red
                                                              : Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 20),
                                          Container(
                                            width: double.infinity,

                                            height: 100,
                                            //color: Colors.green,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                        left: 10,
                                                      ),
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.star),
                                                      Text(
                                                        " 4.5",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      SizedBox(width: 30),
                                                      Text(
                                                        "(999)",
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                        left: 10,
                                                      ),
                                                  child: Text(
                                                    "${jsonList[index]['hname']}",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                        left: 10,
                                                      ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Icon(
                                                        Icons.location_pin,
                                                        color: Colors.orange,
                                                      ),
                                                      Text(
                                                        jsonList[index]['hloc'],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                        left: 10,
                                                      ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "₹${jsonList[index]['hprice'].toString()}",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      SizedBox(width: 20),
                                                      Text("₹7500"),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ),
                    ),
                  ],
                ),

                /////////////////////////////////////////////////////////////////////////////////////////////
                SizedBox(height: 1),

                //Container For Listview Template Ends //
                Container(
                  height: 200,
                  width: double.infinity,
                  // color: Colors.deepOrange,
                  child: Image.asset(
                    "assets/image 4.png",
                    fit: BoxFit.fill,

                    width: double.infinity,
                  ),
                ),
                SizedBox(height: 30),

                Container(
                  height: 200,
                  width: double.infinity,
                  //   color: Colors.deepOrange,
                  child: Image.asset(
                    "assets/image 5.png",
                    fit: BoxFit.fill,

                    width: double.infinity,
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
