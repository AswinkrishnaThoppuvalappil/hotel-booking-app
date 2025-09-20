// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:booking_app/Checkin_Checkout_AddRoom.dart';
// import 'package:booking_app/deatils_Page.dart';
// import 'package:booking_app/mybooking.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';

// class serachpage {
//   String? hname;
//   String? hdesc;
//   int? hprice;
//   String? hloc;
//   String? haddr;
//   String? himage;

//   serachpage({
//     this.hname,
//     this.hdesc,
//     this.hprice,
//     this.hloc,
//     this.haddr,
//     this.himage,
//   });

//   serachpage.fromJson(Map<String, dynamic> json) {
//     hname = json['hname'];
//     hdesc = json['hdesc'];
//     hprice = json['hprice'];
//     hloc = json['hloc'];
//     haddr = json['haddr'];
//     himage = json['himage'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['hname'] = this.hname;
//     data['hdesc'] = this.hdesc;
//     data['hprice'] = this.hprice;
//     data['hloc'] = this.hloc;
//     data['haddr'] = this.haddr;
//     data['himage'] = this.himage;
//     return data;
//   }
// }

// class SearchPage extends StatefulWidget {
//   var location;
//   var image;
//   String? hname;
//   String? hdesc;
//   int? hprice;
//   String? hloc;
//   String? haddr;
//   String? himage;

//   SearchPage({
//     super.key,
//     required this.location,
//     required this.image,
//     required this.hname,
//     required this.hdesc,
//     required this.hprice,
//     required this.hloc,
//     required this.haddr,
//     required this.himage,
//   });

//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   TextEditingController InputController = TextEditingController();
//   bool _favourite = true;
//   var jsonList;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getDataForSearch();
//   }

//   Future<void> getDataForSearch() async {
//     try {
//       Dio fetchdata = Dio();
//       var Response = await fetchdata.get(
//         "https://hotel.b4production.com/getandposthostel",
//       );
//       if (Response.statusCode == 200) {
//         print("Response--------------- $Response");
//         print("$Response.data");
//         setState(() {
//           jsonList = Response.data['data'] as List;
//         });
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     void _inputClear() {
//       InputController.clear();
//     }

//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(),
//       body: Container(
//         child: //Container For Search Bar Starts //
//         GestureDetector(
//           onTap: () {},
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   //Container For Input Field Starts Here//
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Container(
//                       width: MediaQuery.sizeOf(context).width - 20,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(width: 1, color: Colors.black),
//                       ),
//                       child: Row(
//                         children: [
//                           Container(
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Container(
//                                 child: Icon(Icons.search, size: 20),
//                               ),
//                             ),
//                           ),

//                           Expanded(
//                             child: Container(
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child:
//                                     // labelText: "${widget.location} ",
//                                     Text("${widget.location}"),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Container(
//                                 child: IconButton(
//                                   onPressed: _inputClear,
//                                   icon: Icon(Icons.close),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   //Container For Input Field Endss Here//
//                 ],
//               ),

//               //Container For Search Bar Ends//
//               //Container For Search bar Black Starts//
//               GestureDetector(
//                 onTap: () {},
//                 child: Container(
//                   width: MediaQuery.sizeOf(context).width,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(25),
//                     border: Border.all(width: 1, color: Colors.black),
//                     color: Colors.black,
//                   ),

//                   child: jsonList.isNotEmpty
//                       ? Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) =>
//                                         CheckinCheckoutAddroom(
//                                           hname: "${jsonList[0]['hname']}",
//                                           himage: "${jsonList[0]['himage']}",
//                                           haddr: "${jsonList[0]['haddr']}",
//                                           hdesc: "${jsonList[0]['hdesc']}",
//                                           hloc: "${jsonList[0]['hloc']}",
//                                           hprice: jsonList[0]['hprice'],
//                                           Location: "${widget.location}",
//                                         ),
//                                   ),
//                                 );
//                               },
//                               child: AutoSizeText(
//                                 "Checkin      |",
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ),
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) =>
//                                         CheckinCheckoutAddroom(
//                                           hname: "${jsonList[0]['hname']}",
//                                           himage: "${jsonList[0]['himage']}",
//                                           haddr: "${jsonList[0]['haddr']}",
//                                           hdesc: "${jsonList[0]['hdesc']}",
//                                           hloc: "${jsonList[0]['hloc']}",
//                                           hprice: jsonList[0]['hprice'],
//                                           Location: "${widget.location}",
//                                         ),
//                                   ),
//                                 );
//                               },
//                               child: AutoSizeText(
//                                 "Checkout      |",
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ),
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) =>
//                                         CheckinCheckoutAddroom(
//                                           hname: "${jsonList[0]['hname']}",
//                                           himage: "${jsonList[0]['himage']}",
//                                           haddr: "${jsonList[0]['haddr']}",
//                                           hdesc: "${jsonList[0]['hdesc']}",
//                                           hloc: "${jsonList[0]['hloc']}",
//                                           hprice: jsonList[0]['hprice'],
//                                           Location: "${widget.location}",
//                                         ),
//                                   ),
//                                 );
//                               },
//                               child: AutoSizeText(
//                                 "Guest      |",
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ),
//                           ],
//                         )
//                       : const SizedBox.shrink(), // if API not loaded yet → show nothing
//                 ),
//               ),

