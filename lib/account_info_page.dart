import 'package:flutter/material.dart';

class AccountInfoPage extends StatefulWidget {
  const AccountInfoPage({super.key});

  @override
  State<AccountInfoPage> createState() => _AccountInfoPageState();
}

class _AccountInfoPageState extends State<AccountInfoPage> {
  List<String> Options = [
    "FeedBack",
    "Privacy and Policy",
    "Terms And Conditions",
    "Help",
    "About",
    "Change Language",
    "Contact us",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Account ",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Expanded(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: ListTile(
                  leading: Icon(
                    Icons.account_circle,
                    color: Colors.grey,
                    size: 50,
                  ),
                  title: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Text("Akshay"),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("+919054664813"),
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_right_sharp),
                  ),
                ),
              ),
              SizedBox(width: 500, height: 100),
              Expanded(
                child: Container(
                  child: ListView.builder(
                    itemBuilder: (Context, int index) {
                      return Center(
                        child: ListTile(
                          title: Text("${Options[index]}"),

                          trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_right_sharp),
                          ),
                        ),
                      );
                    },
                    itemCount: Options.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
