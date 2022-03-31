import 'package:bmi_app/pages/add_product.dart';
import 'package:flutter/material.dart';
import 'package:bmi_app/pages/bmi_main.dart';

import 'choose.dart';
import 'food.dart';


class Course extends StatefulWidget {
  // ignore: avoid_types_as_parameter_names
  const Course({Key? key}) : super(key: key);

  @override
  _CourseState createState() => _CourseState();
}

class _CourseState extends State<Course> {
  int _selectedIndex = 3;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            
            image: DecorationImage( //พื้นหลัง
              image: AssetImage('images/me.jpg'),
              fit: BoxFit.cover,
              
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
      )
    );
     
      
  }
}