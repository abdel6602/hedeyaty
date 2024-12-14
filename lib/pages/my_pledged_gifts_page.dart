import 'package:flutter/material.dart';
import 'package:hedeyaty/app_colors.dart';
import 'package:hedeyaty/models/gift.dart';
import 'package:hedeyaty/reusables/app_bar.dart';
import 'package:hedeyaty/reusables/drawer.dart';

class PledgesPage extends StatelessWidget {

  final List<Gift> pledgedGifts = [
    Gift(name: "Playstation 5", description: "amazing console", imageUrl: "images/Playstation 5.jpeg", price: "419.99", id: "1", requestingUserId: "1", pledgedUserId: "2", isPledged: true, categoryId: "1"),
    Gift(name: "Fidget Spinner", description: "sjdha", imageUrl: "images/spinner.jpeg", price: "1.99", id: "1", requestingUserId: "1", pledgedUserId: "1", isPledged: true, categoryId: "2")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      appBar: const CustomAppBar(showProfilePicture: true, title: "My Pledges Gifts"),
      drawer: MyDrawer(),
      body: Center(
        child: 
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Container(
              color: AppColors.primaryDark,
              child: ListView.builder(
                itemCount: pledgedGifts.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.thirdDark,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(backgroundImage: AssetImage(pledgedGifts[index].imageUrl), radius: 30,),
                        title: Text(pledgedGifts[index].name),
                        subtitle: Text('\$' + pledgedGifts[index].price),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  // Navigate to edit gift page
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  // Delete the gift
                                },
                              ),
                            ],
                          ),
                        ),
                        // ... rest of the ListTile content
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
      ),
    );
  }
}