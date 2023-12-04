import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:wall_app/components/text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _showBox = false;
  //controllers
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  void initState() {
    super.initState();
    timeDilation = 1.5; // Adjust animation speed (1.0 is the default)
    // Delay showing the grey box for a more prominent splash effect
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _showBox = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: Column(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 600), // Grey box container
                  height: 200,
                  width: _showBox? screenWidth*0.9:0,

                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.01),
                        blurRadius: 5,
                        offset: Offset(0,3),
                      )
                    ]
                  ),
                  child: Text(
                    'Sign in to Yout \nAccount',
                    style: TextStyle(

                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Text('Welcome to the Wall App'),
                SizedBox(height: 20),
                MyTextField(controller: emailController, obscureText: false, hintText: "Email"),
                // Add other widgets here like password field, buttons, etc.
              ],
            ),
          ),
        ),
      ),
    );
  }
}
