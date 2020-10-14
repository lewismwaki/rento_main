import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getData() {
    Future.delayed(Duration(seconds: 2), () {
      print('delayed');
      Navigator.pushReplacementNamed(context, '/OnBoarding');
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
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }
}
