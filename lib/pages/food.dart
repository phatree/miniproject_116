import 'package:bmi_app/pages/bmi_main.dart';
import 'package:flutter/material.dart';

import 'blueberry.dart';
import 'choose.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  double? screenWidth;
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    screenWidth ??= MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: MyTheme.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          MyTheme.largeVerticalPadding,
          const Text(
            "Hi, Daria!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          MyTheme.mediumVerticalPadding,
          Card(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.search, color: MyTheme.grey),
                Text(
                  "Seach our 1000+ courses",
                  style: TextStyle(color: MyTheme.grey),
                )
              ],
            ),
          )),
          SizedBox(
            height: screenWidth! / 2,
            child: Stack(alignment: Alignment.topCenter, children: [
              Column(
                children: [
                  const Spacer(flex: 1),
                  Expanded(
                      flex: 3,
                      child: Card(
                        color: MyTheme.catalogueCardColor,
                        child: Container(
                          width: double.infinity,
                        ),
                      ))
                ],
              ),
              
            ]),
          ),
          MyTheme.largeVerticalPadding,
          Row(
            children: const [
              Text("Trending courses",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Spacer(),
              Icon(Icons.tune)
            ],
          ),
          GridView.count(
            childAspectRatio: 0.75,
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              courseCard(
                  courseImage: const AssetImage('images/Avocado.jpg'),
                  courseName: "How to become a YouTuber",
                  courseInfo: "Estimated 8 weeks",
                  coursePrice: "\$4.89"),
              courseCard(
                  courseImage: const AssetImage('assets/html.png'),
                  courseName: "Basic HTML for Dummies",
                  courseInfo: "Estimated 6 weeks",
                  coursePrice: "\$4.89"),
              courseCard(
                  courseImage: const AssetImage('assets/cryptocurrency.png'),
                  courseName: "Introduction to Bitcoin",
                  courseInfo: "Estimated 11 weeks",
                  coursePrice: "\$6.49"),
              courseCard(
                  courseImage: const AssetImage('assets/globe.png'),
                  courseName: "The Internet of Things",
                  courseInfo: "Estimated 10 weeks",
                  coursePrice: "\$6.49"),
            ],
          )
        ],
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
                        var route = MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                       );
                      Navigator.push(context, route);
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
                        builder: (context) => CatalogScreen(),
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

  Widget courseCard(
      {required AssetImage courseImage,
      required String courseName,
      required String courseInfo,
      required String coursePrice}) {
    return GestureDetector(
      onTap: () {
        // TODO: uncomment if you wish to navigato to course screen avaialble at FlutterBricks
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) => CourseScreen(
        //             courseName: courseName,
        //             courseImage: courseImage,
        //             courseInfo: courseInfo,
        //             coursePrice: coursePrice,
        //           )),
        // );
      },
      child: Card(
          color: MyTheme.courseCardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: screenWidth! < 400 ? 3 : 5,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      image: courseImage,
                    ),
                  ),
                ),
                Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(courseName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Text(courseInfo,
                            style:
                                TextStyle(fontSize: 12, color: MyTheme.grey)),
                        MyTheme.smallVerticalPadding,
                        Text(
                          coursePrice,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ))
              ],
            ),
          )),
    );
  }
}

class MyTheme {
  static Color get backgroundColor => const Color(0xFFF7F7F7);
  static Color get grey => const Color(0xFF999999);
  static Color get catalogueCardColor =>
      const Color(0xFFBAE5D4).withOpacity(0.5);
  static Color get catalogueButtonColor => const Color(0xFF29335C);
  static Color get courseCardColor => const Color(0xFFEDF1F1);
  static Color get progressColor => const Color(0xFF36F1CD);

  static Padding get largeVerticalPadding =>
      const Padding(padding: EdgeInsets.only(top: 32.0));

  static Padding get mediumVerticalPadding =>
      const Padding(padding: EdgeInsets.only(top: 16.0));

  static Padding get smallVerticalPadding =>
      const Padding(padding: EdgeInsets.only(top: 8.0));

  static ThemeData get theme => ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blueGrey,
      ).copyWith(
        cardTheme: const CardTheme(
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0)))),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0.0),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
                catalogueButtonColor), // Button color
            foregroundColor: MaterialStateProperty.all<Color>(
                Colors.white), // Text and icon color
          ),
        ),
      );
}
