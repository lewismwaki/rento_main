import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rento/models/icons-model.dart';
import 'package:rento/widgets/home-screen-widgets/categories.dart';
import 'package:rento/widgets/home-screen-widgets/sections/perfect-section/perfect-section-container.dart';
import 'package:rento/widgets/home-screen-widgets/sections/private-section/private-section-container.dart';
import 'package:rento/widgets/saved-screen-widgets/saved-homes-columns.dart';
import 'package:rento/widgets/saved-screen-widgets/search.dart';

class PagesContainer extends StatefulWidget {
  @override
  _PagesContainerState createState() => _PagesContainerState();
}

class _PagesContainerState extends State<PagesContainer> {
  //build bottom app bar
  int selectedIndex = 0;
  int jumpTo = 0;
  Widget _buildNavIcons(int index) {
    return index == 2
        ? SizedBox(
            width: 36.0,
            child: Container(color: Colors.white),
          )
        : GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: FittedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: selectedIndex == index ? 43.0 : 41.0,
                    child: IconButton(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(top: 8.0),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        setState(() {
                          selectedIndex = index;
                        });

                        if (index == index) {
                          _pageController.jumpToPage(index);
                        }
                      },
                      icon: FaIcon(
                        navIcons[index],
                        color: selectedIndex == index ? Color(0xff1052CB) : Colors.blueGrey[400],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: Container(
                      height: 14.0,
                      alignment: Alignment.topCenter,
                      child: FittedBox(
                        child: Text(
                          navLabels[index],
                          style: TextStyle(
                            color:
                                selectedIndex == index ? Color(0xff1052CB) : Colors.blueGrey[400],
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  // toggleViewStyle
  bool showCarousel = true;
  void toggleViewStyle() {
    setState(() {
      return showCarousel = !showCarousel;
    });
  }

  //page control
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  String dropdownValue = 'San Francisco';

  @override
  Widget build(BuildContext context) {
    //media queries
    print(MediaQuery.of(context).size);
    Size screenSize = MediaQuery.of(context).size;
    double height = (screenSize.height);
    double width = (screenSize.width);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        //screens
        body: Container(
          height: height,
          width: width,
          child: LayoutBuilder(builder: (context, constraints) {
            return PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                  selectedIndex = page;
                });
              },
              children: [
                //home screen widgets
                CustomScrollView(
                  scrollDirection: Axis.vertical,
                  physics: ClampingScrollPhysics(),
                  slivers: <Widget>[
                    SliverAppBar(
                      backgroundColor: Colors.white,
                      expandedHeight: 140.0,
                      pinned: true,
                      floating: true,
                      elevation: 0.5,
                      forceElevated: false,
                      //home
                      //TODO: add text-styled rento logo in place of 'home'
                      title: Container(
                        height: 21.0,
                        child: FittedBox(
                          child: Text(
                            'Home',
                            style: TextStyle(
                              color: Color(0xff1052CB),
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.25,
                            ),
                          ),
                        ),
                      ),

                      actions: [
                        Padding(
                          padding: EdgeInsets.only(right: 16.0),
                          child: Center(
                            child: Container(
//                              height: 30.0,
//                              width: 30.0,
                              decoration: BoxDecoration(
                                color: Colors.blueGrey[100],
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(2.0),
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                    'assets/images/avi.jpg',
                                  ),
                                  radius: 18.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],

                      //select location
                      flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.pin,
                        stretchModes: [
                          StretchMode.zoomBackground,
//                          StretchMode.blurBackground,
                        ],
                        background: Container(
                          color: Color(0xffF6F8FA),
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                //select your location
                                Container(
                                  height: 13.0,
                                  child: FittedBox(
                                    child: Text(
                                      'SELECT YOUR LOCATION',
                                      style: TextStyle(
                                        color: Colors.blueGrey[400],
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  ),
                                ),
                                //dropdown menu
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      height: 20.0,
                                      margin: EdgeInsets.only(right: 5.0),
                                      child: FittedBox(
                                        child: Icon(
                                          Icons.location_on,
                                          color: Color(0xff1052CB),
                                        ),
                                      ),
                                    ),
                                    DropdownButton<String>(
                                      value: dropdownValue,
                                      iconSize: 22,
                                      elevation: 0,
                                      items: <String>[
                                        'San Francisco',
                                        'Paris',
                                        'Nairobi',
                                        'Rio De Janeiro'
                                      ].map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                            value: value, child: Text(value));
                                      }).toList(),
                                      style: TextStyle(
                                        color: Colors.grey[900],
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16.0,
                                        letterSpacing: 0.5,
                                      ),
                                      onChanged: (String newValue) {
                                        setState(() {
                                          dropdownValue = newValue;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.blueGrey[400],
                                      ),
                                      underline: Container(height: 0.0, width: 0.0),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    SliverList(
                      delegate: SliverChildListDelegate(<Widget>[
                        //category selector
                        Categories(),
                        //perfect homes section
                        PerfectSectionContainer(),
                        //private homes carousel
                        PrivateSectionContainer(),

                        PrivateSectionContainer(),
                      ]),
                    ),
                    //header
//                    Header(),
                  ],
                ),

                //Saved screen
                ListView(
                  scrollDirection: Axis.vertical,
                  physics: ClampingScrollPhysics(),
                  children: <Widget>[
                    //search
                    Search(),
                    //column view
                    SavedHomes(),
                  ],
                ),

                //search my area screen
                ListView(
                  scrollDirection: Axis.vertical,
                  physics: ClampingScrollPhysics(),
                  children: <Widget>[
                    //google map
                    // Gmap(),

                    //
                  ],
                ),

                //search list screen
                ListView(
                  scrollDirection: Axis.vertical,
                  physics: ClampingScrollPhysics(),
                  children: <Widget>[
                    //search
                    Search(),
                  ],
                ),

                //Page 5
                ListView(
                  scrollDirection: Axis.vertical,
                  physics: ClampingScrollPhysics(),
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.white, Color(0xffF9F9FA), Color(0xffF1F1F3)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          tileMode: TileMode.repeated,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 20.0,
                          top: 30.0,
                          bottom: 20.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            //title & toggle view
                            Container(
                              height: 30.0,
                              child: FittedBox(
                                child: Text(
                                  'Settings',
                                  style: TextStyle(
                                    color: Colors.grey[900],
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.25,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
        ),

        //bottom nav bar
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Container(
            color: Colors.white,
            alignment: Alignment.topCenter,
            height: 56.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                //navBar
                Stack(
                  alignment: Alignment.topCenter,
                  overflow: Overflow.visible,
                  children: <Widget>[
                    //icons
                    Container(
                      height: 56.0,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: navIcons
                            .asMap()
                            .entries
                            .map((MapEntry map) => _buildNavIcons(map.key))
                            .toList(),
                      ),
                    ),

                    //floating add button
                    Positioned(
                      bottom: _currentPage == 2 ? 15.0 : 14.0,
                      child: AnimatedContainer(
                        width: _currentPage == 2 ? 58 : 56.0,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeInCirc,
                        decoration: BoxDecoration(
                          boxShadow: [
                            _currentPage == 2
                                ? BoxShadow(
                                    blurRadius: 1.5,
                                    spreadRadius: 1,
                                    offset: Offset(0, 3),
                                    color: Color(0xff1052CB).withAlpha(30),
                                  )
                                : BoxShadow(),
                          ],
                          color: Color(0xff1052CB),
                          shape: BoxShape.circle,
                          border: Border.all(
                            style: BorderStyle.solid,
                            width: 3.0,
                            color: Colors.white,
                          ),
                        ),
                        child: FittedBox(
                          child: IconButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            icon: Icon(
                              Icons.add_location,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              _pageController.jumpToPage(2);
                            },
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
      ),
    );
  }
}
