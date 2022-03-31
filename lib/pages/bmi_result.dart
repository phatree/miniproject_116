import 'package:bmi_app/pages/bmi_main.dart';
import 'package:bmi_app/pages/choose.dart';
import 'package:flutter/material.dart';


class Result extends StatefulWidget {
  const Result({Key? key, required this.result, required this.bmi}) : super(key: key);

  final String result;
  final String bmi;

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {

  @override
  Widget build(BuildContext context) {
    var card = Card;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/you.jpg'),
              fit: BoxFit.cover,
            ),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 24.0),
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    elevation: 8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Text(
                            'BMI',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Text(
                          widget.result,
                          style: const TextStyle(
                              fontSize: 66, fontWeight: FontWeight.w300),
                        ),
                        Text(
                          widget.bmi,
                          style: const TextStyle(fontSize: 40),
                        ),

                      ],
                    ),
                  ),
                ),
                  bottom(),
            ],
          ),
        ),
      ),
    );
  }


SizedBox bottom() {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
             onPressed: () {
            var route = MaterialPageRoute(
              builder: (context) => HomeScreen(),
              );
              Navigator.push(context, route);
          },
          child: const Text(
            'ถัดไป',
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
      ),
    );
  }
  
}

class HomeScreenState {
}


