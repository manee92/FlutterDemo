import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: RaisedButton(
            child: Text('Click Here'),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondRoute()),
              );
            }),
      ),
      drawer: Drawer(
        child: ListView(

          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue,

                ),
            ),
            ListTile(
              title: Text('First Page') ,
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Second Page'),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondRoute()),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title:Text('Second Page'),
      ),
      body: Column(
        children: <Widget>[
          Image.asset(
            'images/image.jpg',
              width: 600.0,
              height: 350.0,
              fit: BoxFit.cover,
              ),
          RaisedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text('Back'),
          ),
        ],
      )
    );
  }
}
