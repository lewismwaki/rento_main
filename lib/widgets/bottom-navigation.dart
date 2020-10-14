import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rento/models/icons-model.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;
  Widget _buildNavIcons(int index) {
    return index == 2
        ? SizedBox(
            width: 36.0,
            child: Container(color: Colors.white),
          )
        : FittedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: selectedIndex == index ? 43.0 : 41.0,
                  child: GestureDetector(
//                    onTap: () {
//                      setState(() {
//                        selectedIndex = index;
//                      });
//                    },
                    child: IconButton(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(top: 8.0),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
//                        setState(() {
//                          selectedIndex = index;
//                        });
                      },
                      icon: FaIcon(
                        navIcons[index],
                        color: selectedIndex == index ? Color(0xff1052CB) : Colors.blueGrey[400],
                      ),
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
                          color: selectedIndex == index ? Color(0xff1052CB) : Colors.blueGrey[400],
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
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
                  bottom: 14.0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/Loading');
                    },
                    child: Container(
                      width: 56.0,
                      decoration: BoxDecoration(
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
                          onPressed: () {
                            Navigator.pushNamed(context, '/Loading');
                          },
                          icon: Icon(
                            Icons.add_location,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
