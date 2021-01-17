import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContainerDemo(),
    );
  }
}

class ContainerDemo extends StatefulWidget {
  @override
  _ContainerDemoState createState() => _ContainerDemoState();
}

class _ContainerDemoState extends State<ContainerDemo> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Wrap(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: squareContainer(),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: rectContainer(),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: roundedContainer(),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: fullyRoundedContainer(),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: circleContainer(),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: containerButton(),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: containerWithBorders(),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: containerWithShadow(),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: containerImgDecoration(),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: containerImg(),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: containerHeaderOne(width: w),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: containerHeaderTwo(width: w),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: containerHeaderThree(width: w),
                ),
              ],
            ),
          ),
        ));
  }
}

Widget squareContainer() {
  return Container(
    color: Colors.purpleAccent,
    width: 100,
    height: 100,
  );
}

Widget rectContainer() {
  return Container(
    color: Colors.greenAccent,
    width: 200,
    height: 100,
  );
}

Widget roundedContainer() {
  return Container(
    width: 100,
    height: 50,
    decoration: BoxDecoration(
        color: Colors.tealAccent,
        borderRadius: BorderRadius.all(Radius.circular(10))),
  );
}

Widget fullyRoundedContainer() {
  return Container(
    width: 100,
    height: 50,
    decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.all(Radius.circular(50))),
  );
}

Widget circleContainer() {
  return Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(color: Colors.redAccent, shape: BoxShape.circle),
  );
}

Widget containerButton() {
  return InkWell(
    onTap: () {},
    child: Container(
        decoration: BoxDecoration(
            color: Colors.deepOrange,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
        child: Text(
          "Button",
          style: TextStyle(color: Colors.white),
        )),
  );
}

Widget containerWithBorders() {
  return Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
        color: Colors.yellow,
        border: Border.all(),
        borderRadius: BorderRadius.all(Radius.circular(15))),
  );
}

Widget containerWithShadow() {
  return Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(15)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.4),
          spreadRadius: 5,
          blurRadius: 9,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
  );
}

Widget containerImgDecoration() {
  return Container(
    width: 150,
    height: 150,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        image: DecorationImage(
            image: AssetImage("assets/images/img.jpg"), fit: BoxFit.cover)),
  );
}

Widget containerImg() {
  return Container(
    width: 150,
    height: 150,
    decoration:
        BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
    child: Image(image: AssetImage("assets/images/img.jpg"), fit: BoxFit.cover),
  );
}

Widget containerHeaderOne({width}) {
  return Container(
    width: width,
    height: 200,
    decoration: BoxDecoration(
      color: Colors.deepPurpleAccent,
      borderRadius:  BorderRadius.vertical(
          bottom:  Radius.elliptical(width, 200.0)),
    ),
  );
}

Widget containerHeaderTwo({width}) {
  return Container(
    width: width,
    height: 200,
    decoration: BoxDecoration(
      color: Colors.redAccent,
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(200)),
    ),
  );
}

Widget containerHeaderThree({width}) {
  return Container(
    width: width,
    height: 200,
    decoration: BoxDecoration(
      color: Colors.green,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(200),
          bottomRight: Radius.circular(200)),
    ),
  );
}
