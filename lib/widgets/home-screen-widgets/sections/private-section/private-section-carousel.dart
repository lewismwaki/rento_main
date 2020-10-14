import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rento/models/private-homes-model.dart';
import 'package:rento/screens/home-details/private-home-details-screen.dart';

class PrivateSectionCarousel extends StatefulWidget {
  final Function toggleViewStyle;
  PrivateSectionCarousel({this.toggleViewStyle});

  @override
  _PrivateSectionCarouselState createState() => _PrivateSectionCarouselState();
}

class _PrivateSectionCarouselState extends State<PrivateSectionCarousel> {
  bool showCarousel = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //private title
        Padding(
          padding: EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
          child: Row(
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
                          Icons.calendar_view_day,
                          size: 24.0,
                          color: showCarousel ? Colors.blueGrey[400] : Color(0xff1052CB),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.0),
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
                          Icons.view_carousel,
                          size: 24.0,
                          color: showCarousel ? Color(0xff1052CB) : Colors.blueGrey[400],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        //private carousel
        Container(
          height: 240.0,
          child: ListView.builder(
            itemCount: privateHomes.length,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              //carousel
              return GestureDetector(
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
                child: Padding(
                  padding: index == 0
                      ? EdgeInsets.only(left: 20.0, right: 7.5)
                      : EdgeInsets.only(
                          left: 7.5,
                          right: index == privateHomes.length - 1 ? 20.0 : 7.5,
                        ),
                  child: Container(
                    height: 240.0,
                    width: 170.0,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Stack(
                      children: <Widget>[
                        //details
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            //image
                            Container(
                              height: 140.0,
                              width: 170.0,
                              child: Image.asset(
                                'assets/images/private-${privateHomes[index].imageNo}.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            //details
                            Container(
                              height: 100.0,
                              color: Color(0xFFFDFDFD),
                              child: Container(
                                margin: EdgeInsets.only(left: 10.0, top: 15.0, bottom: 15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    //price
                                    Container(
                                      padding: EdgeInsets.only(bottom: 10),
                                      height: 29.0,
                                      child: FittedBox(
                                        child: Text(
                                          '\$${privateHomes[index].price}',
                                          style: TextStyle(
                                            color: Colors.grey[900],
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 0.25,
                                          ),
                                        ),
                                      ),
                                    ),
                                    //name
                                    Container(
                                      padding: EdgeInsets.only(bottom: 10),
                                      height: 25.0,
                                      child: FittedBox(
                                        child: Text(
                                          '${privateHomes[index].location}',
                                          style: TextStyle(
                                            color: Colors.blueGrey[400],
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.25,
                                          ),
                                        ),
                                      ),
                                    ),
                                    //bedrooms bathrooms
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          height: 15.0,
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
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        //like
                        Positioned(
                          bottom: 76.0,
                          right: 10.0,
                          child: Container(
                            width: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2,
                                  spreadRadius: 1,
                                  offset: Offset(0, 3),
                                  color: Color(0xffF8F8F8),
                                ),
                              ],
                            ),
                            child: IconButton(
                              alignment: Alignment.center,
                              iconSize: 16.0,
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onPressed: () {
                                setState(() {
                                  privateHomes[index].isLiked
                                      ? privateHomes[index].isLiked = false //true
                                      : privateHomes[index].isLiked = true; //false
                                });
                              },
                              icon: Container(
                                child: privateHomes[index].isLiked == true //true
                                    ? Icon(
                                        Icons.favorite,
                                        color: Colors.redAccent,
                                      )
                                    : Icon(
                                        Icons.favorite_border,
                                        color: Colors.black,
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
