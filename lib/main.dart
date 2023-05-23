import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var userQuestion = '';
  var userAnswer = '';

  final List<String> buttons =
  [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '='
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
        title: const Center(child: Text('JRAsprawn Calculator')),
    ),
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: <Widget> [
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget> [
                  const SizedBox(height: 50,),
                  Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                      child: Text(userQuestion, style: const TextStyle(fontSize: 20),),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                      child: Text(userAnswer, style: TextStyle(fontSize: 20),),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GridView.builder(
              itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index ){

                //clear button
                if(index == 0){
                    return MyButton(
                      buttonTapped: (){
                        setState(() {
                          userQuestion = '';
                        });
                      },
                      buttonText: buttons[index],
                      color: Colors.green,
                      textColor: Colors.white,
                    );
                  }

                //Delete button
                else if(index == 1){
                    return MyButton(
                      buttonTapped: (){
                        setState(() {
                          userQuestion = userQuestion.substring(0,userQuestion.length-1);
                        });
                      },
                      buttonText: buttons[index],
                      color: Colors.red,
                      textColor: Colors.white,
                    );
                  }

                //Rest of the buttons
                else{
                    return MyButton(
                      buttonTapped: (){
                        setState(() {
                          userQuestion += buttons[index];
                        });
                      },
                      buttonText: buttons[index],
                      color: isOperator(buttons[index]) ? Colors.deepPurple : Colors.deepPurple[50],
                      textColor: isOperator(buttons[index]) ? Colors.white : Colors.deepPurple,
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x){
    if(x == '%' || x == '/' || x == '*' || x == '-' || x == '+' || x == '='){
      return true;
    }
    return false;
  }

}

