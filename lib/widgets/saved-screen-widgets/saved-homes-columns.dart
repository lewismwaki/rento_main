import 'package:flutter/material.dart';

class SavedHomes extends StatefulWidget {
  @override
  _SavedHomesState createState() => _SavedHomesState();
}

class _SavedHomesState extends State<SavedHomes> {
  // toggleViewStyle
  bool showCarousel = true;
  void toggleViewStyle() {
    setState(() {
      return showCarousel = !showCarousel;
    });
  }

  @override
  Widget build(BuildContext context) {
    //perfect homes title
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Color(0xffF1F1F3)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.repeated,
        ),
      ),
      child: Padding(
          padding: EdgeInsets.only(
            left: 20.0,
            top: 20.0,
            bottom: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //title & toggle view
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //title
                  Container(
                    height: 22.0,
                    child: FittedBox(
                      child: Text(
                        'Your Favourite Homes',
                        style: TextStyle(
                          color: Colors.grey[900],
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),

                  //toggle view
                  Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        //column view
                        Container(
                          height: 23.0,
                          width: 23.0,
                          child: FlatButton(
                            padding: EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(),
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onPressed: () {},
                            child: Icon(
                              Icons.calendar_view_day,
                              size: 24.0,
                              color: showCarousel ? Color(0xff1052CB) : Colors.blueGrey[400],
                            ),
                          ),
                        ),

                        SizedBox(width: 8.0),

                        //carousel view
                        Container(
                          height: 23.0,
                          width: 23.0,
                          child: FlatButton(
                            padding: EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(),
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onPressed: () {
                              toggleViewStyle();
                            },
                            child: Icon(
                              Icons.view_carousel,
                              size: 24.0,
                              color: showCarousel ? Colors.blueGrey[400] : Color(0xff1052CB),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 8.0),

              //details
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //underliner
                  Container(
                    height: 3.5,
                    width: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color(0xff1052CB),
                    ),
                  ),

                  //based on
                  Container(
                    height: 14.0,
                    padding: EdgeInsets.only(left: 10.0),
                    child: FittedBox(
                      child: Text(
                        'Based on your recent activity',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              //ListView
            ],
          )),
    );
  }
}
