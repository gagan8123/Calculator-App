

import 'cal_btn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => calculator_variable(), child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

ScrollController sc = ScrollController();

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          title: Text(
            "My Calculator",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 28, color: Colors.black),
          ),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Container(
          margin: EdgeInsetsDirectional.fromSTEB(10, 25, 10, 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              border: Border.all(color: Colors.yellow, width: 5)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                height: 210,
                width: 800,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      child: SingleChildScrollView(
                        controller: sc,
                        scrollDirection: Axis.horizontal, //.horizontal
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 10, 0),

                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                          child: Text(
                            "${Provider.of<calculator_variable>(context).output}",
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),


              Container(
                decoration: BoxDecoration(
                    //borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(color: Colors.black, width: 5),
                    color: Colors.black),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(5, 20, 0, 0),
                  child: Column(
                    children: [
                      c_btn
                          .defaultval(["AC", "<-", "%", "/"], Colors.lightBlue),
                      c_btn(
                        ["7", "8", "9", "x"],
                        Colors.greenAccent,
                        Colors.lightBlue,
                      ),
                      c_btn(["4", "5", "6", "-"], Colors.greenAccent,
                          Colors.lightBlue),
                      c_btn(["1", "2", "3", "+"], Colors.greenAccent,
                          Colors.lightBlue),
                      c_btn(["00", "0", ".", "="], Colors.greenAccent,
                          Colors.lightBlue),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class calculator_variable extends ChangeNotifier {
  var output = "";
  var a = "";
  var b = "";
  var operator = "";
  int pos = 0;

  void claculate(var input1) {
    switch (input1) {
      case "+":
      case "-":
      case "x":
      case "/":
      case "%":
        if(a!="" && operator == ""){
          if (pos == 0) {
            operator = input1;
            if (operator == "%") {
              calc();
            } else {

              output += operator;
            }
          } else {
            operator = input1 ;
            calc();
            if (operator != "%") {
              output += operator;
            }
          }
          pos++;
        }
        break;

      case "1":
      case "2":
      case "3":
      case "4":
      case "5":
      case "6":
      case "7":
      case "8":
      case "9":
      case "0":
      case "00":
      case ".":
        if (pos == 0) {
          a += input1.toString();
        } else {
          b += input1.toString();
        }
        output += input1.toString();
        break;

      case "AC":
        output = "";
        a = "";
        b = "";
        operator = "";
        pos = 0;
        break;

      case "<-":
        if (output.length - 1 > 0) {
          remove(output[output.length - 1]);
          output = output.substring(0, output.length - 1);
        } else {
          a = "";
          output = "";
          b = "";
        }
        break;

      case "=":
        calc();
        break;
    }

    sc.jumpTo(sc.position.maxScrollExtent + 3);
    notifyListeners();
  }

  void remove(var rm) {
    switch (rm) {
      case "+":
      case "-":
      case "x":
      case "/":
      case "%":
        operator = "";
        pos--;
        break;
      default:
        if (pos == 0) {
          a = a.substring(0, a.length - 1 >= 0 ? a.length - 1 : 0);
        } else {
          b = b.substring(0, b.length - 1 >= 0 ? b.length - 1 : 0);
        }
    }
  }

  void calc() {
    if (a != "") {
      double val1 = double.parse(a);
      double ans = 0.0;
      if (b != "") {
        double val2 = double.parse(b);
        switch (operator) {
          case "+":
            ans = val1 + val2;
          case "-":
            ans = val1 - val2;
          case "x":
            ans = val1 * val2;
          case "/":
            ans = val1 / val2;
          // case"%":
          //     ans = val1%val2;
        }
        if (ans % 1 == 0) {
          a = ans.toInt().toString();
          pos--;
          b = "";
          output = a;
        } else {
          a = ans.toString();
          pos--;
          b = "";
          output = a;
        }
        operator = "";
      }
      if (operator == "%") {
        ans = val1 / 100;
        if (ans % 1 == 0) {
          a = ans.toInt().toString();
          pos--;
          b = "";
          output = a;
        } else {
          a = ans.toString();
          pos--;
          b = "";
          output = a;
        }
        operator = "";
      }

    }
  }
}
