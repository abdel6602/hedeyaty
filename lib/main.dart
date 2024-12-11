import 'package:flutter/material.dart';
import 'package:hedeyaty/app_colors.dart';
import './pages/login_page.dart';

//main
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.primaryDark,
      body: LoginPage(),
    );
  }
}


