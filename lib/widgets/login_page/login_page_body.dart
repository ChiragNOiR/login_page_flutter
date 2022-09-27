// ignore_for_file: prefer_const_constructors
import 'package:build_fourr/data/styles/app_style.dart';
import 'package:build_fourr/providers/user_auth_provider.dart';
import 'package:build_fourr/ui/pages/home_page.dart';
import 'package:build_fourr/widgets/login_page/components_login/heading_design.dart';
import 'package:build_fourr/widgets/login_page/components_login/login_button.dart';
import 'package:build_fourr/widgets/register_user/register_user_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

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
  int _success = 1;
  // ignore: unused_field
  String? _userEmail = "";

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  // void _singIn() async {
  //   final User? user = (await _auth.signInWithEmailAndPassword(
  //           email: _emailController.text, password: _passwordController.text))
  //       .user;

  //   if (user != null) {
  //     setState(() {
  //       _success = 2;
  //       _userEmail = user.email;
  //       Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => HomePage(),
  //           ));
  //     });
  //   } else {
  //     setState(() {
  //       _success = 3;
  //     });
  //   }
  // }
  void signIn() async {
    String status = await context.read<UserAuthProvider>().register(
          email: _emailController.text,
          password: _passwordController.text,
        );
    if (status != null) {
      setState(() {
        _success = 2;
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      });
    } else {
      setState(() {
        _success = 3;
      });
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
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                _success == 1
                    ? ''
                    : (_success == 2
                        ? 'Successfully signed in'
                        : 'Sign in failed'),
                style: TextStyle(color: Colors.red),
              ),
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
