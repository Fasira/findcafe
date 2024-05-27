import 'package:flutter/material.dart';
import 'package:minipro_app/pages/setting.dart';

import '../services/firebase_service.dart';
import 'landing.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PROFILE",style: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.pink.shade200,
        centerTitle: true,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  // Add your navigation code here
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingPage()),
                  );
                },
                child: Icon(
                  Icons.more_horiz_sharp,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              SizedBox(height: 16.0),
              CircleAvatar(
                backgroundImage: AssetImage('asset/s.jpg'),
                radius: 100,
              ),
              SizedBox(height: 16.0),
              Text(
                "Café Finder LV0",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Card(
                elevation: 4.0,
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          Text("Username: ",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold)),
                          Text("SpongeBob", style: TextStyle(fontSize: 18.0)),
                        ],
                      ),
                    ),
                    Divider(),
                    ListTile(
                      title: Row(
                        children: [
                          Text("Email: ",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold)),
                          Text("sponge@bikini.bt", style: TextStyle(fontSize: 18.0)),
                        ],
                      ),
                    ),
                    Divider(),
                    ListTile(
                      title:
                          Text('Coupon & Code', style: TextStyle(fontSize: 18)),
                      trailing: Icon(Icons.arrow_forward_ios_outlined),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Center(
            child: Container(
              height: 40,
              width: 90,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.pink.shade400,
                  ),
                  foregroundColor: MaterialStateProperty.all<Color>(
                    Color(0xFFFFFFFF),
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(Size(60, 20)),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.all(5),
                  ),
                ),
                onPressed: () async{
                  await FirebaseServices().signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LandingPage()
                    ),
                  );
                },
                child: Text(
                  'Log Out',
                  style: TextStyle(fontSize: 18),
                ),
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
