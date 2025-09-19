import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DeatilsPage extends StatefulWidget {
  String? hname;
  String? hdesc;
  int? hprice;
  String? hloc;
  String? haddr;
  String? himage;
  DeatilsPage({
    super.key,
    required this.hname,
    required this.himage,
    required this.haddr,
    required this.hloc,
    required this.hdesc,
    required this.hprice,
  });

  @override
  State<DeatilsPage> createState() => _DeatilsPageState();
}

class _DeatilsPageState extends State<DeatilsPage> {
  bool _favourite = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  //Starting Stack For Hotel images and its button//
                  Column(
                    children: [
                      Stack(
                        children: [
                          Expanded(
                            child: Container(
                              width: MediaQuery.sizeOf(context).width,
                              height: 500,
                              color: Colors.amber,
                              child: Image.network(
                                "${widget.himage}",
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          //Row  For Arrow Back Button , Favourite Button and Share Button starts//
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Positioned(
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(Icons.arrow_back),
                                  ),
                                ),
                              ),

                              //Column For Share Button And Favourite Button  starting //
                              Column(
                                children: [
                                  //Circle Avatar For Favourite Button starts//
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,

                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.favorite),
                                    ),
                                  ),
                                  //Circle Avatar For Favourite Button Ends//
                                  //Circle Avatar For share Button starts//
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      foregroundColor: Colors.black,
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.share),
                                      ),
                                    ),
                                  ),
                                  //Circle Avatar For share Button Ends//
                                ],
                              ),

                              //Column For Share Button And Favourite Button  Ending //
                            ],
                          ),
                          //Column   For Premium Button and Button to Photos and Videos Starting //
                          Positioned(
                            top: 400,
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  //Circle Avatar For Crown Icon Button Starts//
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.amber,
                                    foregroundColor: Colors.black,
                                    child: Center(
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: FaIcon(
                                          FontAwesomeIcons.crown,

                                          size: 30, // Optional: Adjust the size
                                        ),
                                      ),
                                    ),
                                  ),

                                  //Circle Avatar For Crown Icon Button Ends//
                                  Container(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        foregroundColor: Colors.white,
                                      ),
                                      onPressed: () {},
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(Icons.arrow_back),
                                          Text(
                                            "726 Photos & Videos",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          //Row  For Arrow Back Button , Favourite Button and Share Button Ends//
                        ],
                      ),
                    ],
                  ),

                  //Ending Stack For Hotel images and its button//
                  //Container For Hotel; Details starting //
                  Container(
                    //color: Colors.blue,
                    width: MediaQuery.sizeOf(context).width,
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //AutoSizeText For Hotel Name Starting//
                        AutoSizeText(
                          "${widget.hname}",
                          minFontSize: 30,
                          maxFontSize: 50,
                          maxLines: 1,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),

                        //AutoSizeText For Hotel Name Ending//
                        Container(
                          width: MediaQuery.sizeOf(context).width,
                          child: Row(
                            children: [
                              AutoSizeText(
                                "🌟",
                                minFontSize: 20,
                                maxFontSize: 50,
                                maxLines: 1,
                                style: TextStyle(fontWeight: FontWeight.normal),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: AutoSizeText(
                                  "4.2(523 rating )",
                                  minFontSize: 10,
                                  maxFontSize: 20,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: AutoSizeText(
                                  "76 Reviews",
                                  minFontSize: 10,
                                  maxFontSize: 20,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.amber,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        AutoSizeText(
                          "5.0 Checkin Rating > Delightful experience",
                          minFontSize: 10,
                          maxFontSize: 20,
                          maxLines: 1,
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  //Container For Hotel Details Ending //
                  //Container For Location Starts//
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 80,
                    //color: Colors.grey,
                    //Row For Location Details Starts//
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.location_history, color: Colors.amber),
                        AutoSizeText(
                          "${widget.hloc}",
                          minFontSize: 10,
                          maxFontSize: 20,
                          maxLines: 2,
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {},
                          child: AutoSizeText(
                            "Map",
                            minFontSize: 10,
                            maxFontSize: 20,
                            maxLines: 1,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //Row For Location Details Ends/
                  ),
                  //Container For Location ends//
                  //Container For Add Room And Guest and Add Conformation Page Starts//
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.black),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    //Column Holding For Add Room And Guest and Add Conformation Page  Starts//
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                  "08/09/2025",
                                  style: TextStyle(
                                    fontSize: 20,
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Check Out ",
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
                                  "08/09/2025",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //Container for Rooms and Guests Starts//
                        Container(
                          //Row Holding Room and Guest Texts Starts//
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Rooms  :  1",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Guests  :  1    ",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          //Row Holding Room and Guest Texts Ends//
                        ),
                        //Container for Rooms and Guests Ends//
                      ],
                    ),
                    //Column Holding For Add Room And Guest and Add Conformation Page  Ends//
                  ),
                  //Container For Add Room And Guest and Add Conformation Page ends//
                  //Container for Why book This And Book Now Button Starting //
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: 130,
                      //color: Colors.blueGrey,
                      //Column Holding Whybook And Rated Text And Row Containg Buy Now Button starts//
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //AutoSizeText For Whybook  Starting//
                          AutoSizeText(
                            "Why book This?",
                            minFontSize: 30,
                            maxFontSize: 40,
                            maxLines: 1,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          //AutoSizeText For whybook Ending//,
                          //AutoSizeText For Rated Text  Starting//
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: AutoSizeText(
                              "Rated High For Cleanliness",
                              minFontSize: 10,
                              maxFontSize: 20,
                              maxLines: 1,
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                          ),
                          //AutoSizeText For Rated Text  Ending//
                          //Row For Buy Now Button and Price Text Starts//
                          Row(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    "${widget.hprice}",
                                    minFontSize: 18,
                                    maxFontSize: 20,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: AutoSizeText(
                                      "₹ 2499",
                                      minFontSize: 18,
                                      maxFontSize: 20,
                                      style: TextStyle(color: Colors.black38),
                                    ),
                                  ),
                                  // Elevated Button For  Book Now And Pay Starting //
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        foregroundColor: Colors.white,
                                      ),
                                      onPressed: () {},
                                      child: AutoSizeText(
                                        "Book Now and Pay",
                                        minFontSize: 10,
                                        maxFontSize: 20,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Elevated Button For  Book Now And Pay Ending //
                                ],
                              ),
                            ],
                          ),
                          //Row For Buy Now Button and Price Text Ends//
                        ],
                      ),
                      //Column Holding Whybook And Rated Text And Row Containg Buy Now Button Ends//
                    ),
                  ),
                  //Container for Why book This And Book Now Button Ending //
                  //Container  For About This Hotel Text Starts//
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 190,
                    //color: Colors.lightGreenAccent,
                    child:
                        //Column holding heading and descriptions Starts//
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //AutoSizeText For About this Hotel  Starting//
                            AutoSizeText(
                              " About this Hotel  ",
                              minFontSize: 30,
                              maxFontSize: 40,
                              maxLines: 1,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            //AutoSizeText For About this Hotel   Ending//,
                            //AutoSizeText For Rated Text  Starting//
                            AutoSizeText(
                              "${widget.hdesc} ",
                              minFontSize: 10,
                              maxFontSize: 30,
                              maxLines: 6,
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                            //AutoSizeText For Rated Text  Ending//
                          ],
                        ),
                    //Column holding heading and descriptions Endings//
                  ),

                  //Container  For About This Hotel Text Ends//
                  //Container For Rating and Reviews Starts //
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 250,
                    // color: Colors.pink,
                    //Column holding Main Heading, sub Heading , Row of Rate card Starting //
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //AutoSizeText For Main Heading  Starting//
                        AutoSizeText(
                          " Rating And Reviews ",
                          minFontSize: 30,
                          maxFontSize: 40,
                          maxLines: 1,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        //AutoSizeText For Main Heading Ending//,
                        //Column Containing Two Sub Headings starts//
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //AutoSizeText For Sub Heading  Starting//
                            AutoSizeText(
                              " Rating & Reviews ",
                              minFontSize: 10,
                              maxFontSize: 30,
                              maxLines: 1,
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                            //AutoSizeText For Sub Heading Ending//,
                            //AutoSizeText For Sub Heading  Starting//
                            AutoSizeText(
                              " Top Reviews From India  ",
                              minFontSize: 10,
                              maxFontSize: 30,
                              maxLines: 1,
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                            //AutoSizeText For Sub Heading Ending//,
                          ],
                        ),
                        //Column Containing Two Sub Headings Ends//
                        //Column For Star and Bar Rating Cards Starts//
                        Column(
                          children: [
                            //1st Row Showing Star and Bar Rating Cards Starts//
                            Row(
                              children: [
                                Row(
                                  children: List.generate(
                                    5,
                                    (Index) => Icon(
                                      Index < 5
                                          ? Icons.star
                                          : Icons.star_border,
                                      color: Colors.amber,
                                      size: 28,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: LinearProgressIndicator(
                                    value: 0.94, // 4.2/5
                                    color: Colors.green,
                                    backgroundColor: Colors.grey.shade300,
                                    minHeight: 12,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                            ),

                            //1st Row Showing Star Rating Cards Ends//
                            //1st Row Showing Star and Bar Rating Cards Starts//
                            Row(
                              children: [
                                Row(
                                  children: List.generate(
                                    5,
                                    (Index) => Icon(
                                      Index < 4
                                          ? Icons.star
                                          : Icons.star_border,
                                      color: Colors.amber,
                                      size: 28,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: LinearProgressIndicator(
                                    value: 0.84, // 4.2/5
                                    color: Colors.green,
                                    backgroundColor: Colors.grey.shade300,
                                    minHeight: 12,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                            ),

                            //1st Row Showing Star Rating Cards Ends//
                            //2nd Row Showing Star and Bar Rating Cards Starts//
                            Row(
                              children: [
                                Row(
                                  children: List.generate(
                                    5,
                                    (Index) => Icon(
                                      Index < 3
                                          ? Icons.star
                                          : Icons.star_border,
                                      color: Colors.amber,
                                      size: 28,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: LinearProgressIndicator(
                                    value: 0.74, // 4.2/5
                                    color: Colors.green,
                                    backgroundColor: Colors.grey.shade300,
                                    minHeight: 12,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                            ),

                            //2nd Row Showing Star Rating Cards Ends//
                            //3rdRow Showing Star and Bar Rating Cards Starts//
                            Row(
                              children: [
                                Row(
                                  children: List.generate(
                                    5,
                                    (Index) => Icon(
                                      Index < 2
                                          ? Icons.star
                                          : Icons.star_border,
                                      color: Colors.amber,
                                      size: 28,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: LinearProgressIndicator(
                                    value: 0.64, // 4.2/5
                                    color: Colors.green,
                                    backgroundColor: Colors.grey.shade300,
                                    minHeight: 12,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                            ),

                            //3rd Row Showing Star Rating Cards Ends//
                            //4th Row Showing Star and Bar Rating Cards Starts//
                            Row(
                              children: [
                                Row(
                                  children: List.generate(
                                    5,
                                    (Index) => Icon(
                                      Index < 1
                                          ? Icons.star
                                          : Icons.star_border,
                                      color: Colors.amber,
                                      size: 28,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: LinearProgressIndicator(
                                    value: 0.54, // 4.2/5
                                    color: Colors.green,
                                    backgroundColor: Colors.grey.shade300,
                                    minHeight: 12,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                            ),

                            //4th Row Showing Star Rating Cards Ends//
                          ],
                        ),
                        //Column For Star and Bar Rating Cards Ends//
                      ],
                    ),

                    ////Column holding Main Heading, sub Heading , Row of Rate card Ening //
                  ),
                  //Container For Rating and Reviews Ends //
                  //Container For customer Review Starts//
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 300,
                    //color: Colors.teal,
                    child: ListView.builder(
                      itemBuilder: (context, int index) {
                        return ListTile(
                          leading: Image.asset("assets/Ellipse 33.png"),
                          title: AutoSizeText(
                            "Magnito",
                            maxFontSize: 30,
                            minFontSize: 20,
                            maxLines: 1,
                          ),
                          trailing: Text("⭐ 4.2"),
                          subtitle: ListTile(
                            title: AutoSizeText(
                              "I Booked In Agodha, so I Got it Cheap and I Was Amazed with the Services Offered ac room , Android TV Connected ,and with wifi . all this included in just 980/- .....Cleanliness Wasn't the Best  as you could expect froma mid range Oyo Rooms But overall for a solo Bussiness trip it was good",
                              maxLines: 6,
                              maxFontSize: 30,
                              minFontSize: 20,
                            ),
                          ),
                        );
                      },
                      itemCount: 2,
                    ),
                  ),
                  //Container For customer Review Ends//
                  //Container For Similar Text Starts//
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 60,
                    //color: Colors.amber,
                    child: AutoSizeText(
                      "Similar",
                      minFontSize: 25,
                      maxFontSize: 60,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  //Container For Similar Text  Ends//
                  //Container For ListView Template Starts//
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 400,
                    // color: Colors.blueAccent,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,

                      itemBuilder: (context, int index) {
                        return
                        //Container For  hotel image starts//
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            //color: Colors.amberAccent,
                            height: 150,
                            width: 600,

                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.asset(
                                        "assets/Hotel_image1.jpg",
                                        fit: BoxFit.cover,
                                        height: 110,
                                        width: double.infinity,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadiusGeometry.circular(
                                                15.0,
                                              ),

                                          child: Container(
                                            color: Colors.red,
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                8.0,
                                              ),
                                              child: Text("70% Off"),
                                            ),
                                          ),
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadiusGeometry.circular(25),
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

                                Center(
                                  child: Expanded(
                                    child: Container(
                                      height: 90,
                                      width: double.infinity,

                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AutoSizeText("⭐ 4"),
                                          AutoSizeText("bsbsduibgu"),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.location_pin,
                                                color: Colors.orange,
                                              ),
                                              Text("Location"),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              AutoSizeText(
                                                "399",
                                                minFontSize: 18,
                                                maxFontSize: 20,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 20,
                                                ),
                                                child: AutoSizeText(
                                                  "₹ 2499",
                                                  minFontSize: 18,
                                                  maxFontSize: 20,
                                                  style: TextStyle(
                                                    color: Colors.black38,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: 10,
                    ),
                  ),

                  //Container For Listview Template Ends //
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
