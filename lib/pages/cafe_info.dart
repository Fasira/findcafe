import 'package:flutter/material.dart';

class CafeInfo extends StatelessWidget {
  final Map<String, dynamic> cafe;

  CafeInfo({Key? key, required this.cafe, required description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(cafe['name']),
          backgroundColor: Colors.pink.shade200,
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
            child: Card(
              color: Colors.pink.shade200,
              child: SingleChildScrollView(
                child: SizedBox(
                  width: 360,
                  height: 1130,
                  child: Card(
                    child: Column(
                      children: [
                        SizedBox(height: 20.0),
                        CircleAvatar(
                          backgroundImage: AssetImage(cafe['logo']),
                          radius: 90,
                        ),
                        SizedBox(height: 20),
                        Text(
                          cafe['name'],
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          cafe['type'],
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal:
                                  20), //เพื่อไม่ให้ข้อความด้านข้างชิดขอบ
                          child: Text(
                            cafe['des'],
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            height: 180.0,
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return Card(
                                  child: Container(
                                    width: 250.0,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(cafe['image']),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                  ),
                                );
                              },
                              itemCount: 3,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Row(
                                  children: [
                                    Icon(
                                      Icons.phone,
                                      color: Colors.pink.shade200,
                                    ),
                                    SizedBox(width: 13),
                                    Text(
                                      cafe['call'],
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_pin,
                                      color: Colors.pink.shade200,
                                      size: 29,
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cafe['place'],
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            height:10),
                        Image.asset('asset/m.png',
                          width: 310,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
