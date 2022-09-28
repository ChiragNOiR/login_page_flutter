// ignore_for_file: prefer_const_constructors
import 'package:build_fourr/data/styles/app_style.dart';
import 'package:build_fourr/providers/user_auth_provider.dart';
import 'package:build_fourr/ui/pages/home_page.dart';
import 'package:build_fourr/widgets/login_page/components_login/heading_design.dart';
import 'package:build_fourr/widgets/login_page/components_login/login_button.dart';
import 'package:build_fourr/widgets/register_user/register_user_body.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class LoginPageBody extends StatefulWidget {
  const LoginPageBody({super.key});

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  // final List<String> errors = [];
  final _formKey = GlobalKey<FormState>();
  var obscureText = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void signIn() async {
    if (_formKey.currentState!.validate()) {
      String status = await context.read<UserAuthProvider>().signIn(
            email: _emailController.text,
            password: _passwordController.text,
          );
      Fluttertoast.showToast(msg: status, toastLength: Toast.LENGTH_SHORT);
      if (status == 'Logged In Successfully') {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage()));
      }
    }
  }

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
            ), //components
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 30,
            ),
            LoginButton(
              onTap: () async {
                signIn();
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegisterPageBody()));
              },
              child: Text(
                'Haven\'t Registered? Sign Up',
                style: AppStyle.tText,
              ),
            )
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
      // floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      border: outlineInputBorder);
}
