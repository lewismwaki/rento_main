import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  String dropdownValue = 'San Francisco';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffF6F8FA),
      child: Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0, bottom: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //name & avi
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //name
                Container(
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
                //avi
                Container(
                  decoration: BoxDecoration(
//                    color: Colors.blueGrey[100],
                    color: Color(0xffF6F8FA),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(3.0),
                    child: CircleAvatar(
//                      backgroundImage: AssetImage(
//                        'assets/images/avi.jpg',
//                      ),
                      backgroundColor: Color(0xffF6F8FA),
                      radius: 25.0,
                    ),
                  ),
                ),
              ],
            ),

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
                  items: <String>['San Francisco', 'Paris', 'Nairobi', 'Rio De Janeiro']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(value: value, child: Text(value));
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
    );
  }
}
