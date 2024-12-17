import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      color: Colors.blue.shade100,
      child: ListView(
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              "Menu",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text("About"),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Services"),
          ),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text("Contact"),
          ),
        ],
      ),
    );
  }
}