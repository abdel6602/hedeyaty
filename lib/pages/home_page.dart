import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hedeyaty/app_colors.dart';
import 'package:hedeyaty/models/user.dart';
import 'package:hedeyaty/reusables/app_bar.dart';
import 'package:hedeyaty/reusables/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<User> friends = [
    User(name: 'Alice', id: '1', email: 'Alice@gmail.com', password: '123456', profilePicture: 'images/alice.jpeg'),
    User(name: 'Bob', id: '2', email: 'Bob@gmail.com', password: '123456', profilePicture: 'images/Bob.jpeg'),
    // ... your friend data here
  ];

  String searchValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      appBar: const CustomAppBar(showProfilePicture: true, title: 'Home'),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(29.0),
        child: Column(
          children: [
            _buildElevatedButton('Create a new events', () {
              // Navigate to the send gift page
            }, false, null),
            const SizedBox(height: 17,),
            _buildElevatedButton("Add Friend", () {

            }, true, const Icon(Icons.person_add, color: AppColors.secondaryDark,)),
            const SizedBox(height: 17,),


            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Friends", style: TextStyle(
              fontSize: 20,
              color: AppColors.textColor,
            ),),
            ),
            const SizedBox(height: 17,),
            _buildTextField(TextEditingController(), "Friend's Name", true, Icon(Icons.search), searchValue, () {
              //process search within friends
            }),
            const SizedBox(height: 17,),
            // const Spacer(),
            _buildFriendsList(),
            
          ],
        ),
      ),
    );
  }

  Widget _buildElevatedButton(String text, Function() onPressed, bool hasIcon, Icon? icon) {
    return SizedBox(
      width: 227,
      child: ElevatedButton(
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AppColors.thirdDark),
          foregroundColor: WidgetStatePropertyAll(Colors.black)
        ),
        onPressed: onPressed,
        child: hasIcon? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon!,
            const SizedBox(width: 10,),
            Text(text),
          ],
        ) : Text(text),
      ),
    );
  }

  Expanded _buildFriendsList() {
    return Expanded(child: ListView.builder(
            itemCount: friends.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Card(
                    color: AppColors.primaryDark,
                  child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 29),
                      tileColor: AppColors.thirdDark,
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(friends[index].profilePicture),
                        radius: 30,
                        // Add profile picture if available
                      ),
                      title: Text(friends[index].name),
                      // subtitle: const Text(""),
                      trailing: SizedBox(
                        width: 40,
                        child: Row(
                          children: [
                            Text(_getPendingsCount(friends[index]), style: TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                            ),), SizedBox(width: 5,),
                            const Icon(Icons.card_giftcard),
                          ],
                        ),
                      ),
                    ),
              )],
                );
              
            },
          ),);
  }

  Widget _buildTextField(TextEditingController controllerObj, String hint, bool hasIcon, Icon icon, String toInput, Function()? onIconPressed){ 
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[200],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(

              controller: controllerObj,
              decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none,
              ),
            ),
          ),
          if(hasIcon) IconButton(
            onPressed: onIconPressed,
            icon: icon,
          ),
        ],
      ),
    );
  }

  

  String _getPendingsCount(User user) {
    // Get the number of pending gifts for the user
    return (Random().nextInt(10)).toString();
  }
}

