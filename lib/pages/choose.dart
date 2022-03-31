
// import 'dart:js';


import 'package:bmi_app/pages/your.dart';
import 'package:flutter/material.dart';

import 'add_product.dart';
import 'blueberry.dart';
import 'food.dart';
import 'package:bmi_app/pages/bmi_main.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              TopBar(),
              SearchInput(),
              PromoCard(),
              Headline(),
              CardListView(),
              SHeadline(),

            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: SizedBox(
          height: 56,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconBottomBar(
                    text: "หน้าหลัก",
                    icon: Icons.home,
                    selected: _selectedIndex == 0,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                    }),
                IconBottomBar(
                    text: "อาหาร",
                    icon: Icons.restaurant,
                    selected: _selectedIndex == 1,
                    onPressed: () {
                      setState(() {
                      _selectedIndex = 1;
                      var route = MaterialPageRoute(
                        builder: (context) => AddProductPage(),
                       );
                      Navigator.push(context, route);
                      });
                    }),
                IconBottomBar(
                    text: "การเดิน",
                    icon: Icons.map,
                    selected: _selectedIndex == 2,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 2;
                        showDialog<void>(context: context, builder: (context) => alertDialoog());
                      });
                    }),
                IconBottomBar(
                    text: "ฉัน",
                    icon: Icons.person,
                    selected: _selectedIndex == 3,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 3;
                        var route = MaterialPageRoute(
                        builder: (context) => Course(),
                       );
                      Navigator.push(context, route);
                      });
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  IconBottomBar(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: selected ? const Color(0xff15BE77) : Colors.grey,
          ),
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 14,
              height: .1,
              color: selected ? const Color(0xff15BE77) : Colors.grey),
        )
      ],
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Take Care \nOf Yourself",
            style: TextStyle(
                color: Colors.black, 
                fontSize: 30, 
                fontWeight: FontWeight.bold),
          ),
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  offset: const Offset(12, 26),
                  blurRadius: 50,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(.25)),
            ]),
            child: const CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.icecream,
                size: 25,
                color: Color(0xff53E88B),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 8.0, left: 25.0, right: 25.0, bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              offset: const Offset(12, 26),
              blurRadius: 50,
              spreadRadius: 0,
              color: Colors.grey.withOpacity(.1)),
        ]),
        child: TextField(
          onChanged: (value) {
            //Do something wi
          },
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            filled: true,
            fillColor: Colors.white,
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.grey),
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
          ),
        ),
      ),
    );
  }
}

class PromoCard extends StatelessWidget {
  const PromoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
                colors: [Color(0xff15BE77), Color(0xff15BE77)])),
        child: Stack(
          children: [
            Opacity(
              opacity: .5,
              child: Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/miniproject-90d68.appspot.com/o/BACKGROUND%202.png?alt=media&token=cde6ae7c-4cd9-4559-bf26-dc6b492e6a25",
                  fit: BoxFit.cover),
            ),
            Image.network(
                "https://firebasestorage.googleapis.com/v0/b/miniproject-90d68.appspot.com/o/Image.png?alt=media&token=dfd1baa1-1a3d-480d-89dc-2aa42b711555"),
            const Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(25.0),
                child: Text(
                  "The best \nfood to you",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Headline extends StatelessWidget {
  const Headline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "อาหารคลีนเพื่อสุขภาพ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                "อิ่มง่าย สบายท้อง ใยอาหารสูง",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
          const Text(
            "ดูเพิ่มเติม",
            style: TextStyle(
                color: Color(0xff15BE77), fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}

class SHeadline extends StatelessWidget {
  const SHeadline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "เสริมกล้ามเนื้อด้วยโปรตีน",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                "สารอาหารสำคัญ เพื่อความแข็งแรง",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
          Text(
            "ดูเพิ่มเติม",
            style: TextStyle(
                color: Color(0xff15BE77), fontWeight: FontWeight.normal),
          ),
        ],
      ),
    ); 
  }
}

class CardListView extends StatelessWidget {
  const CardListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, right: 25.0, bottom: 15.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 175,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            CategoryCardMallika1(
            
            title: "บลูเบอร์รี่",
            image:
                "https://firebasestorage.googleapis.com/v0/b/miniproject-90d68.appspot.com/o/Avocado.png?alt=media&token=275b3e36-1ca9-4651-bbcf-8a7c5d3ef3fe",
            onTap: () {},
           ),
          
          CategoryCardMallika1(
              title: "ผัดหน่อไม้ฝรั่ง",
              image:
                  "https://firebasestorage.googleapis.com/v0/b/miniproject-90d68.appspot.com/o/mnuo.png?alt=media&token=2e50b865-5b06-4e77-97f3-96f7bfc63173",
              onTap: () {}),
          CategoryCardMallika1(
              title: "กรีกโยเกิร์ต",
              image:
                  "https://firebasestorage.googleapis.com/v0/b/miniproject-90d68.appspot.com/o/Smoothie.png?alt=media&token=88254670-921f-4451-8abc-0f0b1b7e58df",
              onTap: () {}),
          CategoryCardMallika1(
              title: "อกไก่ผัดกะปิ",
              image:
                  "https://firebasestorage.googleapis.com/v0/b/miniproject-90d68.appspot.com/o/asdj.png?alt=media&token=a1d12ff7-0082-4bbf-b2d9-ba2bbf332d0c",
              onTap: () {}),
              CategoryCardMallika1(
            title: "ข้าวไรซ์เบอร์รี่",
            image:
                "https://firebasestorage.googleapis.com/v0/b/miniproject-90d68.appspot.com/o/monn.png?alt=media&token=a7d80806-3557-423c-a378-5b8dcb004a60",
            onTap: () {},
            //selected: true,
          ),
          CategoryCardMallika1(
              title: "อัลมอนด์",
              image:
                  "https://firebasestorage.googleapis.com/v0/b/miniproject-90d68.appspot.com/o/Image2.png?alt=media&token=ce14384f-8cf0-4e68-a730-f7f262b76820",
              onTap: () {}),
          CategoryCardMallika1(
              title: "แกงจืดไก่สับ",
              image:
                  "https://firebasestorage.googleapis.com/v0/b/miniproject-90d68.appspot.com/o/Image1.png?alt=media&token=daf931a9-d2ca-4a44-ba50-2d60386c4361",
              onTap: () {}),
          CategoryCardMallika1(
              title: "กราโนร่า",
              image:
                  "https://firebasestorage.googleapis.com/v0/b/miniproject-90d68.appspot.com/o/Overnight.png?alt=media&token=0154cb92-0998-4fce-aa4b-1194fe15a68c",
              onTap: () {}),
          ],
        ),
      ),
     );
  }
}

 Widget alertDialoog(){
    return AlertDialog(
      title: Row(
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            // child: Icon(
            //   color: Colors.red,
            // ),
          ),
          Text('ไม่สามารถใช้งานได้')
        ],
      ),
      // title: ,
      content: const Text(
        'สำหรับลูกค้าพรีเมี่ยมเท่านั้น',
        style: TextStyle(fontSize: 18),
      ),

      actions: [
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.green),
          ),
          // textColor: Color(0xFF6200EE),
          // onPressed: () {
          //   return Navigator.pop(context);
          // },
          onPressed: () {  },
          child: const Text('โอเค!'),
        ),
      ],
    );
  }

   

// SizedBox bottomBtn() {
//     onPressed: () {
//             var route = MaterialPageRoute(
//               builder: (context) => CatalogScreen(),
//               );
//               Navigator.push(context, route);
//           },
//  }

  
