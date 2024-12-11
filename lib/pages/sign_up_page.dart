import 'package:flutter/material.dart';
import 'package:hedeyaty/app_colors.dart';
import '../reusables/app_bar.dart';
import '../reusables/drawer.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({ Key? key }) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailControlller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(showProfilePicture: true, title: 'Sign Up'),
      drawer: MyDrawer(),
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.primaryDark,
      body: _buildBody(),
    );
    
  }

  Widget _buildBody(){
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            _buildProfileAvatar(),
            const SizedBox(height: 30,),
            _buildTextField(_emailControlller, 'Email', false),
            const SizedBox(height: 15,),
            _buildTextField(_passwordController, 'Password', true),
            const SizedBox(height: 15,),
            _buildTextField(_repeatPasswordController, 'Repeat Password', true),
            const SizedBox(height: 30,),
            _buildTextButton('Sign Up', () {
              print('Sign Up');
            }),
            const SizedBox(height: 30,),
            _buildLoginWithFacebookButton(),
            // const SizedBox(height: 160,),
            const Spacer(),

            
          ],
        ),
      ),

    );
  }

  Widget _buildLoginWithFacebookButton() {
    return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Sign Up with", style: TextStyle(color: Colors.black),),
                        IconButton(
                          onPressed: () {},
                          icon:  Icon(Icons.facebook_rounded,
                              color: Colors.blue[900], size: 40),
                        
                        ),
                      ],
                    ),
                  ),
                );
  }

  Widget _buildProfileAvatar(){
    return CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey[800],
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.grey[400],
                ),
              );
  }

  Widget _buildTextField(controllerObj, hint, isPassword){ 
    return Stack(
                children: [
                  TextField(
                obscureText: isPassword,
                controller: controllerObj,
                onChanged: (value) {
                  setState(() {
                    controllerObj = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: hint,
                  filled: true,
                  fillColor: AppColors.textColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              if(isPassword) _renderShowPassword(),
              
              ],
              );
    
  }

  Widget _buildTextButton(String text, onPress) {
    return ElevatedButton(
                onPressed: onPress  ?? () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[700],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text(
                  text,
                  style: const TextStyle(color: Colors.black),
                ),
              );
  }

  Widget _renderShowPassword(){
    return Positioned(
                right: 0,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                  icon: Icon(
                    _isObscure ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey[800],
                  ),
                ),
              );
  }

}