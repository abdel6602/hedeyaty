import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.yellow[800],
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              // Handle Home tap
              Navigator.pop(context); // Close the drawer
              // Navigate to Home screen
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              // Handle Profile tap
              Navigator.pop(context); // Close the drawer
              // Navigate to Profile screen
            },
          ),
          ListTile(
            leading: Icon(Icons.card_giftcard),
            title: Text('My Pledged Gifts'),
            onTap: () {
              // Handle My Pledged Gifts tap
              Navigator.pop(context); // Close the drawer
              // Navigate to My Pledged Gifts screen
            },
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('My Events'),
            onTap: () {
              // Handle My Events tap
              Navigator.pop(context); // Close the drawer
              // Navigate to My Events screen
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Log Out'),
            onTap: () {
              // Handle Log Out tap
              Navigator.pop(context); // Close the drawer
              // Implement logout logic
            },
          ),
        ],
      ),
    );
  }
}