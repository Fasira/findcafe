// import 'package:flutter/material.dart';
// import 'package:minipro_app/pages/profile.dart';
// import 'package:minipro_app/pages/home.dart';
// import 'package:minipro_app/pages/search.dart';
// import 'package:minipro_app/pages/favorite.dart';
// import 'package:provider/provider.dart';

// class FavoritePage extends StatefulWidget {
//   const FavoritePage({Key? key}) : super(key: key);
//   @override
//   _FavoritePageState createState() => _FavoritePageState();
// }

// class _FavoritePageState extends State<FavoritePage> {
//   int _currentIndex = 0;
  

//   void onTappedBar(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//     // Handle navigation to the corresponding screen based on the index of the tapped item
//     if (index == 0) {
//       Navigator.pop(
//         context,
//         MaterialPageRoute(builder: (context) => HomePage()),
//       );
//     } else if (index == 1) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => SearchPage()),
//       );
      
//     } else if (index == 2) {
      
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Favorite"),
//         backgroundColor: Colors.pink.shade400,
//         centerTitle: true,
//       ),
//         bottomNavigationBar: BottomNavigationBar(
//         onTap: onTappedBar,
//         currentIndex: _currentIndex,
//         selectedItemColor: Colors.pink.shade400,
//         unselectedItemColor: Colors.grey,
//         items: [
//           BottomNavigationBarItem(
//             icon: new Icon(Icons.home),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: new Icon(Icons.search),
//             label: "Search",
//           ),
//           BottomNavigationBarItem(
//             icon: new Icon(Icons.star),
//             label: "Favorite",
//           ),
//         ],
//       ),
//       body: CustomScrollView(slivers: <Widget>[
//         SliverList(
//             delegate: SliverChildListDelegate([
//           Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 15.0, top: 10.0),
//               ),
//               Container(
//                 child: ListTile(
//                   leading: Image.asset("asset/a1.jpg", fit: BoxFit.contain),
//                   title: Text("Doowall Gallery & Coffee house"),
//                   subtitle: Text("Cafe, BBQ, Bakery"),
//                   trailing: Icon(Icons.star, color: Colors.pink.shade400),
//                 ),
//               ),
//               Container(
//                 child: ListTile(
//                   leading: Image.asset("asset/a2.jpg", fit: BoxFit.contain),
//                   title: Text("Sawanbondin Farm&homestay"),
//                   subtitle: Text("Cafe, Coffee/Tea"),
//                   trailing: Icon(Icons.star, color: Colors.pink.shade400),
//                 ),
//               ),
//             ],
//           ),
//         ]))
//       ]),
//     );
//   }
// }

