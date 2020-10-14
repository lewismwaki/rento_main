import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'auth-loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //auth loading
  bool authLoading = false;

  //form key
  final _formKey = GlobalKey<FormState>();

  //text field state
  String email = '';
  String password = '';

  //toggle visibility
  bool isHidden = true;
  void toggleVisibility() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return authLoading
        ? AuthLoading()
        : Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            body: Column(
              children: <Widget>[
                //illustration
                Container(
                  padding: EdgeInsets.only(top: 32.0, bottom: 32.0),
                  height: 387.0,
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/sign-in.png',
                    width: 365.0,
                    height: 365.0,
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.high,
                  ),
                ),

                //email & password
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      //email & username
                      Container(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Stack(
                          overflow: Overflow.visible,
                          children: <Widget>[
                            //input
                            Container(
                              width: 374.0,
                              height: 64.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Color(0xff9E9E9E),
                                  style: BorderStyle.solid,
                                  width: 2.0,
                                ),
                              ),
                              child: TextFormField(
                                maxLines: 1,
                                minLines: 1,
                                cursorWidth: 2.0,
                                cursorColor: Color(0xff1052CB),
                                autofocus: false,
                                style: TextStyle(
                                  letterSpacing: 0.25,
                                  color: Color(0xff1052CB),
                                ),
                                onChanged: (val) {
                                  setState(() => email = val);
                                },
                                enableInteractiveSelection: true,
                                validator: (val) {
                                  if (val.isEmpty) {
                                    return 'Email is required';
                                  }
                                  if ((val.contains('@')) && (val.contains('.co'))) {
                                    return null;
                                  } else {
                                    return 'Enter a valid email';
                                  }
                                },
                                decoration: InputDecoration(
                                  enabled: true,
                                  errorStyle: TextStyle(fontSize: 12),
                                  contentPadding: EdgeInsets.all(20.0),
                                  enabledBorder: InputBorder.none,
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      style: BorderStyle.none,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            //title
                            Positioned(
                              top: -10.5,
                              left: 15.0,
                              child: Container(
                                color: Colors.white,
                                height: 21.0,
                                width: 168.0,
                                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                                child: FittedBox(
                                  child: Text(
                                    'Email or Username',
                                    style: TextStyle(
                                      backgroundColor: Colors.white,
                                      color: Colors.grey[900],
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      //password
                      Container(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 24.0),
                        child: Stack(
                          overflow: Overflow.visible,
                          children: <Widget>[
                            //input
                            Container(
                              width: 374.0,
                              height: 64.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Color(0xff9E9E9E),
                                  style: BorderStyle.solid,
                                  width: 2.0,
                                ),
                              ),
                              child: TextFormField(
                                maxLines: 1,
                                minLines: 1,
                                obscureText: isHidden ? true : false,
                                cursorWidth: 2.0,
                                cursorColor: Color(0xff1052CB),
                                autofocus: false,
                                enableInteractiveSelection: true,
                                style: TextStyle(
                                  letterSpacing: 0.25,
                                  color: Color(0xff1052CB),
                                ),
                                onChanged: (val) {
                                  setState(() => email = val);
                                },
                                validator: (val) {
                                  if (val.length < 6) {
                                    return 'Password must be 6+ characters long';
                                  }
                                  if ((val.contains(RegExp(r'[0-9]'))) &&
                                      (val.contains(RegExp(r'[A-Z]')))) {
                                    return null;
                                  } else {
                                    return 'Password must contain one number & one uppercase letter';
                                  }
                                },
                                decoration: InputDecoration(
                                  enabled: true,
                                  errorStyle: TextStyle(fontSize: 12),
                                  contentPadding: EdgeInsets.all(20.0),
                                  enabledBorder: InputBorder.none,
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      style: BorderStyle.none,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            //password
                            Positioned(
                              top: -10.0,
                              left: 15.0,
                              child: Container(
                                color: Colors.white,
                                height: 21.0,
                                width: 96.0,
                                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                                child: FittedBox(
                                  child: Text(
                                    'Password',
                                    style: TextStyle(
                                      backgroundColor: Colors.white,
                                      color: Colors.grey[900],
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            //toggle visibility
                            Positioned(
                              right: 8.0,
                              child: Container(
                                height: 64.0,
                                width: 48.0,
                                child: FlatButton(
                                  padding: EdgeInsets.all(0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  highlightColor: Color(0xffC3D4F2).withAlpha(50),
                                  splashColor: Colors.transparent,
                                  onPressed: toggleVisibility,
                                  child: isHidden
                                      ? Icon(
                                          Icons.visibility_off,
                                          color: Color(0xffC3D4F2),
                                          size: 24.0,
                                        )
                                      : Icon(
                                          Icons.visibility,
                                          color: Color(0xff4D7ED8),
                                          size: 24.0,
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // forgot password
                Padding(
                  padding: EdgeInsets.only(top: 24.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      //password strength
                      Container(
                        width: 149.0,
                        height: 18.0,
                        child: FittedBox(
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xff1052CB),
                              decorationStyle: TextDecorationStyle.solid,
                              decorationColor: Color(0xff1052CB),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //sign-in btn
                Padding(
                  padding: EdgeInsets.only(top: 48.0),
                  child: FittedBox(
                    child: Container(
                      height: 56.0,
                      width: 374.0,
                      child: FlatButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => authLoading = true);
                            print(password);
                          }
                        },
                        splashColor: Colors.transparent,
                        color: Color(0xff1052CB),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                          side: BorderSide(
                            style: BorderStyle.solid,
                            width: 2.0,
                            color: Color(0xff1052CB),
                          ),
                        ),
                        child: Container(
                          height: 18,
                          child: FittedBox(
                            child: Text(
                              'SIGN IN',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                //or
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Container(
                            width: 64.0,
                            height: 1.0,
                            color: Colors.black,
                          ),
                          Container(
                            height: 18.0,
                            width: 24.0,
                            color: Colors.white,
                            child: FittedBox(
                              child: Text(
                                'or',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                  letterSpacing: 0.25,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                //facebook & google login
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 48.0,
                        width: 64.0,
                        margin: EdgeInsets.only(right: 12.0),
                        child: FlatButton(
                          onPressed: () {
                            //TODO: IMPLEMENT FACEBOOK SIGN IN API FOR BOTH SCREENS
                          },
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                            side: BorderSide(
                              style: BorderStyle.solid,
                              width: 2.0,
                              color: Colors.grey[900],
                            ),
                          ),
                          child: FaIcon(FontAwesomeIcons.facebookF),
                        ),
                      ),

                      //google sign in
                      Container(
                        height: 48.0,
                        width: 64.0,
                        child: FlatButton(
                          onPressed: () {
                            //TODO: IMPLEMENT GOOGLE SIGN IN API FOR BOTH SCREENS
                          },
                          splashColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                            side: BorderSide(
                              style: BorderStyle.solid,
                              width: 2.0,
                              color: Colors.grey[900],
                            ),
                          ),
                          child: FaIcon(FontAwesomeIcons.google),
                        ),
                      ),
                    ],
                  ),
                ),

                //new to rento register
                Padding(
                  padding: EdgeInsets.only(top: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: FittedBox(
                          child: Text(
                            'New To Rento? ',
                            style: TextStyle(
                              color: Colors.grey[900],
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          widget.toggleView();
                        },
                        child: Container(
                          child: FittedBox(
                            child: Text(
                              'Register',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff1052CB),
                                  decorationStyle: TextDecorationStyle.solid,
                                  decorationColor: Color(0xff1052CB),
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
  }
}
