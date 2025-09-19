import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:timelines_plus/timelines_plus.dart'
    hide TimelineTile, IndicatorStyle;
import 'package:timeline_tile/timeline_tile.dart';

class Rewardpage extends StatefulWidget {
  const Rewardpage({super.key});

  @override
  State<Rewardpage> createState() => _RewardpageState();
}

class _RewardpageState extends State<Rewardpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reward")),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Invite And Earn", style: TextStyle(fontSize: 25)),
            //Container For TimeLine Srats //
            Expanded(
              child: Container(
                height: 500,
                color: Colors.orange,
                child: ListView(
                  children: [
                    SizedBox(height: 30),
                    Container(
                      // width: MediaQuery.sizeOf(context).width * 0.8,
                      height: MediaQuery.sizeOf(context).height * 0.2,
                      child: TimelineTile(
                        isFirst: false,
                        alignment: TimelineAlign.manual,
                        lineXY: 0.3,
                        indicatorStyle: IndicatorStyle(
                          width: 30,
                          drawGap: true,
                          color: Colors.white,
                          iconStyle: IconStyle(
                            iconData: Icons.share,
                            color: Colors.white,
                          ),
                        ),
                        beforeLineStyle: LineStyle(
                          color: Colors.white,
                          thickness: 3,
                        ),
                        endChild: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            "Step 1\n Reffer Your Booking.com app to your\n friend and they sign up",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),

                    Container(
                      // width: MediaQuery.sizeOf(context).width * 0.8,
                      height: MediaQuery.sizeOf(context).height * 0.2,
                      child: TimelineTile(
                        alignment: TimelineAlign.manual,
                        lineXY: 0.3,
                        indicatorStyle: IndicatorStyle(
                          width: 30,
                          color: Colors.white,
                          iconStyle: IconStyle(
                            iconData: Icons.person_add,
                            color: Colors.white,
                          ),
                        ),
                        beforeLineStyle: LineStyle(
                          color: Colors.white,
                          thickness: 3,
                        ),
                        endChild: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            "step 2\n when they checkout for  1st time",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      //width: MediaQuery.sizeOf(context).width * 0.8,
                      height: MediaQuery.sizeOf(context).height * 0.2,
                      child: TimelineTile(
                        isLast: false,
                        alignment: TimelineAlign.manual,
                        lineXY: 0.3,
                        indicatorStyle: IndicatorStyle(
                          width: 30,
                          color: Colors.white,
                          iconStyle: IconStyle(
                            iconData: Icons.card_giftcard,
                            color: Colors.white,
                          ),
                        ),
                        beforeLineStyle: LineStyle(
                          color: Colors.white,
                          thickness: 3,
                        ),
                        endChild: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            "You Get 400 Rupee Offer",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      //width: MediaQuery.sizeOf(context).width * 0.8,
                      height: MediaQuery.sizeOf(context).height * 0.2,
                      child: TimelineTile(
                        isLast: true,
                        alignment: TimelineAlign.manual,
                        lineXY: 0.3,
                        indicatorStyle: IndicatorStyle(
                          width: 30,
                          color: Colors.white,
                          iconStyle: IconStyle(
                            iconData: Icons.card_giftcard,
                            color: Colors.white,
                          ),
                        ),
                        beforeLineStyle: LineStyle(
                          color: Colors.white,
                          thickness: 3,
                        ),
                        endChild: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            "Your Friend Gets 400 Rupee Offer",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Container For TimeLine Ends //

            //Container For Elevated Button Starts//
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width - 20,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(25),
                      ),
                    ),
                    onPressed: () {},
                    child: AutoSizeText(
                      'Invite And Earn',
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
            ),
            //Container For Elevated Button Ends//
          ],
        ),
      ),
    );
  }
}
