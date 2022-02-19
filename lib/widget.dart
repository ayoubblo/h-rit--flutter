import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'homepgage.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<LoginScreen> {
  TextEditingController _somme = TextEditingController();
  Color firscolor = Color(0xffF5591F);
  Color secondcolor = Color(0xffEEEEEE);
  int female = 0;
  int male = 0;
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  initWidget() {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: firscolor,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
            image: DecorationImage(
                image: AssetImage("assets/images/20378.jpg"),
                fit: BoxFit.contain),
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 20, right: 20, top: 50),
          padding: EdgeInsets.only(left: 20, right: 20),
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.grey[200],
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 50,
                  color: Color(0xffEEEEEE)),
            ],
          ),
          child: TextField(
            cursorColor: Color(0xffF5591F),
            decoration: InputDecoration(
              icon: Icon(
                Icons.money,
                color: Color(0xffF5591F),
              ),
              hintText: "Entrer Somme de hérité ",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
        Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: EdgeInsets.only(left: 20, right: 20),
            height: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey[200],
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 10), blurRadius: 50, color: secondcolor),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Icon(
                    Icons.male,
                    color: firscolor,
                  ),
                ),
                Text('male'),
                Buildbottuns('male')
              ],
            )),
        Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: EdgeInsets.only(left: 20, right: 20),
            height: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: secondcolor,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 20), blurRadius: 100, color: secondcolor),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Icon(
                    Icons.female,
                    color: firscolor,
                  ),
                ),
                Text('female'),
                Buildbottuns('female')
              ],
            )),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Lastpage(male, female, 500)));
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20, right: 20, top: 30),
            padding: EdgeInsets.only(left: 20, right: 20),
            height: 54,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [(firscolor), new Color(0xffF2861E)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight),
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey[200],
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 10), blurRadius: 50, color: secondcolor),
              ],
            ),
            child: Text(
              "Calculer",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    )));
  }

  Widget Buildbottuns(String type) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {
              setState(() {
                type == "male"
                    ? male <= 0
                        ? male = 0
                        : male--
                    : female <= 0
                        ? female = 0
                        : female--;
              });
            },
            icon: Icon(Icons.remove),
          ),
        ),
        Text(
          type == "male" ? "$male" : '$female',
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {
              setState(() {
                type == "male" ? male++ : female++;
              });
            },
            icon: Icon(Icons.add),
          ),
        )
      ],
    );
  }
}
