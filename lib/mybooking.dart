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

        print("Parsed jsonList length: ${jsonList.length}");
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }
  

  @override
  Widget build(BuildContext context) {
    DateTime checkinDate = widget.selectedCheckinDate is String
        ? DateTime.parse(widget.selectedCheckinDate)
        : widget.selectedCheckinDate;

    String combinedCheckinFormat = DateFormat.yMEd().format(checkinDate);
    DateTime checkOutDate = widget.selectedCheckoutDate is String
        ? DateTime.parse(widget.selectedCheckoutDate)
        : widget.selectedCheckoutDate;
    String combinedcheckoutFormat = DateFormat.yMEd().format(checkOutDate);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("My Booking"),
          ),
          bottom: TabBar(
            indicator: BoxDecoration(borderRadius: BorderRadius.circular(25)),
            indicatorColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(icon: AutoSizeText("Booked")),
              Tab(icon: Text("history")),
            ],
          ),
        ),
        body: Container(
          child: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
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
                        child: ListView.builder(
                          itemCount: 1,

                          itemBuilder: (BuildContext, int index) {
                            return ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(15),
                                child: Container(
                                  width: 200,
                                  height: 300,
                                  child: Image.network("${widget.himage}"),
                                ),
                              ),
                              title: Text(
                                "${widget.hname} \n ${widget.hprice}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              subtitle: Text("🌟 4.5"),
                            );
                          },
                        ),
                      ),
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${[combinedCheckinFormat]}",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                            SizedBox(width: 50),
                            Icon(Icons.arrow_circle_right_rounded),
                            SizedBox(width: 50),
                            Text(
                              "${combinedcheckoutFormat}",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListView.builder(
                itemBuilder: (context, int index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(15),
                            child: Container(
                              width: 200,
                              height: 300,
                              child: Image.network("${widget.himage}"),
                            ),
                          ),
                          title: Text(
                            "${widget.hname} \n ${widget.hprice}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Row(
                            children: [
                              Icon(Icons.star),
                              SizedBox(width: 20),
                              Text("🌟 4.5"),
                            ],
                          ),
                        ),
                      ),
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${combinedCheckinFormat}",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 50),
                            Icon(Icons.arrow_circle_right_rounded),
                            SizedBox(width: 50),
                            Text(
                              "${combinedcheckoutFormat}",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Container(
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     children: [
                      //       Text(
                      //         "12 June",
                      //         style: TextStyle(
                      //           color: Colors.black,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //       Icon(Icons.arrow_circle_right_rounded),
                      //       Text(
                      //         "12 June",
                      //         style: TextStyle(
                      //           color: Colors.black,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  );
                },
                itemCount: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
