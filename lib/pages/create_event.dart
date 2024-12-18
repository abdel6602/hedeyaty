import 'package:flutter/material.dart';
import 'package:hedeyety2/models/gift.dart';
import 'package:hedeyety2/pages/gift_details.dart';
import 'package:hedeyety2/reusables/app_bar.dart';
import 'package:hedeyety2/reusables/drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_colors.dart';
import '../models/user.dart';

class CreateEvent extends StatefulWidget {
  final bool isCreating;
  final bool isDarkMode;
  const CreateEvent({super.key, required this.isCreating, required this.isDarkMode});

  @override
  State<CreateEvent> createState() => _CreateEventState(isCreating:isCreating, isDarkMode: isDarkMode);
}

class _CreateEventState extends State<CreateEvent> {
  final bool isCreating;
  final bool isDarkMode;
  _CreateEventState({required this.isCreating, required this.isDarkMode});
  List<User> invitees = [ // Sample invitee data
    User(id: "1", name: "Abdelrahman Gamal", email: "skjdsakd", password: "aksdjaskdj", profilePicture: "images/Bob.jpeg", phoneNumber: "kdjss"),
    User(id: "1", name: "Sohaila Mohammed", email: "skjdsakd", password: "aksdjaskdj", profilePicture: "images/alice.jpeg", phoneNumber: "kdjss"),
    User(id: "1", name: "Janna Hani", email: "skjdsakd", password: "aksdjaskdj", profilePicture: "images/Janna.jpeg", phoneNumber: "kdjss"),
  ];
  List<Gift> gifts = [];
  DateTime? selectedDate;
  TextEditingController _eventNameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  Future<void> show_gift_details() async {
    // Navigate to the gift details page
    final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => GiftDetails(isDarkMode: isDarkMode,)));

    if(result != null && result is Gift){
      setState(() {
        gifts.add(result);
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? AppColors.primaryDark : AppColors.primaryLight,
      appBar: CustomAppBar(showProfilePicture: true, title: "Event", isDarkMode: isDarkMode,),
      drawer: MyDrawer(theme: isDarkMode,),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: SingleChildScrollView( // Added for scrolling
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
               Center(
                child: Icon(
                  Icons.card_giftcard,
                  size: 50,
                  color: isDarkMode ? AppColors.textColor : AppColors.primaryDark,),
              ),
              const SizedBox(height: 20),
              _buildTextField('Event Name', Icons.edit, _eventNameController),
              const SizedBox(height: 10),
              _buildTextField('Address (optional)', Icons.edit, _addressController),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text("Date", style: TextStyle(color: isDarkMode ? AppColors.textColor : AppColors.primaryDark, fontSize: 18),),
                  const Spacer(),
                  IconButton(
                      onPressed: (){
                        // Show date picker
                        _selectDate(context);
                      },
                      icon: Icon(Icons.calendar_today, color: isDarkMode ? AppColors.textColor : AppColors.primaryDark,))
                  ,
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text("Gifts", style: TextStyle(color: isDarkMode ? AppColors.textColor : AppColors.primaryDark, fontSize: 18),),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        // Navigate to the add gift page
                        show_gift_details();
                      },
                      icon: Icon(Icons.add, color: isDarkMode ? AppColors.textColor : AppColors.primaryDark,),),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text("Invitees", style: TextStyle(color: isDarkMode ? AppColors.textColor : AppColors.primaryDark, fontSize: 18),),
                  const Spacer(),
                  Icon(Icons.add, color: isDarkMode ? AppColors.textColor : AppColors.primaryDark,),
                ],
              ),
              const SizedBox(height: 20),

              ListView.builder(
                shrinkWrap: true, // Important for ListView inside Column
                physics: const NeverScrollableScrollPhysics(), // Disable ListView scrolling
                itemCount: invitees.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17),
                        ),
                        tileColor: isDarkMode ? AppColors.thirdDark : AppColors.secondaryDark,
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(invitees[index].profilePicture),
                        ),
                        title: Text(invitees[index].name),
                        trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              invitees.removeAt(index);
                            });
                          },
                          icon: const Icon(Icons.delete, color: Colors.red,),
                        ),
                      ),
                      SizedBox(height: 15,)
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, IconData icon, TextEditingController controller) {
    return TextField(
      controller: controller,
      style: TextStyle(color: isDarkMode ? AppColors.primaryDark : AppColors.textColor),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: isDarkMode ? AppColors.primaryDark : AppColors.textColor),
        filled: true,
        fillColor: isDarkMode ? AppColors.textColor : AppColors.primaryDark,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        suffixIcon: Icon(icon, color: isDarkMode ? AppColors.primaryDark : AppColors.textColor,),
      ),
    );
  }

  // Widget _buildRowWithIcon(String label, IconData icon) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 30),
  //     child:
  //   );
  // }
}

