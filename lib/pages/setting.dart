import 'package:flutter/material.dart';
import 'package:minipro_app/pages/landing.dart';
import 'package:minipro_app/services/firebase_service.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: SettingPage(),
    );
  }
}

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SETTING",
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.pink.shade200,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0),
            child: Text("General",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Card(
            elevation: 4.0,
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.person_outlined),
                  title: Text('Account', style: TextStyle(fontSize: 18)),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                  onTap: () {},
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.notifications_outlined),
                  title: Text('Notification', style: TextStyle(fontSize: 18)),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                  onTap: () {},
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.language_outlined),
                  title: Text('Language', style: TextStyle(fontSize: 18)),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                  onTap: () {},
                ),
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 20.0, top: 5.0),
          //   child: Text("About us",
          //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          // ),
          // Card(
          //   elevation: 4.0,
          //   margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
          //   child: Column(
          //     children: [
          //       ListTile(
          //         leading: Icon(Icons.contacts_outlined),
          //         title: Text('Contact us', style: TextStyle(fontSize: 18)),
          //         trailing: Icon(Icons.arrow_forward_ios_outlined),
          //         onTap: () {},
          //       ),
          //       Divider(),
          //       ListTile(
          //         leading: Icon(Icons.privacy_tip_rounded),
          //         title: Text('Privacy policy', style: TextStyle(fontSize: 18)),
          //         trailing: Icon(Icons.arrow_forward_ios_outlined),
          //         onTap: () {},
          //       ),
          //       Divider(),
          //       ListTile(
          //         leading: Icon(Icons.support_agent_rounded),
          //         title: Text('Support', style: TextStyle(fontSize: 18)),
          //         trailing: Icon(Icons.arrow_forward_ios_outlined),
          //         onTap: () {},
          //       ),
          //     ],
          //   ),
          // ),
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
    );
  }
}
