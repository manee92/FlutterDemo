import 'dart:math';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(PhoneDemo());

class PhoneDemo extends StatefulWidget {
  @override
  _PhoneDemoState createState() => _PhoneDemoState();
}

class _PhoneDemoState extends State<PhoneDemo> {
  Permission _permission;
  PermissionStatus permissionStatus = PermissionStatus.undetermined;
  List<Contact> contactsList = [];

  getPermission() async {
    if (permissionStatus == PermissionStatus.granted) {
      getContacts();
    } else {
      requestPermission(_permission);
    }
  }

  Future<void> getContacts() async {
    final Iterable<Contact> contacts = await ContactsService.getContacts();
    setState(() {
      contactsList = contacts.toList();
    });
  }

  Future<void> requestPermission(Permission permission) async {
    var status = await Permission.contacts.request();
    setState(() {
      permissionStatus = status;
    });
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.redAccent),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Phone Demo"),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.red,
            child: Icon(Icons.contact_phone),
            onPressed: () {
              getPermission();
            },
          ),
          body: Container(
              child: ListView.builder(
                  itemCount: contactsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    Contact contact = contactsList.elementAt(index);

                    return ListTile(
                      contentPadding: EdgeInsets.all(10),
                      tileColor:
                          Color((Random().nextDouble() * 0xFFFFFF).toInt())
                              .withOpacity(.4),
                      leading: (contact.avatar != null &&
                              contact.avatar.isNotEmpty)
                          ? CircleAvatar(
                              backgroundImage: MemoryImage(contact.avatar),
                            )
                          : CircleAvatar(
                              child: Text(contact.initials()),
                              backgroundColor: Theme.of(context).accentColor,
                            ),
                      trailing: IconButton(
                        icon: Icon(Icons.phone),
                        onPressed: () {
                          _makePhoneCall('tel:' + contact.phones.first.value);
                        },
                      ),
                      title: Text(
                        contact.displayName,
                        style: TextStyle(fontSize: 20),
                      ),
                    );
                  })),
        ));
  }
}
