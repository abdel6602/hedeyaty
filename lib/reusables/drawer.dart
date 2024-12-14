import 'package:flutter/material.dart';
import 'package:hedeyaty/app_colors.dart';
import 'package:hedeyaty/pages/home_page.dart';
import 'package:hedeyaty/pages/my_pledged_gifts_page.dart';
import 'package:hedeyaty/pages/profile_page.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.thirdDark,
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));// Close the drawer
              // Navigate to Home screen
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              // Handle Profile tap
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage())); // Close the drawer
              // Navigate to Profile screen
            },
          ),
          ListTile(
            leading: Icon(Icons.card_giftcard),
            title: Text('My Pledged Gifts'),
            onTap: () {
              // Handle My Pledged Gifts tap
              Navigator.push(context, MaterialPageRoute(builder: (context) => PledgesPage())); // Close the drawer
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