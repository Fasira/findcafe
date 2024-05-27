import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:minipro_app/pages/profile.dart';
import 'package:minipro_app/pages/home.dart';
import 'package:minipro_app/pages/search.dart';
import 'package:minipro_app/pages/cafe_info.dart';
// import 'package:minipro_app/pages/favorite.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Search Page",
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _currentIndex = 0;

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
    // Handle navigation to the corresponding screen based on the index of the tapped item
    if (index == 0) {
      Navigator.pop(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else if (index == 1) {}
    // else if (index == 2) {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => FavoritePage()),
    //   );
    // }
  }

  List<Map<String, dynamic>> _allCafe = [
    {
      "image": "asset/a9.jpg",
      "cafe1": "asset/cafe/c9.webp",
      "cafe2": "asset/cafe/c9.2.jpeg",
      "logo": "asset/logos/g9.jpeg",
      "name": "The Wanderer",
      "type": "International, Coffee/Tea, Bakery/Caky",
      "call": "0639323956",
      "place": "537/1 Mueang Chiang Rai District, Chiang Rai 57100",
      "des":
          "    คาเฟ่เชียงรายที่ตั้งอยู่กลมกลืนไปกับต้นไม้ที่มีอยู่ก่อนแล้วครับ ตัวร้านแบ่งเป็นหลาย ๆ โซน โดยเราต้องไปสั่งอาหารและเครื่องดื่มก่อน แล้วจึงเดินมาเลือกโต๊ะที่ชอบ ได้สั่งเป็น “Espresso เสาวรส” เมนูแนะนำของร้าน รสชาติดี เปรี้ยวแบบสดชื่น ๆ พร้อมรสกาแฟเย็นชื่นใจ “พายมะพร้าวอ่อน” จานนี้ต้องห้ามพลาดเด็ดขาด หวานน้อย หอมมะพร้าว โดยรวมเป็นร้านที่ร่มรื่น สวยงาม น่ามานั่งกินอาหารมาก ๆ ครับ (โดยคุณ chubbylawyer)"
    },
    {
      "image": "asset/a10.jpg",
      "cafe1": "asset/cafe/c10.jpeg",
      "cafe2": "asset/cafe/c10.2.jpeg",
      "logo": "asset/logos/g10.jpeg",
      "name": "Garegaron Cafe",
      "type": "Cafe, Coffee/Tea",
      "call": "053781379",
      "place":
          "ข้างอำเภอเวียงป่าเป้า เลขที่ 331 หมู่ 6 เวียง Wiang Pa Pao District, Chiang Rai 57170",
      "des":
          "    เป็นคาเฟ่ในเมืองเชียงรายที่ออกติสท์ ๆ หน่อย ชื่อว่า “กาเรการ่อน” มาครั้งนี้แวะมาชิม “สลัดเห็ดย่าง” น้ำสลัดรสชาติดีค่ะ เข้มข้น หอมงาขาว ส่วนเห็ดก็ให้มาเยอะอยู่ “Hot Latte” ลาเต้อาร์ตทำมาสวยค่ะ รสชาตินุ่ม จับใจ ส่วนบริการก็ดีค่ะ พนักงานต้อนรับดีมาก ร้านนี้มีมุมถ่ายรูปอาร์ต ๆ เยอะเลยค่ะ รวม ๆ จัดว่าเป็นคาเฟ่ในเชียงรายที่มีคุณภาพอีกร้านในย่านนี้ค่ะ (โดยคุณ SOYA)"
    },
    {
      "image": "asset/a6.jpg",
      "cafe1": "asset/cafe/c6.webp",
      "cafe2": "asset/cafe/c6.2.webp",
      "logo": "asset/logos/g6.jpeg",
      "name": "Choui Fong",
      "type": "Coffee/Tea, Bakery/Cake",
      "call": "0637795999",
      "place": "Pa Sang, Mae Chan District, Chiang Rai 57110",
      "des":
          "    ไร่ชาและคาเฟ่ในเชียงรายที่มีบริเวณกว้างขวาง เหมาะกับการมาเที่ยวมาก ๆ เมนูดังของที่นี่ จะเน้นไปที่เมนูที่ทำจาก “ชา” ค่ะ โดยเฉพาะพวกชาเขียวคือห้ามพลาดเลย แนะนำ “เครปเค้กชาเขียว” รสชาติดี ชาเขียวเน้น ๆ ค่ะ “ครัวซองต์ชาเขียว” ก็ดี กรอบนอก ด้านในฉ่ำ ๆ และ “บิงซูชาเขียว” หอมชาดี ไม่หวานมาก เหมาะกับอากาศร้อน ๆ รวม ๆ แล้วขนมรสชาติดี ใครเป็นสายชาเขียว ต้องแวะมาค่ะ (โดยคุณ CaramelxDiary)"
    },
    {
      "image": "asset/a7.jpg",
      "cafe1": "asset/cafe/c7.webp",
      "cafe2": "asset/cafe/c7.2.webp",
      "logo": "asset/logos/g7.jpeg",
      "name": "Manorom",
      "type": "Cafe",
      "call": "0923737666",
      "place":
          "499, 2 สันป่าหนาด ซอย 2/2 Wiang, Mueang Chiang Rai District, Chiang Rai 57000",
      "des":
          "    ร้านอาหารและคาเฟ่ในเมืองเชียงรายกลางสวน ริมแม่น้ำกก ทางร้านมีบริการอาหารและเครื่องดื่ม รวมถึงขนมด้วย ได้สั่งมาเป็น “ข้าวพะแนงหมู” รสชาติหวานเค็มกำลังดีเลย ส่วนขนมสั่งเป็น “Coconut Cake Roll” เป็นเมนูที่ต้องลอง เนื้อเค้กนุ่มกำลังดีเลยครับ (โดยคุณ chaichuanchim)"
    },
    {
      "image": "asset/a8.jpg",
      "cafe1": "asset/cafe/c8.webp",
      "cafe2": "asset/cafe/c8.2.webp",
      "logo": "asset/logos/g8.jpeg",
      "name": "Dear Friends, Bistro",
      "type": "International, Coffee/Tea, Bakery/Cak",
      "call": "0980547878",
      "place":
          "1015 Jetyod Rd, Tambon Wiang, Mueang Chiang Rai District, Chiang Rai 57000",
      "des":
          "    คาเฟ่ในเมืองเชียงรายแถวซอยวัดเจ็ดยอด ภายในร้านน่านั่งมากครับ มีขนมให้เลือกหลากหลายอยู่ครับ เช่น สโคน ชูครีม และเค้กต่าง ๆ ส่วนเครื่องดื่มก็มีให้เลือกตั้งแต่น้ำผลไม้ จนถึง Specialty Coffee ที่ได้เมล็ดกาแฟคัดมาจากที่ต่าง ๆ รวมถึงชาที่เบลนด์เป็นพิเศษด้วย ผมสั่ง “Matcha Choux Cream” หน้าตาและรสชาติถือว่าดีเลย ส่วนเครื่องดื่มผมสั่งเป็น “Iced Americano” ถูกใจเลยครับ (โดยคุณ chaichuanchim)"
    },
    {
      "image": "asset/a3.jpg",
      "cafe1": "asset/cafe/c3.webp",
      "cafe2": "asset/cafe/c3.2.webp",
      "logo": "asset/logos/g3.jpeg",
      "name": "Polar Boulangerie & Patisserie",
      "type": "Cafe, Bakery/Cake, Breakfast",
      "call": "0873669366",
      "place":
          "266 Moo 1 Rob Viang, Mueang Chiang Rai District, Chiang Rai 57000",
      "des":
          "    เป็นคาเฟ่ในเชียงรายที่ควรค่าแก่การมาในปี 2565 นี้มาก ๆ แม้จะอยู่ไกล แต่บรรยากาศท่ามกลางธรรมชาติมันดีจริง ๆ ผมสั่ง “Choux Cream” ส่วนตัวคือชอบมากครับ มีความละมุนนุ่มลิ้น เปลือกคือใช่ ไส้ครีมก็ดี สำหรับเครื่องดื่มผมสั่ง “Flat White” รสชาติกลมกล่อมใช้ได้เลย ใครกำลังหาร้านนั่งชิลในเชียงราย บรรยากาศดี ๆ ขนมเด็ด ๆ ก็ขอแนะนำร้านนี้เลยครับ (โดยคุณ chaichuanchim)"
    },
    {
      "image": "asset/a4.jpg",
      "cafe1": "asset/cafe/c4.webp",
      "cafe2": "asset/cafe/c4.2.webp",
      "logo": "asset/logos/g4.jpeg",
      "name": "Hacienda Coffee House",
      "type": "Cafe",
      "call": "0896863354",
      "place": "333 Moo 3 Thasud Muang, Chiang Rai 57100",
      "des":
          "    คาเฟ่แม่จันบรรยากาศสไตล์สวนอังกฤษ ตัวร้านมีที่จอดรถหน้าร้าน มีโซนระเบียงขนาดใหญ่ วิวสวยมาก ดูร่มรื่นดี ภายในอาคารก็ตกแต่งได้สวยงามเช่นกัน มีบริการทั้งอาหารคาวและหวาน รวมถึงเครื่องดื่มอีกด้วย วันนี้ได้มาลองเป็น “เค้กสตรอว์เบอร์รี” ที่รสชาติใช้ได้ กินคู่กับชา พร้อมชมบรรยากาศไปด้วยคือดีเลย แนะนำให้มาค่ะ ยิ่งช่วงหน้าหนาว ยิ่งฟินสุด ๆ (โดยคุณ Arisayui)"
    },
    {
      "image": "asset/a5.jpg",
      "cafe1": "asset/cafe/c5.webp",
      "cafe2": "asset/cafe/c5.2.webp",
      "logo": "asset/logos/g5.jpeg",
      "name": "Yoyo Farm",
      "type": "Cafe",
      "call": "0933070898",
      "place": "1001 Doichang Village Wa Wi, Mae Suai District",
      "des":
          "    มาเที่ยวถึงดอยช้าง ต้องไม่พลาดคาเฟ่เชียงรายแห่งนี้ ที่มีชื่อเสียง คนแวะมากันเยอะมาก ด้วยวิวภูเขาสวย ๆ มุมถ่ายรูปเยอะมาก มีบริการทั้งอาหาร เครื่องดื่ม และขนม วันนี้ได้สั่งเป็นซิกเนเจอร์ของทางร้านอย่าง “Yuzu on the Hill” กาแฟดำผสมน้ำส้มยูสุ รสเปรี้ยวนิด ๆ ตัดกับกาแฟเข้มข้น ดื่มง่าย รสชาติดีค่ะ และ “Sugar Man” กาแฟน้ำตาลช่อดอกมะพร้าว หวานอ่อน ๆ รสชาติดีค่ะ (โดยคุณ Muummy)"
    },
    {
      "image": "asset/a1.jpg",
      "cafe1": "asset/cafe/c1.jpeg",
      "cafe2": "asset/cafe/c1.2.jpeg",
      "logo": "asset/logos/g1.jpeg",
      "name": "Doowall Gallery & Coffee house",
      "type": "Cafe, BBQ, Bakery",
      "call": "0802894544",
      "place":
          "Unnamed Road, Pa O Don Chai, Mueang Chiang Rai District, Chiang Rai 57250",
      "des":
          "  cafe เชียงรายที่มีที่พักในตัวด้วย ทางร้านมีบริการอาหารคาวหวานและเครื่องดื่มให้เลือกกันได้ นอกจากนี้ ด้วยความที่เจ้าของร้านชอบงานศิลปะ เลยจะมีรูปภาพเต็มไปหมด ดูสะอาดตามาก ๆ ครับ ได้สั่ง “Blueberry Pie” พายรสชาติดี กินคู่กับ “น้ำผึ้งมะนาว” ที่มีความเปรี้ยวหวานของมะนาวดี แล้วลงตัวสุด ๆ (โดยคุณ Pawarit.t)"
    },
    {
      "image": "asset/a2.jpg",
      "cafe1": "asset/cafe/c2.webp",
      "cafe2": "asset/cafe/c2.2.webp",
      "logo": "asset/logos/g2.jpeg",
      "name": "Sawanbondin Farm&homestay",
      "type": "Cafe, Coffee/Tea",
      "call": "0812053554",
      "place": "171/12 Moo 1 Mueang Chiang Rai District, Chiang Rai 57100",
      "des":
          "  คาเฟ่เชียงรายร้านเล็ก ๆ ในดงหมู่บ้าน บรรยากาศชวนให้จิตใจสงบและอบอุ่นไปพร้อม ๆ กัน ภายในตกแต่งด้วยสีไม้ ตัดกับสีเขียวของต้นไม้ มีบริการเครื่องดื่มหลากหลาย รสชาติแปลกใหม่น่าลอง ได้สั่งเป็น “Classic Thai Latte Tea” ชาไทยสุดพรีเมียม ดื่มง่าย “Affogato” ไอศกรีมชาดำเปลือกส้ม พร้อมกาแฟรสเข้ม หอมลงตัว และ “Blue Latte” อัญชันนมสุดหอมละมุน ที่ร้านยังมี Workshop เกี่ยวกับชาด้วยนะ แนะนำติดต่อที่ร้านได้เลย (โดยคุณ Ployynp)"
    },
  ];

  List<Map<String, dynamic>> _foundCafe = [];
  @override
  void initState() {
    // TODO: implement initState
    _foundCafe = _allCafe;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allCafe;
    } else {
      results = _allCafe
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundCafe = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("SEARCH",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.pink.shade200,
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTappedBar,
          currentIndex: _currentIndex,
          backgroundColor: Colors.pink.shade200,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey.shade300,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.search),
              label: "Search",
            ),
            // BottomNavigationBarItem(
            //   icon: new Icon(Icons.star),
            //   label: "Favorite",
            // ),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey),
                  ),
                  margin: EdgeInsets.only(left: 10, right: 10),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (value) => _runFilter(value),
                          decoration: InputDecoration(
                              hintText: "Enter text", border: InputBorder.none),
                          style: TextStyle(color: Colors.grey[800]),
                        ),
                      ),
                      Icon(
                        Icons.search,
                        color: Colors.grey[700],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _foundCafe.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CafeInfo(
                                cafe: _foundCafe[index],
                                description: String,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width:
                              double.infinity, // Replace with the desired width
                          height: 80, // Replace with the desired height
                          child: Card(
                            key: ValueKey(_foundCafe[index]["image"]),
                            child: ListTile(
                              leading: Image.asset(_foundCafe[index]["image"]),
                              title: Text(_foundCafe[index]["name"]),
                              subtitle: Text(_foundCafe[index]["type"]),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            )));
  }
}
