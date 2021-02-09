import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rento/models/icons-model.dart';
import 'package:rento/models/private-homes-model.dart';
import 'package:rento/screens/home-details/private-home-details-screen.dart';

class PrivateSectionColumns extends StatefulWidget {
  final Function toggleViewStyle;
  PrivateSectionColumns({this.toggleViewStyle});

  @override
  _PrivateSectionColumnsState createState() => _PrivateSectionColumnsState();
}

class _PrivateSectionColumnsState extends State<PrivateSectionColumns> {
  bool showCarousel = true;

  //build columns
  Widget _buildColumnTiles(int index) {
    return Padding(
      padding: EdgeInsets.only(right: 20.0, left: 20.0, top: index == 0 ? 0.0 : 20.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PrivateHomeDetailsScreen(
                privateHomes: privateHomes[index],
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //image  & like
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                //image
                Container(
                  height: 240.0,
                  width: 414.0,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/private-${privateHomes[index].imageNo}.jpg',
                    fit: BoxFit.cover,
                  ),
                ),

                //like
                FlatButton(
                  padding: EdgeInsets.only(right: 15),
                  shape: RoundedRectangleBorder(),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      privateHomes[index].isLiked
                          ? privateHomes[index].isLiked = false //true
                          : privateHomes[index].isLiked = true; //false
                    });
                  },
                  child: Container(
                    alignment: Alignment.topRight,
                    child: privateHomes[index].isLiked == true //true
                        ? Icon(
                            Icons.favorite,
                            color: Colors.redAccent,
                            size: 16.0,
                          )
                        : Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                            size: 16.0,
                          ),
                  ),
                ),

                //miles
                Positioned(
                  left: 0.0,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {},
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      height: 24.0,
                      width: 81.0,
                      decoration: BoxDecoration(
                        color: Color(0xff1052CB).withAlpha(45),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FittedBox(
                            child: FaIcon(
                              FontAwesomeIcons.road,
                              color: Color(0xff1052CB),
                            ),
                          ),
                          FittedBox(
                            child: Text(
                              '2.5 Miles',
                              style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 0.25,
//                                color: Colors.blueGrey[400],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // details & price
            Padding(
              padding: EdgeInsets.only(top: 4.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //details
                  Container(
                    height: 42,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //name
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 19.0,
                              child: FittedBox(
                                child: Text(
                                  '${privateHomes[index].location}',
                                  style: TextStyle(
                                    color: Colors.grey[900],
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.25,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        //reviews & facilities
                        Row(
                          children: <Widget>[
                            //bathrooms and bathrooms
                            Container(
                              height: 14.0,
                              child: FittedBox(
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(right: 7.5),
                                      child: FaIcon(
                                        FontAwesomeIcons.bed,
                                        size: 16,
                                        color: Color(0xff1052CB),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 15.0),
                                      child: Text(
                                        '${privateHomes[index].bedrooms}',
                                        style: TextStyle(
                                          color: Colors.blueGrey[400],
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 7.5),
                                      child: FaIcon(
                                        FontAwesomeIcons.bath,
                                        size: 16.0,
                                        color: Color(0xff1052CB),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 15.0),
                                      child: Text(
                                        '${privateHomes[index].bathrooms}',
                                        style: TextStyle(
                                          color: Colors.blueGrey[400],
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //reviews
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(right: 40.0),
                                  child: FittedBox(
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.star,
                                          size: 14.0,
                                          color: Colors.yellow[700],
                                        ),
                                        Container(
                                          height: 14.0,
                                          padding: EdgeInsets.only(left: 5.0),
                                          child: FittedBox(
                                            child: Text(
                                              '${privateHomes[index].reviews.toString()}k Reviews',
                                              style: TextStyle(
                                                color: Colors.blueGrey,
                                                fontWeight: FontWeight.w500,
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
                        ),
                      ],
                    ),
                  ),
                  //price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 17.0,
                        child: FittedBox(
                          child: Text(
                            '\$${privateHomes[index].price} ',
                            style: TextStyle(
                              color: Color(0xff1052CB),
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.25,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 12.0,
                        child: FittedBox(
                          child: Text(
                            '/ Night',
                            style: TextStyle(
                              color: Colors.blueGrey[400],
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.50,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //perfect homes title
        Padding(
          padding: EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //title
                  Container(
                    height: 22.0,
                    child: FittedBox(
                      child: Text(
                        'Private Homes For You',
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
                              widget.toggleViewStyle();
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
            ],
          ),
        ),
        //perfect homes column
        Column(
          children: navIcons.asMap().entries.map((MapEntry map) => _buildColumnTiles(map.key)).toList(),
        ),
        //separator
        Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FittedBox(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    color: Color(0xff1052CB),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
