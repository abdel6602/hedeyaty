import 'package:flutter/material.dart';
import 'package:hedeyaty/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showProfilePicture;
  final String title;

  const CustomAppBar({super.key, required this.showProfilePicture, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.thirdDark,
      title: Text(title),
      leading: Builder(builder: 
      (BuildContext context){
        return IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        );
      }),
      actions: [
        Padding(padding: const EdgeInsets.all(5.0),
        child: showProfilePicture ? 
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('images/alice.jpeg'), // Replace with your actual image URL
          ) : Container(),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);
}