//               //Container For Search bar Black Ends//
//               //Sort and Filter Starts Here//
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   TextButton(onPressed: () {}, child: AutoSizeText("Sort by ")),
//                   IconButton(
//                     onPressed: () {},
//                     icon: Icon(Icons.align_horizontal_left),
//                   ),
//                   Row(
//                     children: [
//                       TextButton(
//                         onPressed: () {},
//                         child: AutoSizeText("Filter "),
//                       ),
//                       IconButton(
//                         onPressed: () {},
//                         icon: Icon(Icons.align_horizontal_right_rounded),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               //Sort and Filter Ends Here//

//               ////////////////////////////////////////////////////////////////////////////////////////////////////////
//               Row(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       //color: Colors.blue,
//                       width: double.infinity,
//                       height: 300,

//                       child: jsonList == null
//                           ? Center(child: CircularProgressIndicator()) // loader
//                           : ListView.builder(
//                               itemCount: jsonList.length,
//                               scrollDirection: Axis.horizontal,
//                               itemBuilder: (BuildContext context, int index) {
//                                 return Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Container(
//                                     //height: 80,
//                                     width: 200,
//                                     //color: Colors.red,
//                                     child: Column(
//                                       children: [
//                                         Expanded(
//                                           flex: 2,
//                                           child: Stack(
//                                             children: [
//                                               ClipRRect(
//                                                 borderRadius:
//                                                     BorderRadiusGeometry.circular(
//                                                       15.0,
//                                                     ),
//                                                 child: Container(
//                                                   width: double.infinity,
//                                                   height: 100,
//                                                   color: Colors.white,
//                                                   child: InkWell(
//                                                     onTap: () {
//                                                       Navigator.push(
//                                                         context,
//                                                         MaterialPageRoute(
//                                                           builder: (context) => CheckinCheckoutAddroom(
//                                                             hname:
//                                                                 "${jsonList[index]['hname']}",
//                                                             himage:
//                                                                 "${jsonList[index]['himage']}",
//                                                             haddr:
//                                                                 "${jsonList[index]['haddr']}",
//                                                             hdesc:
//                                                                 "${jsonList[index]['hdesc']}",
//                                                             hloc:
//                                                                 "${jsonList[index]['hloc']}",
//                                                             hprice:
//                                                                 jsonList[index]['hprice'],
//                                                             Location:
//                                                                 "${widget.location}",
//                                                           ),
//                                                         ),
//                                                       );
//                                                     },
//                                                     child: Image.network(
//                                                       jsonList[index]['himage'],
//                                                       fit: BoxFit.fill,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                               Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.center,
//                                                 children: [
//                                                   ClipRRect(
//                                                     borderRadius:
//                                                         BorderRadiusGeometry.circular(
//                                                           10.0,
//                                                         ),

