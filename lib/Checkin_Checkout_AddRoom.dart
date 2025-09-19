import 'package:auto_size_text/auto_size_text.dart';
import 'package:booking_app/mybooking.dart';
import 'package:booking_app/showBooking.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class bookingDetails {
  String? hname;
  String? hostelPrice;
  String? hostelLoc;
  String? hostelImage;
  String? checkin;
  String? checkout;
  int? uid;

  bookingDetails({
    this.hname,
    this.hostelPrice,
    this.hostelLoc,
    this.hostelImage,
    this.checkin,
    this.checkout,
    this.uid,
  });

  bookingDetails.fromJson(Map<String, dynamic> json) {
    hname = json['hname'];
    hostelPrice = json['hostel_price'];
    hostelLoc = json['hostel_loc'];
    hostelImage = json['hostel_image'];
    checkin = json['checkin'];
    checkout = json['checkout'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hname'] = this.hname;
    data['hostel_price'] = this.hostelPrice;
    data['hostel_loc'] = this.hostelLoc;
    data['hostel_image'] = this.hostelImage;
    data['checkin'] = this.checkin;
    data['checkout'] = this.checkout;
    data['uid'] = this.uid;
    return data;
  }
}

class CheckinCheckoutAddroom extends StatefulWidget {
  var hname;
  String? hdesc;
  int? hprice;
  String? hloc;
  String? haddr;
  String? himage;
  String? Location;
  CheckinCheckoutAddroom({
    super.key,
    required this.hname,
    required this.hdesc,
    required this.hprice,
    required this.hloc,
    required this.haddr,
    required this.himage,
    required this.Location,
  });

  @override
  State<CheckinCheckoutAddroom> createState() => _CheckinCheckoutAddroomState();
}

