// ignore_for_file: prefer_const_constructors
import 'dart:math';
import 'package:build_fourr/data/styles/app_style.dart';
import 'package:build_fourr/widgets/register_user/components/register_button.dart';
import 'package:build_fourr/widgets/register_user/components/register_heading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class RegisterPageBody extends StatefulWidget {
  const RegisterPageBody({super.key});

  @override
  State<RegisterPageBody> createState() => _RegisterPageBodyState();
}

class _RegisterPageBodyState extends State<RegisterPageBody> {
  // final List<String> errors = [];
  final _formKey = GlobalKey<FormState>();
  var obscureText = true;
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // late bool _success;
  int _success = 1;
  late String? _userEmail;

  void _register() async {
    if (_formKey.currentState!.validate()) {
      final User? user = (await _auth.createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text))
          .user;

      if (user != null) {
        setState(() {
          _success = 2;
          _userEmail = user.email;
        });
      } else {
        setState(() {
          _success = 3;
        });
      }
    }
    // final User? user = (await _auth.createUserWithEmailAndPassword(
    //         email: _emailController.text, password: _passwordController.text))
    //     .user;

    // if (user != null) {
    //   setState(() {
    //     _success = 2;
    //     _userEmail = user.email;
    //   });
    // } else {
    //   setState(() {
    //     _success = 3;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const RegisterHeadingDesign(), //components
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Please enter your Email Address';
                    } else if (value!.isEmpty ||
                        !RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]')
                            .hasMatch(value)) {
                      return 'Please enter a Valid Email';
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: "Email",
                    hintText: "Email Address",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
              ), //components
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: obscureText,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Please enter your Password';
                    } else if (value!.isEmpty ||
                        !RegExp(r'.{6,}$').hasMatch(value)) {
                      return 'Password must be at least 6 digit long.';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        child: obscureText
                            ? Icon(
                                Icons.visibility_off,
                                color: Colors.grey,
                              )
                            : Icon(
                                Icons.visibility,
                                color: Colors.purple,
                              )),
                    labelText: "Password",
                    hintText: "Password",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: _confirmPassword,
                  obscureText: obscureText,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Please enter your Re-Password';
                    } else if (value!.isEmpty ||
                        !RegExp(r'.{6,}$').hasMatch(value)) {
                      return 'Password must be at least 6 digit long.';
                    } else if (_passwordController.text !=
                        _confirmPassword.text) {
                      return 'Password doesn\'t match';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        child: obscureText
                            ? Icon(
                                Icons.visibility_off,
                                color: Colors.grey,
                              )
                            : Icon(
                                Icons.visibility,
                                color: Colors.purple,
                              )),
                    labelText: "Confirm Password",
                    hintText: "Password",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
              ), //components//components
              SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  _success == 1
                      ? ''
                      : (_success == 2
                          ? 'Successfully Registered'
                          : 'Registration Failed'),
                  style: TextStyle(color: Colors.red),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              RegisterButton(
                onTap: () {
                  _register();
                },
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Already Registered? Sign In',
                  style: AppStyle.tText,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//Input Decoration theme for the input field
InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    // borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: Colors.purple.shade600),
    gapPadding: 10,
  );
  return InputDecorationTheme(
      // floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      border: outlineInputBorder);
}
