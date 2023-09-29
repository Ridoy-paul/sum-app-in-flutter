import 'package:flutter/material.dart';

void main() {
  runApp(SumApp());
}

class SumApp extends StatelessWidget {
  SumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  final _firstForm = GlobalKey<FormState>();
  TextEditingController _firstNumber = TextEditingController();
  TextEditingController _secondNumber = TextEditingController();
  int sum = 0;

  _firstFormSubmit() {
    if(_firstForm.currentState!.validate()) {
      int number1 = int.parse(_firstNumber.text);
      int number2 = int.parse(_secondNumber.text);
      setState(() {
        sum = number1 + number2;
      });
      print(sum);
    }
  }

  bool isNumeric(String value) {
    if (value == null) {
      return false;
    }
    return double.tryParse(value) != null;
  }



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sum App'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _firstForm,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _firstNumber,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This field is required';
                      }
                      if(!isNumeric(value)) {
                        return 'Please Enter Numbers only';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "Enter First Number",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _secondNumber,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This field is required';
                      }
                      if(!isNumeric(value)) {
                        return 'Please Enter Numbers only';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "Enter Last Number",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                          onPressed: (){

                          },
                          child: Text("clear")
                      ),
                      SizedBox(width: 10,),
                      ElevatedButton(
                          onPressed: () {
                            _firstFormSubmit();
                          },
                          child: Text("Submit")
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text("Sum is ${sum}", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}



