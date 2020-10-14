import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rento/models/perfect-homes-model.dart';
import 'package:rento/screens/home-details/perfect-home-details-screen.dart';

class PerfectSectionCarousel extends StatefulWidget {
  final Function toggleViewStyle;
  PerfectSectionCarousel({this.toggleViewStyle});

  @override
  _PerfectSectionCarouselState createState() => _PerfectSectionCarouselState();
}

class _PerfectSectionCarouselState extends State<PerfectSectionCarousel> {
  bool showCarousel = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //perfect title
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
                    'Perfect Homes For You',
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

                    //carousel view
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
        //perfect carousel
        Container(
          height: 240.0,
          child: ListView.builder(
            itemCount: perfectHomes.length,
            scrollDirection: Axis.horizontal,
            physics: ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              //carousel
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PerfectHomeDetailsScreen(
                        perfectHomes: perfectHomes[index],
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: index == 0
                      ? EdgeInsets.only(left: 20.0, right: 7.5)
                      : EdgeInsets.only(
                          left: 7.5,
                          right: index == perfectHomes.length - 1 ? 20.0 : 7.5,
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
                                'assets/images/perfect-${perfectHomes[index].imageNo}.jpg',
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
                                          '\$${perfectHomes[index].price}',
                                          style: TextStyle(
                                            color: Colors.grey[900],
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                    //location
                                    Container(
                                      padding: EdgeInsets.only(bottom: 10),
                                      height: 25.0,
                                      child: FittedBox(
                                        child: Text(
                                          '${perfectHomes[index].location}',
                                          style: TextStyle(
                                            color: Colors.blueGrey[400],
                                            fontWeight: FontWeight.w500,
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
                                                    '${perfectHomes[index].bedrooms}',
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
                                                    '${perfectHomes[index].bathrooms}',
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
                                  perfectHomes[index].isLiked
                                      ? perfectHomes[index].isLiked = false
                                      : perfectHomes[index].isLiked = true;
                                });
                                //TODO: Implement Saved Homes Screen
                                //SavedHome();
                              },
                              icon: Container(
                                child: perfectHomes[index].isLiked == true
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
