import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountInfoPage extends StatefulWidget {
  const AccountInfoPage({super.key});

  @override
  State<AccountInfoPage> createState() => _AccountInfoPageState();
}

class _AccountInfoPageState extends State<AccountInfoPage> {
  String userName = '';
  String phoneNumber = '';

  @override
  void initState() {
    // TODO: implement initState

    getUserDetails();
    super.initState();
  }

  void getUserDetails() async {
    print('%%%%%%%%%%%%%%%%%%%%');
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString("username")!;
      phoneNumber = prefs.getString("Phone")!;
    });
  }

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
      body: SafeArea(
        child: Expanded(
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Account',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
                const SizedBox(height: 20),
                Divider(),
                Center(
                  child: ListTile(
                    leading: Icon(
                      Icons.account_circle,
                      color: Colors.grey,
                      size: 50,
                    ),
                    title: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Text(userName),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(phoneNumber),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios, color: Colors.grey),
                    ),
                  ),
                ),
                Divider(),
                const SizedBox(height: 30),
                Expanded(
                  child: Container(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(),
                      itemBuilder: (Context, int index) {
                        return Center(
                          child: ListTile(
                            title: Text("${Options[index]}"),

                            trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                              ),
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
      ),
    );
  }
}
