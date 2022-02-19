import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Lastpage extends StatefulWidget {
  int males;
  int females;
  int somme;
  Lastpage(this.males, this.females, this.somme);

  @override
  _LastpageState createState() => _LastpageState();
}

class _LastpageState extends State<Lastpage> {
  double heritM, m = 0;
  double heritF, f = 0;
  String PM = '0';
  String PF = '0';

  Timer timerM;
  Timer timerF;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    count();
  }

  void count() {
    if (widget.females == 1 && widget.males == 0) {
      PF = "1/2";
      heritF = 1 / 2;
    } else if (widget.females >= 2 && widget.males == 0) {
      PF = '2/3';
      heritF = 2 / 3;
    } else if (widget.females >= 0 && widget.males > 0) {
      PF = '1/4';
      PM = "1/2";
      heritF = 1 / 4;
      heritM = 1 / 2;
      ;
    } else {
      PF = '00';
      PM = "00";
    }

    m = widget.somme * heritM;
    f = widget.somme * heritF;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/2.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(child: herit('females')),
                Expanded(child: herit('males')),
              ],
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

////////////////////////////////////////////////////////////////
  herit(String type) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 15),
        buildherite(type),
        SizedBox(height: 2),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child:
              Text(type, style: TextStyle(fontSize: 20, color: Colors.black)),
        ),
        SizedBox(height: 2),
        detail(type),
      ],
    );
  }

  Widget buildherite(type) => SizedBox(
        child: CircularPercentIndicator(
          animation: true,
          animationDuration: 2000,
          radius: 150.0,
          lineWidth: 10.0,
          percent: type == "males" ? heritM : heritF,
          //header: new Text("Icon header"),
          center: new Icon(
            type == "males" ? Icons.male : Icons.female,
            size: 50.0,
            color: Colors.blue,
          ),
          backgroundColor: Colors.grey,
          progressColor: Colors.blue,
        ),
      );

  Widget detail(type) => SizedBox(
        child: Column(
          children: [
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('hériter : '),
                Text(
                  type == "males" ? PM : PF,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
              ],
            )),
            Center(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Text('somme : '),
                  Text(
                    type == "males" ? "$m" : "$f",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
              ],
            ),
                ))
          ],
        ),
      );
}
