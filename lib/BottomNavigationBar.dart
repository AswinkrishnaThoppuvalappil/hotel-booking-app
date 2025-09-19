import 'package:booking_app/account_info_page.dart';

import 'package:booking_app/homePage1.dart';
import 'package:booking_app/mybooking.dart';
import 'package:booking_app/rewardPage.dart';
import 'package:flutter/material.dart';

class Bottomnavigationbar extends StatefulWidget {
  String? User;
  var selectedCheckinDate;
  var selectedCheckoutDate;
  String? hname;
  String? hdesc;
  int? hprice;
  String? hloc;
  String? haddr;
  String? himage;
  Bottomnavigationbar({super.key, required this.User});

  @override
  State<Bottomnavigationbar> createState() => _BottomnavigationbarState();
}

class _BottomnavigationbarState extends State<Bottomnavigationbar> {
  int index = 0;
  late List navigationItems = [
    Homepage1(Uname: widget.User, phone: ""),
    Mybooking(
      // selectedCheckinDate: "${widget.selectedCheckinDate}",
      // selectedCheckoutDate: "${widget.selectedCheckoutDate}",
      // haddr: "${widget.haddr}",
      // hdesc: "${widget.hdesc}",
      // himage: "${widget.himage}",
      // hloc: "${widget.hloc}",
      // hname: "${widget.hname}",
      // hprice: 1,
    ),
    Rewardpage(),
    AccountInfoPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        fixedColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag, color: Colors.black),
            label: "Booking",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard, color: Colors.black),
            label: "Reward",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black),
            label: "Profile",
          ),
        ],
        currentIndex: index,
        onTap: (int pointer) {
          setState(() {
            index = pointer;
          });
        },
      ),
      body: navigationItems.elementAt(index),
    );
  }
}
