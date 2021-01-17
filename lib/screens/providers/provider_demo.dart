import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  runApp(
    MultiProvider(
      providers: providers,
      child: MyApp(),
    ),
  );
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<ItemProvider>(create: (_) => ItemProvider()),
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProviderDemo(),
    );
  }
}

class ProviderDemo extends StatefulWidget {
  @override
  _ProviderDemoState createState() => _ProviderDemoState();
}

class _ProviderDemoState extends State<ProviderDemo> {
  List items = ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight"];
  @override
  Widget build(BuildContext context) {
    final itemMdl = Provider.of<ItemProvider>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Demo"),
      ),
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: height / 3,
              ),
              child: Container(
                width: width,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                color: Colors.purpleAccent,
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: items.map((e) {
                    return InkWell(
                      onTap: () {
                        itemMdl.addItems(e);
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.only(right: 10, bottom: 10),
                        color: Colors.yellow,
                        child: Text(e),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: height / 3,
                ),
                child: Container(
                  width: width,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  color: Colors.greenAccent,
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: itemMdl.addedItems.map((e) {
                      return InkWell(
                        onTap: () {
                          itemMdl.removeItems(e);
                        },
                        child: Container(
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.only(right: 10, bottom: 10),
                          color: Colors.blue,
                          child: Text(e),
                        ),
                      );
                    }).toList(),
                  ),
                ))
          ],
        ),
      )),
    );
  }
}

class ItemProvider with ChangeNotifier {
  List addedItems = [];

  addItems(item) {
    addedItems.add(item);
    notifyListeners();
  }

  removeItems(item) {
    addedItems.remove(item);
    notifyListeners();
  }
}
