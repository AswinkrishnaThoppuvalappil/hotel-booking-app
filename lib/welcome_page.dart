import 'package:booking_app/Login.dart';
import 'package:booking_app/create_account_page.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,

          // main Container Containg All Widgets Starts //
          child: LayoutBuilder(
            builder: (context, constraints) {
              return FittedBox(
                fit: BoxFit.cover,
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height,
                  decoration: BoxDecoration(
                    gradient: SweepGradient(
                      colors: [
                        Colors.orange.shade600,
                        Colors.orange.shade600,
                        Colors.orange.shade600,
                        Colors.orange.shade600,
                        Colors.orange.shade600,
                        Colors.orange.shade600,
                        Colors.orange.shade600,
                        Colors.orange.shade600,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(width: 1, color: Colors.black),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Container for Location indicator starting //
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Container(
                              width: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(
                                  100,
                                ),
                                child: Image.asset(
                                  "assets/Navigator_indicator.jpg",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      //Container for Location indicator Ending //
                      //Container for Welcome Text starting //
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Expanded(
                          child: Container(
                            // width: MediaQuery.sizeOf(context).width,
                            margin: EdgeInsets.all(8),
                            child: Expanded(
                              child: AutoSizeText(
                                'Welcome To \n Booking.com',
                                minFontSize: 30,
                                maxFontSize: 35,
                                maxLines: 2,
                                overflow: TextOverflow
                                    .ellipsis, // Add ellipsis if the text overflows
                                style: const TextStyle(
                                  color: Colors.white,
                                ), // This is a starting font size, AutoSizeText will adjust it
                              ),
                            ),
                          ),
                        ),
                      ),
                      //Container for Welcome Text Ending //
                      //Container for info Text starting //
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Expanded(
                          child: Container(
                            //width: MediaQuery.sizeOf(context).width,
                            margin: EdgeInsets.all(8),
                            child: AutoSizeText(
                              'OYO App collects data to Personalise suggested hotels, offers and destinations to improve your booking experience. This data is also used to enable SOS emergency services to provide optimal resolution to your problem',
                              minFontSize: 20,
                              maxFontSize: 25,
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
                      //Container for info Text Ending  //
                      //Container for Suggetion Text starting //
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          //width: MediaQuery.sizeOf(context).width,
                          margin: EdgeInsets.all(8),
                          child: Text(
                            "Please Choose 'Allow All The Time' when asked for location access ",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),

                      //Container for Suggetion Text Ending //
                      //Sized Box For Elevation Buttons Starting//
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width - 20,
                          height: 60,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white, //
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(30),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      LoginPage(name: 'Test user'),
                                ),
                              );
                            },
                            child: Text("Allow"),
                          ),
                        ),
                      ),
                      //Sized Box For Elevation Buttons Ending//
                    ],
                  ),
                ),
              );
            },
          ),
          // main Container Containg All Widgets Ends //
        ),
      ),
    );
  }
}
