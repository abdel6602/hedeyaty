import 'package:flutter/material.dart';
import 'package:hedeyaty/app_colors.dart';
import 'package:hedeyaty/models/user.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({ Key? key }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final User profile = User(
    name: 'Alice',
    email: 'Alice@gmail.com',
    profilePicture: "images/alice.jpeg",
    id: "2",
    password: "123456",
  );

  bool isDarkMode = false;

  final TextEditingController _nameController = TextEditingController();
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  // final TextEditingController _phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: Column(
        children: [
          SizedBox(height: 80,),          // Profile Picture and dark mode selector
          _buildPreDivider(),
          _buildDivider(),
          const SizedBox(height: 20),
          // Profile Information
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Row(
              children: [
                const Text("Name: ", style: TextStyle(color: AppColors.textColor, fontSize: 20)),
                Spacer(),
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      fillColor: AppColors.textColor,
                      filled: true,
                      hintText: "Alice",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                )
              ],
            ),
          )
          
        ],
      )
    );
  }

  Center _buildDivider() {
    return const Center(
          child: Divider(
            color: AppColors.thirdDark,
            thickness: 2,
            indent: 40,
            endIndent: 40,
          ),
        );
  }

  Row _buildPreDivider() {
    return Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage(profile.profilePicture),
            ),
          ),
          const Spacer(),
          Text("Dark Mode", style: TextStyle(color: AppColors.textColor, fontSize: 20)),
          Switch(
            value: isDarkMode,
            onChanged: (value) {
              setState(() {
                isDarkMode = !isDarkMode;
              });
              // Change the theme
            },
            activeColor: AppColors.secondaryDark,
          ),
          const SizedBox(width: 20),
        ],
      );
  }



}