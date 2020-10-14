import 'package:flutter/material.dart';

class AuthLoading extends StatefulWidget {
  @override
  _AuthLoadingState createState() => _AuthLoadingState();
}

class _AuthLoadingState extends State<AuthLoading> {
  void getData() {
    Future.delayed(Duration(seconds: 2), () {
      print('delayed');
      Navigator.pushReplacementNamed(context, '/PagesContainer');
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2C56D7),
      body: Center(
        child: Image.asset(
          'assets/images/loading.png',
          color: Color(0xFF2B55D6),
          colorBlendMode: BlendMode.lighten,
        ),
      ),
    );
  }
}
