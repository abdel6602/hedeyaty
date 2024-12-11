import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showProfilePicture;
  final String title;

  const CustomAppBar({super.key, required this.showProfilePicture, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
        if (showProfilePicture)
          CircleAvatar(
            backgroundImage: NetworkImage('https://animation.fandom.com/wiki/SpongeBob_SquarePants_%28character%29'), // Replace with your actual image URL
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}