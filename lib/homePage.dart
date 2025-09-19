import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String? username; //store fetched username//
  @override
  void initState() {
    super.initState();
    _loadUsername();
  }
  Future<void> _loadUsername()async{
    
  }
  List<String> cities_available = [
    "Vytila, kochi",
    "Palarivattom, kochi",
    "HighCourt_Junction,Kochi ",
    "Edappally, Kochi",
  ];
  
  
  @override
  Widget build(BuildContext context) {
    bool _favourite = false;
    String dropdownvalue = cities_available.first;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Booking",
                          style: TextStyle(
                            color: const Color.fromARGB(252, 11, 11, 11),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          width: 50,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(width: 1, color: Colors.black),
                          ),
                          child: Center(
                            child: Text(
                              ".com",
                              style: TextStyle(
                                color: const Color.fromARGB(244, 7, 7, 7),
                                fontWeight: FontWeight.w900,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(child: Icon(Icons.notification_add)),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        //Starting of The first Main Container Contains DropdownList and Greeting Text//
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Container For LoctaionDropDownList Starts//
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.location_history,
                            color: Colors.orange,
                            size: 30,
                          ),
                        ),
                        DropdownButton(
                          value: dropdownvalue,
                          icon: Icon(Icons.arrow_downward),
                          elevation: 18,
                          onChanged: (String? value) {
                            setState(() {
                              dropdownvalue = value!;
                            });
                          },
                          items: cities_available.map<DropdownMenuItem<String>>(
                            (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            },
                          ).toList(),
                        ),
                      ],
                    ),
                  ),
                  //Container For LoctaionDropDownList Ends//
                  //Container For Greetings Customer Starts//
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: AutoSizeText(
                        "Hello  ❤",
                        minFontSize: 30,
                        maxFontSize: 90,
                        maxLines: 1,
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),

                  //Container For Greetings Customer Ends//
                ],
              ),
            ),

            //Ending of The first Main Container Contains DropdownList and Greeting Text//
            //Starting of The Second Main Container Contains Paragraph  and SearchBar and offer Text//
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Container For Paragraph Starts//
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: AutoSizeText(
                        "Lets Find The Best Hotels \n around the World",
                        minFontSize: 40,
                        maxFontSize: 150,
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  //Container For Paragraph Ends//
                  //Container For Search Bar Starts //
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(width: 1, color: Colors.black),
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.search, size: 60),
                          Text("Kochi"),
                          Text("27-feb "),
                          Text("To "),
                          Text("28 feb"),
                          Text("1 guest"),
                        ],
                      ),
                    ),
                  ),

                  //Container For Search Bar Ends//
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AutoSizeText(
                        "Offers",
                        minFontSize: 25,
                        maxFontSize: 60,
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  //Container For Offer Text  Ends//
                ],
              ),
            ),

            //Ending of The Second Main Container Contains Paragraph  and SearchBar and offerText//
            //Container For ListView Template Starts//
            Expanded(
              child: Container(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,

                  itemBuilder: (context, int index) {
                    return
                    //Container For  hotel image starts//
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                        height: 800,
                        width: 500,

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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadiusGeometry.circular(15.0),

                                      child: Container(
                                        color: Colors.red,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
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
                              child: Container(
                                height: 90,
                                width: double.infinity,

                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          style: TextStyle(color: Colors.black),
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
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: 10,
                ),
              ),
            ),

            //Container For Listview Template Ends //
          ],
        ),
      ),
    );
  }
}