class _CheckinCheckoutAddroomState extends State<CheckinCheckoutAddroom>
    with SingleTickerProviderStateMixin {
  bool _isclicked = true;
  late TabController _tabController;
  DateTime? checkInDate;
  DateTime? checkOutDate;
  int guests = 1;
  int rooms = 1;
  // Shared Data//
  DateTime? _selectedDate;

  Future<void> _postBookingRequest() async {
    Dio postData = Dio();

    final formData = FormData.fromMap({
      'hname': widget.hname,
      'hostel_price': widget.hprice.toString(),
      'hostel_loc': widget.hloc,
      'hostel_image': widget.himage,
      'checkin': checkInDate,
      'checkout': checkOutDate,
    });
    final Url = "https://hotel.b4production.com/getandpostbookings";
    try {
      final Response = await postData.post(Url, data: formData);
      print("====================================$Response");

      if (Response.statusCode == 200) {
        print("Status Code: ${Response.statusCode}");
        print("Response Data: ${Response.data}");
        print("Response --------->  $Response");

        var _responseMessage = "Requested Sucessfully";
        print(_responseMessage);

        setState(() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Mybooking(
                selectedCheckinDate: "${checkInDate}",
                selectedCheckoutDate: "${checkOutDate}",
                haddr: widget.haddr,
                hdesc: widget.hdesc,
                himage: widget.himage,
                hloc: widget.Location,
                hname: widget.hname,
                hprice: widget.hprice,
              ),
            ),
          );
        });
      }
    } on DioException catch (e) {
      print("Error Response: ${e.response?.data}");
      print("Error Status: ${e.response?.statusCode}");
    }
  }

  Future<Map<String, String?>> getUser() async {
    var user = await getUser();
    var response = await Dio().post(
      "https://hotel.b4production.com/getandpostbookings",
      data: {"phone": user["phone"], "username": user["username"]},
    );

    final prefs = await SharedPreferences.getInstance();
    return {
      "phone": prefs.getString("phone"),
      "username": prefs.getString("username"),
    };
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  void _showSuccessMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Booking Successful 🎉"),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _showPostSuccessMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Datas Posted Sucessfully ..... 🎉"),
        backgroundColor: Colors.grey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final dateFormat = DateFormat("yyyy-MM-dd").format(checkInDate!);
    // print(dateFormat);
    final checkindateFormat = checkInDate != null
        ? DateFormat("yyyy-MM-dd").format(checkInDate!)
        : "Select a date";
    final checkOutDateformat = checkOutDate != null
        ? DateFormat("yyyy-MM-dd").format(checkOutDate!)
        : "select a date";

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text(
                    "Select",
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                icon: AutoSizeText(
                  "checkin",

                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Tab(
                icon: Text(
                  "Check Out",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Tab(
                icon: Text(
                  "Rooms & Guests",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            //Container For Check in Date Selection Calender Starts//
            Container(
              child: Expanded(
                child: TableCalendar(
                  focusedDay: DateTime.now() ?? (checkInDate ?? DateTime.now()),
                  firstDay: DateTime.utc(2025, 08, 27),
                  lastDay: DateTime.utc(2025, 10, 30),
                  selectedDayPredicate: (Day) => isSameDay(Day, checkInDate),
                  onDaySelected: (selectedDay, FocusedDay) {
                    setState(() {
                      checkInDate = selectedDay;
                    });
                    _tabController.animateTo(1);
                  },
                ),
              ),
            ),

            //Container For Check in Date Selection Calender Ends//
            //Container For CheckOut Date Selection Clender Starts//
            Container(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Check in"),
                        Text(":"),
                        //  Text("${checkInDate}", style: TextStyle(fontSize: 10)),
                        Text(
                          "${checkindateFormat}",
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Check Out "),
                        Text(":"),
                        Text(
                          "${checkOutDateformat}",
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TableCalendar(
                      firstDay: DateTime.utc(2020, 1, 1),
                      lastDay: DateTime.utc(2030, 12, 31),
                      focusedDay:
                          checkOutDate ?? (checkInDate ?? DateTime.now()),
                      selectedDayPredicate: (day) =>
                          isSameDay(day, checkOutDate),
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          checkOutDate = selectedDay;
                        });
                        _tabController.animateTo(2); // move to Add Room
                      },
                      enabledDayPredicate: (day) {
                        if (checkInDate != null) {
                          return day.isAfter(
                            checkInDate!.subtract(const Duration(days: 1)),
                          );
                        }
                        return true;
                      },
                    ),
                  ),
                ],
              ),
            ),
            //Container For CheckOut Date Selection Clender Ends//
            //Container For Add Room And Guest and Add Conformation Page Starts//
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.black),
                borderRadius: BorderRadius.circular(20),
              ),
              //Column Holding Customer Data Holds Starts//
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Check in",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ":",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${checkindateFormat}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Check Out",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ":",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${checkOutDateformat}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rooms  :  $rooms",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Guests  :  $guests    ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Guests
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Guests: $guests",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              if (guests > 1) {
                                setState(() {
                                  guests--;
                                });
                              }
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                guests++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Rooms
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rooms: $rooms",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              if (rooms > 1) {
                                setState(() {
                                  rooms--;
                                });
                              }
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                rooms++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Confirm button
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        if (checkInDate != null && checkOutDate != null) {
                          _showSuccessMessage();
                          setState(() {
                            _isclicked = false;
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Please select both Check-In and Check-Out dates.",
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      child: Text(
                        "Add Rooms",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  //Container For Add Room And Guest and Add Conformation Page Starts//
                  //Sized Box For Elevation Buttons Starting//
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width - 20,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: _isclicked
                              ? Colors.white
                              : Colors.transparent,
                          backgroundColor: _isclicked
                              ? Colors.transparent
                              : Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(25),
                          ),
                        ),
                        onPressed: () {
                          _postBookingRequest();

                          _showPostSuccessMessage();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (Context) => Showbooking(
                                selectedCheckinDate: checkInDate,
                                selectedCheckoutDate: checkOutDate,
                                selectedGuests: guests,
                                selectedRoom: rooms,
                                haddr: widget.haddr,
                                hdesc: widget.hdesc,
                                himage: widget.himage,
                                hloc: widget.Location,
                                hname: widget.hname,
                                hprice: widget.hprice,
                              ),
                            ),
                          );
                        },
                        child: AutoSizeText(
                          'Apply',
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

              //Container For Add Room And Guest and Add Conformation Page Ends//
            ),
          ],
        ),
      ),
    );
  }
}
