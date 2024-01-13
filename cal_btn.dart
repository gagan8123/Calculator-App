import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class c_btn extends StatefulWidget {
  static var pos = 0;
  final List<String> txt ;
   Color? number_color;
  final MaterialColor symbol_color;


   c_btn(
     this.txt,
     this.number_color,
     this.symbol_color,

  );

   c_btn.defaultval(
       this.txt,
       this.symbol_color,

       ):this.number_color = null;




  @override
  State<c_btn> createState() => _c_btnState();
}

class _c_btnState extends State<c_btn> {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                child: SizedBox(
                  height: 70,
                  width: 70,
                  child: TextButton(
                    onPressed: () {


                        calculate(widget.txt[0].toString());}
                    ,
                    child: Text(
                      "${widget.txt[0]}",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStatePropertyAll(widget.txt[0] == "AC"? Colors.red:(widget.number_color != null)?widget.number_color:widget.symbol_color),
                        shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                                side: BorderSide(color: Colors.grey,width: 5),
                                borderRadius: BorderRadius.all(Radius.circular(20))

                            ))),
                  ),
                )),
            Container(
                child: SizedBox(
                  height: 70,
                  width: 70,
                  child: TextButton(
                    onPressed: () {
                      calculate(widget.txt[1].toString());
                    },
                    child: Text(
                      "${widget.txt[1]}",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: widget.txt[1]=="<-"?Colors.black:Colors.white),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStatePropertyAll(widget.txt[1]=="<-"?Colors.limeAccent:(widget.number_color != null)?widget.number_color:widget.symbol_color),
                        shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                                side: BorderSide(color: Colors.grey,width: 5),
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            ))),
                  ),
                )),
            Container(
                child: SizedBox(
                  height: 70,
                  width: 70,
                  child: TextButton(
                    onPressed: () {calculate(widget.txt[2].toString());},
                    child: Text(
                      "${widget.txt[2]}",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStatePropertyAll((widget.number_color != null)?widget.number_color:widget.symbol_color),
                        shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                                side: BorderSide(color: Colors.grey,width: 5),
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            ))),
                  ),
                )),
            Container(
                child: SizedBox(
                  height: 70,
                  width: 70,
                  child: TextButton(
                    onPressed: () {calculate(widget.txt[3].toString());},
                    child: Text(
                      "${widget.txt[3]}",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStatePropertyAll(widget.txt[3]=="="? Colors.deepPurple:widget.symbol_color),
                        shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                                side: BorderSide(color: Colors.grey,width: 5),
                                borderRadius: BorderRadius.all(Radius.circular(20))

                            ))),
                  ),
                )),
          ],
        ),
      ),
    );
  }
  calculate(String input1) {
   Provider.of<calculator_variable>(context,listen: false).claculate(input1);
  }



}

