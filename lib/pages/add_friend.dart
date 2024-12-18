import 'package:flutter/material.dart';
import 'package:hedeyety2/models/user.dart';
import 'package:hedeyety2/reusables/app_bar.dart';
import 'package:hedeyety2/reusables/drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_colors.dart';

class ContactSearchScreen extends StatefulWidget {
  const ContactSearchScreen({super.key});

  @override
  State<ContactSearchScreen> createState() => _ContactSearchScreenState();
}

class _ContactSearchScreenState extends State<ContactSearchScreen> {
  List<User> _searchResults = [];
  TextEditingController _searchController = TextEditingController();

  bool isDarkMode = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isDarkModeEnabled().then((value) {
      setState(() {
        isDarkMode = value;
      }
);
    }
);
  }

  Future<bool> isDarkModeEnabled() async {
    final _instance = await SharedPreferences.getInstance();
    final enabled = _instance.getBool("Theme");
    print('Dark Mode on: ${enabled}');
    if(enabled == null){
      isDarkMode = true;
      return true;
    }
    else{
      isDarkMode = enabled;
      return enabled;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? AppColors.primaryDark  : AppColors.primaryLight,
      appBar: CustomAppBar(showProfilePicture: true, title: "Add Friend", isDarkMode: isDarkMode),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              style: TextStyle(color: isDarkMode ? AppColors.primaryDark : AppColors.textColor),
              decoration: InputDecoration(

                hintText: 'username or phone number',
                hintStyle: TextStyle(color: isDarkMode ? AppColors.primaryDark : AppColors.textColor),
                filled: true,
                fillColor: isDarkMode ? AppColors.textColor : AppColors.primaryDark,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(Icons.search, color: isDarkMode ? AppColors.primaryDark : AppColors.textColor,),
              ),
              onSubmitted: (value) {
                setState(() {
                  _searchResults.add(
                      User(id: "1", name: _searchController.text, profilePicture: "images/alice.jpeg", email: "ksdjakd", password: "ksdjakd", phoneNumber: "0101239012931"));
                }
);

                // Implement search functionality here
                // You can filter the 'contacts' list based on the 'value'
                // and then call setState to rebuild the UI with the filtered list.
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount:_searchResults.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17),
                        ),
                        tileColor: isDarkMode ? AppColors.thirdDark : AppColors.secondaryDark,
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(_searchResults[index].profilePicture),
                        ),
                        title: Text(
                          _searchResults[index].name,
                          style: TextStyle(color: isDarkMode ? AppColors.primaryDark : AppColors.textColor),),
                        subtitle: Text(
                            _searchResults[index].phoneNumber,
                            style: TextStyle(color: isDarkMode ? AppColors.primaryDark : AppColors.textColor),
                        ),
                        trailing: ElevatedButton(
                          onPressed: () {
                            print("Added User with information: ${_searchResults[index].toJson()}");
                            // TODO: Handle add contact
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: const CircleBorder(),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
