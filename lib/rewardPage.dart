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
            Container(
              height: 500,

              color: Color.fromRGBO(255, 153, 51, 1),
              child: Column(
                children: [
                  roadMap(
                    title: 'Step 1',
                    description:
                        'You refer Booking.com app to your friends and they sign up',
                  ),

                  roadMap(
                    title: 'Step 2',
                    description: 'When they check out for first time',
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(width: 20),
                            DashedLineConnector(
                              color: Colors.white,
                              gap: 5,
                              dash: 5,
                            ),
                          ],
                        ),
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(width: 20),
                          SizedBox(
                            width: 70,
                            child: DashedLineConnector(
                              direction: Axis.horizontal,
                              color: Colors.white,
                              gap: 5,
                              dash: 5,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text.rich(
                            TextSpan(
                              text: 'You get ',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '400 Rupees Offer',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(width: 20),
                            DashedLineConnector(
                              color: Colors.white,
                              gap: 5,
                              dash: 5,
                            ),
                          ],
                        ),
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 20),
                          SizedBox(
                            width: 70,
                            child: DashedLineConnector(
                              direction: Axis.horizontal,
                              color: Colors.white,
                              gap: 5,
                              dash: 5,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text.rich(
                            TextSpan(
                              text: 'You friend gets \n',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '400 Rupees Offer',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
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

  Column roadMap({required String title, required String description}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 70,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 20),
              DashedLineConnector(color: Colors.white, gap: 5, dash: 5),
            ],
          ),
        ),

        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(
                  width: 240,
                  child: Text(
                    description,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
