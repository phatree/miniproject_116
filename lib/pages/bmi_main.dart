import 'package:bmi_app/pages/bmi_result.dart';
import 'package:flutter/material.dart';
import 'dart:math';


class Calculate extends StatefulWidget {
  const Calculate({
    Key? key,
  }) : super(key: key);

  @override
  _CalculateState createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _weight = TextEditingController();
  final TextEditingController _height = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/you.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FormTextfield(),
              SizedBox(
                height: 20,
              ),
              //heightTextfield(),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                   if (_weight.text.isNotEmpty &&
                _height.text.isNotEmpty) {
              Calculator cal = Calculator(double.parse(_weight.text),
                  double.parse(_height.text));
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Result(
                    result: cal.calculateBMI(),
                    bmi : cal.resultText(),
                  ),
                ),
              );
            } else {
              showDialog<void>(context: context, builder: (context) => alertDialog());
            }
          },
                child: const Text(
                  'คำนวณ',
                  style: TextStyle(fontSize: 20),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                  ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget FormTextfield() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: _weight,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "กรุณาการอกน้ำหนักของคุณ";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'น้ำหนัก(กิโลกรัม)',
                      prefixIcon: Icon(Icons.approval_rounded ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.done,
                    controller: _height,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "กรุณากรอกส่วนสูงของคุณ";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'ส่วนสูง(เซนติเมตร)',
                      prefixIcon: Icon(Icons.accessibility_new_sharp ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget alertDialog(){
    return AlertDialog(
      title: Row(
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            // child: Icon(
            //   color: Colors.red,
            // ),
          ),
          Text('ไม่สามารถคำนวนได้')
        ],
      ),
      // title: ,
      content: const Text(
        'กรุณากรอกข้อมูลให้ครบถ้วน',
        style: TextStyle(fontSize: 18),
      ),

      actions: [
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.blue),
          ),
          // textColor: Color(0xFF6200EE),
          onPressed: () => Navigator.pop(context),
          child: const Text('กลับ'),
        ),
      ],
    );
  }

  
}
class Calculator {
  late double weight;
  late double height;
  double bmi = 0.0;

  Calculator(this.weight, this.height);

  String calculateBMI() {
    bmi = weight / pow((height / 100), 2);

    return bmi.toStringAsFixed(1);
  }

  String resultText() {
    if (bmi < 18.5) {
      return 'น้ำหนักน้อย / ผอม';
    } else if (bmi < 22.9) {
      return 'ปกติ (สุขภาพดี)';
    } else if (bmi < 24.9) {
      return 'โรคอ้วนระดับ 1';
    } else if (bmi < 29.9) {
      return 'โรคอ้วนระดับ 2';
    } else {
      return 'โรคอ้วนระดับ 3';
    }
  }
}
