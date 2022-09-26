import 'package:build_fourr/ui/pages/login_page.dart';
import 'package:build_fourr/widgets/login_page/login_page_body.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login Page",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          inputDecorationTheme: inputDecorationTheme(),
          fontFamily: GoogleFonts.roboto().fontFamily,
          scaffoldBackgroundColor: const Color(0xFFE5E5E5),
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              centerTitle: true,
              iconTheme: IconThemeData(color: Colors.white),
              toolbarTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ))),
      initialRoute: "dashboard",
      routes: {
        "dashboard": (context) => const LoginPage(),
      },
    );
  }
}