//                                                     child: Container(
//                                                       color: Colors.red,
//                                                       child: Padding(
//                                                         padding:
//                                                             const EdgeInsets.all(
//                                                               8.0,
//                                                             ),
//                                                         child: Text(
//                                                           "70% Off",
//                                                           style: TextStyle(
//                                                             fontSize: 8,
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   ClipRRect(
//                                                     borderRadius:
//                                                         BorderRadiusGeometry.circular(
//                                                           25,
//                                                         ),
//                                                     child: IconButton(
//                                                       onPressed: () {
//                                                         setState(() {
//                                                           print("icon button ");
//                                                           _favourite =
//                                                               !_favourite; // ✅ toggle true/false
//                                                         });
//                                                       },
//                                                       icon: Icon(
//                                                         Icons.favorite,
//                                                         color: _favourite
//                                                             ? Colors.red
//                                                             : Colors.white,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         SizedBox(height: 20),
//                                         Container(
//                                           width: double.infinity,

//                                           height: 100,
//                                           //color: Colors.green,
//                                           child: Column(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceAround,
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Padding(
//                                                 padding: const EdgeInsets.only(
//                                                   left: 10,
//                                                 ),
//                                                 child: Row(
//                                                   children: [
//                                                     Icon(Icons.star),
//                                                     Text(
//                                                       " 4.5",
//                                                       style: TextStyle(
//                                                         color: Colors.black,
//                                                       ),
//                                                     ),
//                                                     SizedBox(width: 30),
//                                                     Text(
//                                                       "(999)",
//                                                       style: TextStyle(
//                                                         color: Colors.grey,
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding: const EdgeInsets.only(
//                                                   left: 10,
//                                                 ),
//                                                 child: Text(
//                                                   "${widget.hname}",
//                                                   style: TextStyle(
//                                                     fontWeight: FontWeight.w300,
//                                                     fontSize: 18,
//                                                   ),
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding: const EdgeInsets.only(
//                                                   left: 10,
//                                                 ),
//                                                 child: Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.start,
//                                                   children: [
//                                                     Icon(
//                                                       Icons.location_pin,
//                                                       color: Colors.orange,
//                                                     ),
//                                                     Text("$widget.hloc"),
//                                                   ],
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding: const EdgeInsets.only(
//                                                   left: 10,
//                                                 ),
//                                                 child: Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.start,
//                                                   children: [
//                                                     Text(
//                                                       "₹${widget.hprice}",
//                                                       style: TextStyle(
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                         fontSize: 18,
//                                                       ),
//                                                     ),
//                                                     SizedBox(width: 20),
//                                                     Text("₹7500"),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                     ),
//                   ),
//                 ],
//               ),

//               /////////////////////////////////////////////////////////////////////////////////////////////
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:booking_app/Checkin_Checkout_AddRoom.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final String location;

  const SearchPage({super.key, required this.location});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController inputController = TextEditingController();
  bool _favourite = false;
  List<dynamic> jsonList = []; // stores hotel list

  @override
  void initState() {
    super.initState();
    getDataForSearch();
  }

  Future<void> getDataForSearch() async {
    try {
      Dio fetchdata = Dio();
      var response = await fetchdata.get(
        "https://hotel.b4production.com/getandposthostel",
      );

      if (response.statusCode == 200) {
        print("API raw response: ${response.data}");
        print("Response type: ${response.data.runtimeType}");

        setState(() {
          if (response.data is List) {
            // API returned a list directly
            jsonList = response.data;
          } else if (response.data is Map &&
              response.data.containsKey("data")) {
            // API returned a map with "data" key
            jsonList = response.data["data"];
          } else {
            jsonList = [];
          }
          log('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
          log("Parsed jsonList: $jsonList");
        });

        print("Parsed jsonList length: ${jsonList.length}");
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    void _inputClear() {
      inputController.clear();
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Search Hotels")),
      body: Column(
        children: [
          // 🔎 Search Bar
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: Colors.black),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.search, size: 20),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.location),
                    ),
                  ),
                  IconButton(
                    onPressed: _inputClear,
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),
          ),
          // Container For Search bar Black Starts//
          GestureDetector(
            onTap: () {},
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(width: 1, color: Colors.black),
                color: Colors.black,
              ),

              child: jsonList.isNotEmpty
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CheckinCheckoutAddroom(
                                  hname: "${jsonList[0]['hname']}",
                                  himage: "${jsonList[0]['himage']}",
                                  haddr: "${jsonList[0]['haddr']}",
                                  hdesc: "${jsonList[0]['hdesc']}",
                                  hloc: "${jsonList[0]['hloc']}",
                                  hprice: jsonList[0]['hprice'],
                                  Location: "${widget.location}",
                                ),
                              ),
                            );
                          },
                          child: AutoSizeText(
                            "Checkin      |",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CheckinCheckoutAddroom(
                                  hname: "${jsonList[0]['hname']}",
                                  himage: "${jsonList[0]['himage']}",
                                  haddr: "${jsonList[0]['haddr']}",
                                  hdesc: "${jsonList[0]['hdesc']}",
                                  hloc: "${jsonList[0]['hloc']}",
                                  hprice: jsonList[0]['hprice'],
                                  Location: "${widget.location}",
                                ),
                              ),
                            );
                          },
                          child: AutoSizeText(
                            "Checkout      |",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CheckinCheckoutAddroom(
                                  hname: "${jsonList[0]['hname']}",
                                  himage: "${jsonList[0]['himage']}",
                                  haddr: "${jsonList[0]['haddr']}",
                                  hdesc: "${jsonList[0]['hdesc']}",
                                  hloc: "${jsonList[0]['hloc']}",
                                  hprice: jsonList[0]['hprice'],
                                  Location: "${widget.location}",
                                ),
                              ),
                            );
                          },
                          child: AutoSizeText(
                            "Guest      |",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    )
                  : const SizedBox.shrink(), // if API not loaded yet → show nothing
            ),
          ),

          //Container For Search bar Black Ends//
          //Sort and Filter Starts Here//
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed: () {}, child: AutoSizeText("Sort by ")),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.align_horizontal_left),
              ),
              Row(
                children: [
                  TextButton(onPressed: () {}, child: AutoSizeText("Filter ")),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.align_horizontal_right_rounded),
                  ),
                ],
              ),
            ],
          ),
          //Sort and Filter Ends Here//

          // 🔄 Loader or List
          Expanded(
            child: jsonList.isEmpty
                ? const Center(child: Text("No hotels found"))
                : ListView.builder(
                    itemCount: jsonList.length,
                    itemBuilder: (context, index) {
                      final item = jsonList[index] as Map<String, dynamic>;
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
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
                                    borderRadius: BorderRadiusGeometry.circular(
                                      15.0,
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      height: 180,
                                      color: Colors.white,
                                      child: InkWell(
                                        onTap: () {},
                                        child: Image.network(
                                          jsonList[index]['himage'],
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadiusGeometry.circular(18.0),

                                        child: Container(
                                          color: const Color.fromARGB(
                                            206,
                                            232,
                                            28,
                                            14,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "70% Off",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 120),
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadiusGeometry.circular(25),
                                        child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              print("icon button ");
                                              _favourite =
                                                  !_favourite; // ✅ toggle true/false
                                            });
                                          },
                                          icon: CircleAvatar(
                                            minRadius: 8,
                                            maxRadius: 15,
                                            backgroundColor: Colors.white,
                                            child: Icon(
                                              Icons.favorite_outline_outlined,
                                              color: _favourite
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
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
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        "${jsonList[index]['hname']}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.location_pin,
                                            color: Colors.orange,
                                          ),
                                          Text(jsonList[index]['hloc']),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "₹${jsonList[index]['hprice'].toString()}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
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
        ],
      ),
    );
  }
}
