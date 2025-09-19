import 'package:auto_size_text/auto_size_text.dart';
import 'package:booking_app/deatils_Page.dart';
import 'package:booking_app/mybooking.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Showbooking extends StatefulWidget {
  var selectedCheckinDate;
  var selectedCheckoutDate;
  int selectedGuests;
  int selectedRoom;
  String? hname;
  String? hdesc;
  int? hprice;
  String? hloc;
  String? haddr;
  String? himage;

  Showbooking({
    super.key,
    required this.selectedCheckinDate,
    required this.selectedCheckoutDate,
    required this.selectedGuests,
    required this.selectedRoom,
    required this.hname,
    required this.hdesc,
    required this.hprice,
    required this.hloc,
    required this.haddr,
    required this.himage,
  });

  @override
  State<Showbooking> createState() => _ShowbookingState();
}

class _ShowbookingState extends State<Showbooking> {
  TextEditingController InputController = TextEditingController();
  bool _favourite = false;
  bool _isBoolChecked = false;
  String _responseMessage = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _inputClear() {
      InputController.clear();
    }

    DateTime checkinDate = widget.selectedCheckinDate is String
        ? DateTime.parse(widget.selectedCheckinDate)
        : widget.selectedCheckinDate;

    String combinedCheckinFormat = DateFormat.yMEd().format(checkinDate);
    DateTime checkOutDate = widget.selectedCheckoutDate is String
        ? DateTime.parse(widget.selectedCheckoutDate)
        : widget.selectedCheckoutDate;
    String combinedcheckoutFormat = DateFormat.yMEd().format(checkOutDate);

    int selectedGuests = 1;
    int selectedRoom = 1;

    return Scaffold(
      appBar: AppBar(
        title: IconButton(onPressed: () {}, icon: Text("Back")),
      ),
      body: Container(
        child: //Container For Search Bar Starts //
        GestureDetector(
          onTap: () {},
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //Container For Input Field Starts Here//
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width - 20,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.black),
                      ),
                      child: Expanded(
                        child: Row(
                          children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Icon(Icons.search, size: 20),
                                ),
                              ),
                            ),

                            Expanded(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: InputController,

                                    decoration: InputDecoration(
                                      hintText: "${widget.hloc}",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: IconButton(
                                    onPressed: _inputClear,

                                    icon: Icon(Icons.close),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //Container For Input Field Endss Here//
                ],
              ),
              //Container For Search bar Black Starts//
              GestureDetector(
                onTap: () {},
                child: Center(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(width: 1, color: Colors.black),
                      color: Colors.black,
                    ),

                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 20),
                              AutoSizeText(
                                '$combinedCheckinFormat',
                                maxFontSize: 15,
                                minFontSize: 10,
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 20),

                              AutoSizeText(
                                "Checkin",
                                maxFontSize: 15,
                                minFontSize: 10,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 20),
                              AutoSizeText(
                                "$combinedcheckoutFormat",
                                maxFontSize: 15,
                                minFontSize: 10,
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 20),

                              AutoSizeText(
                                "Check Out",
                                maxFontSize: 15,
                                minFontSize: 10,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 20),
                              AutoSizeText(
                                "Guest| $selectedGuests",
                                maxFontSize: 15,
                                minFontSize: 10,
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 20),
                              AutoSizeText(
                                "Rooms| $selectedRoom",
                                maxFontSize: 15,
                                minFontSize: 10,
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 20),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              //Container For Search bar Black Ends//
              //Sort and Filter Starts Here//
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Mybooking(
                            selectedCheckinDate: "${checkinDate}",
                            selectedCheckoutDate: "${checkOutDate}",
                            haddr: "${widget.haddr}",
                            hdesc: "${widget.hdesc}",
                            himage: "${widget.himage}",
                            hloc: "${widget.hloc}",
                            hname: "${widget.hname}",
                            hprice: widget.hprice,
                          ),
                        ),
                      );
                    },
                    child: AutoSizeText("Show Booking "),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.align_horizontal_left),
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: AutoSizeText("Bookings History "),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.align_horizontal_right_rounded),
                      ),
                    ],
                  ),
                ],
              ),

              //Sort and Filter Ends Here//
              //Container FoR Hotel Deatils Starts here//
              //Container For  hotel image starts//
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  height: 300,
                  width: MediaQuery.sizeOf(context).width,

                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DeatilsPage(
                                hname: "",
                                himage: "",
                                haddr: "",
                                hdesc: "",
                                hloc: "",
                                hprice: 1,
                              ),
                            ),
                          );
                        },
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                "${widget.himage}",
                                fit: BoxFit.cover,
                                height: 110,
                                width: double.infinity,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    15.0,
                                  ),

                                  child: Container(
                                    color: Colors.red,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("70% Off"),
                                    ),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    25,
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      _favourite = true;
                                      setState(() {
                                        _favourite = !_favourite;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.favorite,
                                      color: _favourite
                                          ? Colors.red
                                          : Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20),
                      Container(
                        width: double.infinity,

                        height: 100,
                        //color: Colors.green,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Icon(Icons.star),
                                  Text(
                                    " 4.5",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  SizedBox(width: 30),
                                  Text(
                                    "(999)",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "${widget.hname}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.location_pin,
                                    color: Colors.orange,
                                  ),
                                  Text("$widget.hloc"),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "₹${widget.hprice}",
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
              ),

              //Container FoR Hotel Deatils Ends here//
            ],
          ),
        ),
      ),

      //Container For Search Bar Ends//
    );
  }
}
