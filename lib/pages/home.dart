import 'package:flutter/material.dart';
import 'package:bmi_app/pages/bmi_main.dart';

class HomePage extends StatefulWidget {
  // ignore: avoid_types_as_parameter_names
  const HomePage({Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            
            image: DecorationImage( //พื้นหลัง
              image: AssetImage('images/you.jpg'),
              fit: BoxFit.cover,
              
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              menuHeader(),
              welcomeText(),
              bottomBtn(), //เปิดหน้าใหม่อย่าลืมแก้
            ],
          ),
        ),
      ),
    );
  }

  SizedBox bottomBtn() {
    return SizedBox(
      width: 230,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            var route = MaterialPageRoute(
              builder: (context) => Calculate(),
              );
              Navigator.push(context, route);
          },

          child: const Text(
            'เริ่มต้นใช้งาน',
            style: TextStyle(fontSize: 20),
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 255, 255, 255)),
            foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
      ),
    );
  }

  Column welcomeText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Take Care Of Yourself',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        
        Text(
          'ไดอารี่ดูแลตัวเอง',
          style: TextStyle(
            fontSize: 24,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ],
    );
  }

  Row menuHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.help),
          label: const Text('ความช่วยเหลือ'),
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
        Container(
          width: 2,
          height: 20,
          color: Colors.white,
        ),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.info),
          label: const Text('เกี่ยวกับแอป'),
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
      ],
    );
  }
}
