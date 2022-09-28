import 'package:build_fourr/data/styles/app_style.dart';
import 'package:build_fourr/providers/user_auth_provider.dart';
import 'package:build_fourr/widgets/register_user/components/register_button.dart';
import 'package:build_fourr/widgets/register_user/components/register_heading.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

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

  @override
  void dispose() {
    _confirmPassword.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void register() async {
    String status = await context.read<UserAuthProvider>().register(
          email: _emailController.text,
          password: _passwordController.text,
        );
    Fluttertoast.showToast(msg: status, toastLength: Toast.LENGTH_SHORT);
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
              const SizedBox(
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
                            ? const Icon(
                                Icons.visibility_off,
                                color: Colors.grey,
                              )
                            : const Icon(
                                Icons.visibility,
                                color: Colors.purple,
                              )),
                    labelText: "Password",
                    hintText: "Password",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
              ),
              const SizedBox(
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
                            ? const Icon(
                                Icons.visibility_off,
                                color: Colors.grey,
                              )
                            : const Icon(
                                Icons.visibility,
                                color: Colors.purple,
                              )),
                    labelText: "Confirm Password",
                    hintText: "Password",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
              ), //components//components
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 30,
              ),
              RegisterButton(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    register();
                  }
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
      contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      border: outlineInputBorder);
}
