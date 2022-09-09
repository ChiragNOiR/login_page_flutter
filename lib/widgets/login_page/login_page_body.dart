// ignore_for_file: prefer_const_constructors
import 'package:build_fourr/widgets/login_page/components_login/heading_design.dart';
import 'package:build_fourr/widgets/login_page/components_login/login_button.dart';
import 'package:flutter/material.dart';

class LoginPageBody extends StatefulWidget {
  const LoginPageBody({super.key});

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  final List<String> errors = [];
  final _formKey = GlobalKey<FormState>();
  var obscureText = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const HeadingDesign(), //components
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your Full Name";
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  labelText: "Name",
                  hintText: "Full Name",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
            ), //components
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
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
                  // prefixIcon: Icon(
                  //   Icons.lock,
                  //   color: Colors.purple,
                  // ),
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
                  // suffixIcon: SuffixIcon(
                  //   pngIcons: "assets/icons/email.png",
                  // ),
                ),
              ),
            ), //components
            SizedBox(
              height: 150,
            ),
            LoginButton(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  // print("LOGIN SUCCESS!");
                  return null;
                }
              },
            ), //components
          ],
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
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      border: outlineInputBorder);
}
