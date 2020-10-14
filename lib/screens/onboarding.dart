import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  //page control
  final int _totalPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  //build indicators
  List<Widget> _buildIndicators() {
    List<Widget> list = [];
    for (int i = 0; i < _totalPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return LayoutBuilder(builder: (context, constraints) {
      return AnimatedContainer(
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInCirc,
        width: isActive ? 20.0 : 16.0,
        height: 10.0,
        decoration: BoxDecoration(
          color: isActive ? Color(0xff1052CB) : Color(0xffC3D4F2),
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: isActive ? Color(0xff1052CB) : Color(0xff4D7ED8),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size);
    Size screenSize = MediaQuery.of(context).size;
    double height = (screenSize.height) - (MediaQuery.of(context).padding.top);
    double width = (screenSize.width);
    print(height);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              //SKIP
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: height * 0.05097087378640777, //42
                    width: width * 0.1352657004830918, //56
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Container(
                          padding: EdgeInsets.only(
                            top: constraints.maxHeight * 0.5714285714285714, //24
                            right: constraints.maxWidth * 0.3571428571428571, //20
                          ),
                          height: constraints.maxHeight * 1.0, //42
                          width: constraints.maxHeight * 1.0, //56
                          child: FlatButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, '/Authenticate');
                            },
                            splashColor: Colors.transparent,
                            color: Colors.white,
                            child: FittedBox(
                              child: Text(
                                'SKIP',
                                style: TextStyle(
                                  color: Color(0xff1052CB),
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),

              //page views
              Container(
                height: 591, //591
                width: width,
                child: LayoutBuilder(
                  builder: (context, constraints) {
//                    var containerHeight = constraints.maxHeight;
//                    var containerWidth = constraints.maxWidth;

                    return PageView(
                      physics: BouncingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: <Widget>[
                        //page 1
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            //illustration
                            Container(
                              alignment: Alignment.center,
                              child: Image.asset(
                                'assets/images/illustration-1.jpg',
                                height: 403, //386
                                width: 403, //386
                                fit: BoxFit.contain,
                                filterQuality: FilterQuality.high,
                              ),
                            ),
                            //details
                            Container(
                              padding: EdgeInsets.only(left: 20.0, right: 20.0),
                              height: 104.0, //104
                              child: FittedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    //first
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          height: 34.66666666666667, //37
                                          child: FittedBox(
                                            child: Text(
                                              'Always at',
                                              style: TextStyle(
                                                color: Colors.grey[900],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    //second
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          height: 34.66666666666667, //37
                                          child: FittedBox(
                                            child: Text(
                                              'your comfort',
                                              style: TextStyle(
                                                color: Colors.grey[900],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    //third
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          height: 34.66666666666667, //37
                                          child: FittedBox(
                                            child: Text(
                                              'anywhere',
                                              style: TextStyle(
                                                color: Color(0xff1052CB),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 34.66666666666667, //37
                                          child: FittedBox(
                                            child: Text(
                                              ', anytime',
                                              style: TextStyle(
                                                color: Color(0xff1052CB),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //more details
                            Container(
                              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                              height: 84.0, //84
                              child: FittedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    //first
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          height: 21.0, //20
                                          child: FittedBox(
                                            child: Text(
                                              'Lorem ipsum dolor sit amet, consectetur',
                                              style: TextStyle(
                                                color: Color(0xff4B7DD8),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    //second
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          height: 21.0, //20
                                          child: FittedBox(
                                            child: Text(
                                              'adipiscing elit.',
                                              style: TextStyle(
                                                color: Color(0xff7F7F7F),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 21.0, //20
                                          child: FittedBox(
                                            child: Text(
                                              'Aenean euismod nean euismod',
                                              style: TextStyle(
                                                color: Color(0xff7F7F7F),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    //third
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          height: 21.0, //20
                                          child: FittedBox(
                                            child: Text(
                                              'Proin gravida dolor sit aAenean eneabibendum',
                                              style: TextStyle(
                                                color: Color(0xff7F7F7F),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    //four
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          height: 21.0, //20
                                          child: FittedBox(
                                            child: Text(
                                              'laoreet Proin gravid',
                                              style: TextStyle(
                                                color: Color(0xff7F7F7F),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        //page 2
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            //illustration
                            Container(
                              alignment: Alignment.center,
                              child: Image.asset(
                                'assets/images/illustration-2.jpg',
                                height: 403, //386
                                width: 403, //386
                                fit: BoxFit.contain,
                                filterQuality: FilterQuality.high,
                              ),
                            ),
                            //details
                            Container(
                              padding: EdgeInsets.only(left: 20.0, right: 20.0),
                              height: 104.0, //104
                              child: FittedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    //first
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          height: 34.66666666666667, //37
                                          child: FittedBox(
                                            child: Text(
                                              'The convenience',
                                              style: TextStyle(
                                                color: Color(0xff1052CB),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    //second
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          height: 34.66666666666667, //37
                                          child: FittedBox(
                                            child: Text(
                                              'of shopping always ',
                                              style: TextStyle(
                                                color: Colors.grey[900],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    //third
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          height: 34.66666666666667, //37
                                          child: FittedBox(
                                            child: Text(
                                              'at your palm',
                                              style: TextStyle(
                                                color: Colors.grey[900],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //more details
                            Container(
                              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                              height: 84.0, //84
                              child: FittedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    //first
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          height: 21.0, //20
                                          child: FittedBox(
                                            child: Text(
                                              'Lorem ipsum dolor sit amet, consectetur',
                                              style: TextStyle(
                                                color: Color(0xff7F7F7F),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    //second
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          height: 21.0, //20
                                          child: FittedBox(
                                            child: Text(
                                              'adipiscing elit.',
                                              style: TextStyle(
                                                color: Color(0xff7F7F7F),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 21.0, //20
                                          child: FittedBox(
                                            child: Text(
                                              'Aenean euismod nean euismod',
                                              style: TextStyle(
                                                color: Color(0xff7F7F7F),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    //third
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          height: 21.0, //20
                                          child: FittedBox(
                                            child: Text(
                                              'Proin gravida dolor sit aAenean eneabibendum',
                                              style: TextStyle(
                                                color: Color(0xff7F7F7F),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    //four
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          height: 21.0, //20
                                          child: FittedBox(
                                            child: Text(
                                              'laoreet Proin gravid',
                                              style: TextStyle(
                                                color: Color(0xff4B7DD8),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        //page 3
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            //illustration
                            Container(
                              alignment: Alignment.center,
                              child: Image.asset(
                                'assets/images/illustration-3.jpg',
                                height: 403, //386
                                width: 403, //386
                                fit: BoxFit.contain,
                                filterQuality: FilterQuality.high,
                              ),
                            ),
                            //details
                            Container(
                              padding: EdgeInsets.only(left: 20.0, right: 20.0),
                              height: 104.0, //104
                              child: FittedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    //first
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          height: 34.66666666666667, //37
                                          child: FittedBox(
                                            child: Text(
                                              'Cut down the',
                                              style: TextStyle(
                                                color: Colors.grey[900],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    //second
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          height: 34.66666666666667, //37
                                          child: FittedBox(
                                            child: Text(
                                              'hussle brought',
                                              style: TextStyle(
                                                color: Colors.grey[900],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    //third
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          height: 34.66666666666667, //37
                                          child: FittedBox(
                                            child: Text(
                                              'by ',
                                              style: TextStyle(
                                                color: Colors.grey[900],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 34.66666666666667, //37
                                          child: FittedBox(
                                            child: Text(
                                              'house hunting',
                                              style: TextStyle(
                                                color: Color(0xff1052CB),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //more details
                            Container(
                              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                              height: 84.0, //84
                              child: FittedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    //first
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          height: 21.0, //20
                                          child: FittedBox(
                                            child: Text(
                                              'Lorem ipsum dolor sit amet, consectetur',
                                              style: TextStyle(
                                                color: Color(0xff7F7F7F),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    //second
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          height: 21.0, //20
                                          child: FittedBox(
                                            child: Text(
                                              'adipiscing elit.',
                                              style: TextStyle(
                                                color: Color(0xff7F7F7F),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 21.0, //20
                                          child: FittedBox(
                                            child: Text(
                                              'Aenean euismod nean euismod',
                                              style: TextStyle(
                                                color: Color(0xff7F7F7F),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    //third
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          height: 21.0, //20
                                          child: FittedBox(
                                            child: Text(
                                              'Proin gravida dolor sit aAenean eneabibendum',
                                              style: TextStyle(
                                                color: Color(0xff4B7DD8),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    //four
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          height: 21.0, //20
                                          child: FittedBox(
                                            child: Text(
                                              'laoreet Proin gravid',
                                              style: TextStyle(
                                                color: Color(0xff7F7F7F),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),

              SizedBox(height: 34.0),

              //indicators
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildIndicators(),
              ),

              SizedBox(height: 87.0),

              //next
              _currentPage != _totalPages - 1
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(right: 20.0, bottom: 24.0),
                          height: 60.0, //60
                          width: 92.0, //92
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              return Container(
                                height: 56.0, //56
                                width: 90.0, //90
                                child: FlatButton(
                                  color: Color(0xff1052CB),
                                  padding: EdgeInsets.all(0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  onPressed: () {
                                    _pageController.nextPage(
                                        duration: Duration(milliseconds: 500), curve: Curves.ease);
                                  },
                                  splashColor: Colors.transparent,
                                  child: FittedBox(
                                    child: Text(
                                      'NEXT',
                                      style: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),

        //get started
        bottomSheet: _currentPage == _totalPages - 1
            ? GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/Authenticate');
                },
                child: Container(
                  height: 70.0, //70
                  padding: EdgeInsets.only(
                    top: 10.0,
                  ),
                  width: double.infinity,
                  alignment: Alignment.topCenter,
                  color: Color(0xff1052CB),
                  child: FittedBox(
                    child: Text(
                      'GET STARTED',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              )
            : SizedBox.shrink(),
      ),
    );
  }
}
