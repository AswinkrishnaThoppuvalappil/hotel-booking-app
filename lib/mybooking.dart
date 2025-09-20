import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// class bookingDetails {
//   String? hname;
//   String? hostelPrice;
//   String? hostelLoc;
//   String? hostelImage;
//   String? checkin;
//   String? checkout;
//   int? uid;

//   bookingDetails({
//     this.hname,
//     this.hostelPrice,
//     this.hostelLoc,
//     this.hostelImage,
//     this.checkin,
//     this.checkout,
//     this.uid,
//   });

//   bookingDetails.fromJson(Map<String, dynamic> json) {
//     hname = json['hname'];
//     hostelPrice = json['hostel_price'];
//     hostelLoc = json['hostel_loc'];
//     hostelImage = json['hostel_image'];
//     checkin = json['checkin'];
//     checkout = json['checkout'];
//     uid = json['uid'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['hname'] = this.hname;
//     data['hostel_price'] = this.hostelPrice;
//     data['hostel_loc'] = this.hostelLoc;
//     data['hostel_image'] = this.hostelImage;
//     data['checkin'] = this.checkin;
//     data['checkout'] = this.checkout;
//     data['uid'] = this.uid;
//     return data;
//   }
// }

class Mybooking extends StatefulWidget {
  var selectedCheckinDate;
  var selectedCheckoutDate;
  String? hname;
  String? hdesc;
  int? hprice;
  String? hloc;
  String? haddr;
  String? himage;

  Mybooking({
    super.key,
    this.selectedCheckinDate,
    this.selectedCheckoutDate,
    this.hname,
    this.himage,
    this.haddr,
    this.hloc,
    this.hdesc,
    this.hprice,
  });

  @override
  State<Mybooking> createState() => _MybookingState();
}

class _MybookingState extends State<Mybooking> {
  @override
  void initState() {
    // TODO: implement initState
    _printBookingData();
    super.initState();
    getBookingData();
  }

  var jsonList;

  Future<void> getBookingData() async {
    try {
      Dio fetchdata = Dio();
      var response = await fetchdata.get(
        "https://hotel.b4production.com/getandposthostel",
      );
      inspect(response);
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
        });

        log("Parsed jsonList length: ${jsonList.toString()}");
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("My Booking"),
          ),
          bottom: TabBar(
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 3,
            tabs: [
              Tab(icon: AutoSizeText("Booked")),
              Tab(icon: Text("History")),
            ],
          ),
        ),
        body: Container(
          child: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: jsonList.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : Container(
                        width: MediaQuery.sizeOf(context).width,
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: ListTile(
                            //     leading: Image.asset("assets/Hotel_image1.jpg"),
                            //     title: Text(
                            //       "Hotel Name  \n 399",
                            //       style: TextStyle(
                            //         color: Colors.black,
                            //         fontWeight: FontWeight.bold,
                            //       ),
                            //     ),
                            //     subtitle: Text("🌟 4.5"),
                            //   ),
                            // ),
                            Expanded(
                              child: ListView.separated(
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 20),
                                itemCount: 1,

                                itemBuilder: (BuildContext, int index) {
                                  final item =
                                      jsonList[index] as Map<String, dynamic>;
                                  return Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    padding: EdgeInsets.only(
                                      left: 10,
                                      top: 10,
                                      bottom: 10,
                                      right: 10,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 150,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                child: Image.network(
                                                  jsonList[index]['himage'],
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),

                                            const SizedBox(width: 20),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${jsonList[index]['hname']} ",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                Text(
                                                  "Location: ${jsonList[index]['hloc']}",
                                                  style: TextStyle(
                                                    color: Colors.grey,

                                                    fontSize: 16,
                                                  ),
                                                ),
                                                Text(
                                                  "₹ ${jsonList[index]['hprice']}",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                  ),
                                                ),

                                                Row(
                                                  children: [
                                                    Icon(Icons.star, size: 16),
                                                    const SizedBox(width: 5),
                                                    Text("4.5 (756)"),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),

                                        const SizedBox(height: 10),

                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 0.5,
                                            ),
                                          ),

                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  Text("Check in"),

                                                  Text(
                                                    '12 June',

                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              Container(
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,

                                                  border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Icon(
                                                    Icons.arrow_right_alt,
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  Text("Check out"),

                                                  Text(
                                                    '13 June',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
              jsonList.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : ListView.separated(
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 20),
                      itemBuilder: (context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: EdgeInsets.only(
                              left: 10,
                              top: 10,
                              bottom: 10,
                              right: 10,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 150,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.network(
                                          jsonList[index]['himage'],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),

                                    const SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 120,
                                          child: Text(
                                            overflow: TextOverflow.ellipsis,
                                            "${jsonList[index]['hname']} ",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 120,
                                          child: Text(
                                            overflow: TextOverflow.ellipsis,
                                            "Location: ${jsonList[index]['hloc']}",
                                            style: TextStyle(
                                              color: Colors.grey,

                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "₹ ${jsonList[index]['hprice']}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),

                                        Row(
                                          children: [
                                            Icon(Icons.star, size: 16),
                                            const SizedBox(width: 5),
                                            Text("4.5 (756)"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 10),

                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 0.5,
                                    ),
                                  ),

                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text("Check in"),

                                          Text(
                                            '12 June',

                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),

                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,

                                          border: Border.all(
                                            width: 0.5,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        child: Center(
                                          child: Icon(Icons.arrow_right_alt),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Text("Check out"),

                                          Text(
                                            '13 June',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: jsonList.length,
                    ),
            ],
          ),
        ),
      ),
    );
  }

  void _printBookingData() {
    print("===== Booking Details =====");
    print("Hotel Name     : ${widget.hname ?? 'NA'}");
    print("Description    : ${widget.hdesc ?? 'NA'}");
    print("Price          : ${widget.hprice?.toString() ?? 'NA'}");
    print("Location       : ${widget.hloc ?? 'NA'}");
    print("Address        : ${widget.haddr ?? 'NA'}");
    print("Image          : ${widget.himage ?? 'NA'}");
    print("Check-in Date  : ${widget.selectedCheckinDate ?? 'NA'}");
    print("Check-out Date : ${widget.selectedCheckoutDate ?? 'NA'}");
    print("===========================");
  }
}
