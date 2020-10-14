import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rento/models/private-homes-model.dart';

class PrivateHomeDetailsScreen extends StatefulWidget {
  final PrivateHome privateHomes;
  PrivateHomeDetailsScreen({this.privateHomes});

  @override
  _PrivateHomeDetailsScreenState createState() => _PrivateHomeDetailsScreenState();
}

class _PrivateHomeDetailsScreenState extends State<PrivateHomeDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            //actual home
            Stack(
              children: <Widget>[
                //background image
                Container(
                  height:
                      (MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top) *
                          0.4,
                  width: MediaQuery.of(context).size.width,
                  foregroundDecoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black45,
                        Colors.transparent,
                      ], // whitish to gray
                      tileMode: TileMode.repeated,
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/private-${widget.privateHomes.imageNo}.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                //nav
                Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      //icon
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                      //like
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.privateHomes.isLiked
                                ? widget.privateHomes.isLiked = false
                                : widget.privateHomes.isLiked = true;
                          });
                        },
                        child: Container(
                          child: widget.privateHomes.isLiked == true
                              ? Icon(
                                  Icons.favorite,
                                  color: Colors.redAccent,
                                )
                              : Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                //details
                Positioned(
                  bottom: 20.0,
                  left: 20.0,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //name
                      Container(
                        padding: EdgeInsets.only(bottom: 10.0),
                        height: 36.0,
                        child: FittedBox(
                          child: Text(
                            '${widget.privateHomes.name}',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                      //location & reviews
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          //location
                          Container(
                            child: FittedBox(
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.location_on,
                                    size: 17.0,
                                    color: Colors.white,
                                  ),
                                  //location
                                  Container(
                                    height: 15.0,
                                    padding: EdgeInsets.only(left: 5.0),
                                    child: FittedBox(
                                      child: Text(
                                        '${widget.privateHomes.location}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //reviews
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
                                        '${widget.privateHomes.reviews.toString()}k Reviews',
                                        style: TextStyle(
                                          color: Colors.white,
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
                ),
              ],
            ),

            //owner-section
            Padding(
              padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //personal details
                  Row(
                    children: <Widget>[
                      //avi
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[100],
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(3.0),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                              'assets/images/avi.jpg',
                            ),
                            radius: 25.0,
                          ),
                        ),
                      ),
                      //seller & seller type
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //seller
                            Container(
                              height: 23.0,
                              padding: EdgeInsets.only(bottom: 4.0),
                              child: FittedBox(
                                child: Text(
                                  'Josie Maran',
                                  style: TextStyle(
                                    color: Colors.grey[900],
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.25,
                                  ),
                                ),
                              ),
                            ),
                            //seller type
                            Container(
                              height: 15.0,
                              child: FittedBox(
                                child: Text(
                                  'Property Owner',
                                  style: TextStyle(
                                    color: Colors.blueGrey[400],
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.25,
                                  ),
                                ),
                              ),
                            ),
                            //call icon
                          ],
                        ),
                      ),
                    ],
                  ),

                  //contacts
                  Row(
                    children: <Widget>[
                      //call
                      Container(
                        width: 48.0,
                        height: 48.0,
                        decoration: BoxDecoration(
                          color: Color(0xffE2ECFD),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.call,
                          size: 22.0,
                          color: Color(0xff1052CB),
                        ),
                      ),
                      //mail
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Container(
                          width: 48.0,
                          height: 48.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xffE2ECFD),
                            shape: BoxShape.circle,
                          ),
                          child: FaIcon(
                            FontAwesomeIcons.envelope,
                            size: 22.0,
                            color: Color(0xff1052CB),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //amenities
            Padding(
              padding: EdgeInsets.only(top: 25.0, bottom: 25.0),
              child: Container(
                height: 20.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        //beds
                        Row(
                          children: <Widget>[
                            Container(
                              height: 20.0,
                              child: FittedBox(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 10.0, left: 20.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.bed,
                                    size: 16,
                                    color: Color(0xff1052CB),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 25.0),
                              child: Text(
                                '${widget.privateHomes.bedrooms} Beds',
                                style: TextStyle(
                                  color: Colors.blueGrey[400],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        //baths
                        Row(
                          children: <Widget>[
                            Container(
                              height: 20.0,
                              child: FittedBox(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.bath,
                                    size: 16,
                                    color: Color(0xff1052CB),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 25.0),
                              child: Text(
                                '${widget.privateHomes.bathrooms} Baths',
                                style: TextStyle(
                                  color: Colors.blueGrey[400],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        //visitors
                        widget.privateHomes.visitors > 0
                            ? Row(
                                children: <Widget>[
                                  Container(
                                    height: 20.0,
                                    child: FittedBox(
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 10.0),
                                        child: Icon(
                                          Icons.people,
                                          size: 16,
                                          color: Color(0xff1052CB),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 25.0),
                                    child: Text(
                                      '${widget.privateHomes.visitors} Visitors',
                                      style: TextStyle(
                                        color: Colors.blueGrey[400],
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : SizedBox.shrink(),
                        //parking
                        widget.privateHomes.parking
                            ? Row(
                                children: <Widget>[
                                  Container(
                                    height: 20.0,
                                    child: FittedBox(
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 10.0),
                                        child: FaIcon(
                                          FontAwesomeIcons.parking,
                                          size: 16,
                                          color: Color(0xff1052CB),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 25.0),
                                    child: Text(
                                      'Parking',
                                      style: TextStyle(
                                        color: Colors.blueGrey[400],
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            //description
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //description title
                Container(
                  height: 22.0,
                  padding: EdgeInsets.only(left: 20.0),
                  child: FittedBox(
                    child: Text(
                      'Description',
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
                //description text
                Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 12.0),
                  child: Text(
                    'Feel at home wherever you choose to live with Blueground. You\'ll love this sophisticated feel at home with You\'ll love this sophisticated feel at home withFeel at home wherever you choose to live with Blueground. You\'ll love this sophisticated feel at home with You\'ll love this sophisticated feel at home with',
                    softWrap: true,
                    style: TextStyle(
                      height: 1.5,
                      color: Colors.blueGrey[400],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),

            //more photos
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
                        'More Photos',
                        style: TextStyle(
                          color: Colors.grey[900],
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),

                  //see all button
                  FittedBox(
                    child: Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: Container(
                        height: 23.0,
                        width: 55.0,
                        child: RawMaterialButton(
                          onPressed: () {},
                          child: FittedBox(
                            child: Text(
                              'VIEW ALL',
                              style: TextStyle(
                                color: Color(0xff1052CB),
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //carousel
            Container(
              height: 240.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: index == 0
                        ? EdgeInsets.only(left: 20.0, right: 7.5)
                        : EdgeInsets.only(
                            left: 7.5,
                            right: index == privateHomes.length - 1 ? 20.0 : 7.5,
                          ),
                    child: Container(
                      height: 200.0,
                      width: 170.0,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        height: 240.0,
                        width: 170.0,
                        child: Image.asset(
                          'assets/images/perfect-${privateHomes[index].imageNo}.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            padding: EdgeInsets.only(bottom: 10, top: 10.0, left: 20.0, right: 20.0),
            color: Colors.white,
            alignment: Alignment.center,
            height: 64.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //price
                Row(
                  children: <Widget>[
                    Container(
                      height: 25.0,
                      child: FittedBox(
                        child: Text(
                          '\$${widget.privateHomes.price} ',
                          style: TextStyle(
                            color: Colors.grey[900],
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 15.0,
                      child: FittedBox(
                        child: Text(
                          '/ Night',
                          style: TextStyle(
                            color: Colors.blueGrey[400],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                //book now
                FittedBox(
                  child: Container(
                    height: 48.0,
                    width: 156.0,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/Summary');
                      },
                      splashColor: Colors.transparent,
                      color: Color(0xff1052CB),
                      padding: EdgeInsets.symmetric(horizontal: 42.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                          style: BorderStyle.solid,
                          width: 2.0,
                          color: Color(0xff1052CB),
                        ),
                      ),
                      child: Container(
                        height: 16,
                        child: FittedBox(
                          child: Text(
                            'BOOK NOW',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
