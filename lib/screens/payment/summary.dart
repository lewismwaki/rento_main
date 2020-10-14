import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icomoon_icons/flutter_icomoon_icons.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mpesa_flutter_plugin/initializer.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';
import 'package:rento/models/dates-model.dart';
import 'package:rento/widgets/custom-dialog.dart';

class Summary extends StatefulWidget {
  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  //select check in date selection
  DateTime selectedCheckInDate = DateTime.now();
  Future<Null> _selectCheckInDate(BuildContext context) async {
    DateTime newCheckInDateTime = await showRoundedDatePicker(
      context: context,

      //disable previous dates
      firstDate: DateTime.utc(
        DateTime.now().year.toInt(),
        DateTime.now().month.toInt(),
        DateTime.now().day.toInt() - 1,
        0,
        0,
        0,
      ),

      //last date
      lastDate: DateTime(DateTime.now().year + 1),

      //set selected
      initialDate: selectedCheckInDate,

      //on selecting past day
      onTapDay: (DateTime dateTime, bool available) {
        if (!available) {
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext dialogContext) => CustomDialog(
              dialogDescription:
                  'You can not select a date that has already passed. Pick a date from today forward!',
              dialogHeight: 80.0,
            ),
          );
        }
        return available;
      },

      //styling
      imageHeader: AssetImage('assets/images/perfect-1.jpg'),
      borderRadius: 16.0,
      barrierDismissible: false,
      customWeekDays: ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"],
      theme: ThemeData(
        dialogBackgroundColor: Colors.white,
        disabledColor: Colors.blueGrey[400],
        accentColor: Color(0xff1052CB),
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Color(0xff1052CB),
            fontWeight: FontWeight.w500,
            letterSpacing: 0.25,
          ),
          caption: TextStyle(
            color: Colors.grey[900],
            fontWeight: FontWeight.w500,
            letterSpacing: 0.25,
          ),
        ),
        accentTextTheme: TextTheme(
          headline6: TextStyle(
            color: Color(0xff1052CB),
          ),
        ),
      ),
    );

    if (newCheckInDateTime != null &&
        newCheckInDateTime != selectedCheckInDate &&
        selectedCheckOutDate !=
            DateTime.now().add(
              Duration(days: ((selectedCheckInDate.difference(DateTime.now()).inDays + 1))),
            ))
      setState(() {
        selectedCheckOutDate = DateTime.now()
            .add(Duration(days: ((selectedCheckInDate.difference(DateTime.now()).inDays + 1))));
        selectedCheckInDate = newCheckInDateTime;
      });
  }

  //select check out date selection
  DateTime selectedCheckOutDate = DateTime.now();
  Future<Null> _selectCheckOutDate(BuildContext context) async {
    DateTime newCheckOutDateTime = await showRoundedDatePicker(
      context: context,

      //disable previous dates
      firstDate: DateTime.utc(
        selectedCheckInDate.year,
        selectedCheckInDate.month,
        DateTime.now()
            .add(Duration(days: (selectedCheckInDate.difference(DateTime.now()).inDays)))
            .day
            .toInt(),
        0,
        0,
        0,
      ),

      lastDate: DateTime(DateTime.now().year + 1),

      //set selected
      initialDate: DateTime.now()
          .add(Duration(days: ((selectedCheckInDate.difference(DateTime.now()).inDays + 1)))),

      //on selecting past day
      onTapDay: (DateTime dateTime, bool available) {
        if (!available) {
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext dialogContext) => CustomDialog(
              dialogDescription:
                  'You can not select a date that has already passed. Pick a date from today forward!',
              dialogHeight: 80.0,
            ),
          );
        }
        return available;
      },

      //styling
      imageHeader: AssetImage('assets/images/perfect-1.jpg'),
      borderRadius: 16.0,
      barrierDismissible: false,
      customWeekDays: ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"],
      theme: ThemeData(
        dialogBackgroundColor: Colors.white,
        disabledColor: Colors.blueGrey[400],
        accentColor: Color(0xff1052CB),
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Color(0xff1052CB),
            fontWeight: FontWeight.w500,
            letterSpacing: 0.25,
          ),
          caption: TextStyle(
            color: Colors.grey[900],
            fontWeight: FontWeight.w500,
            letterSpacing: 0.25,
          ),
        ),
        accentTextTheme: TextTheme(
          headline6: TextStyle(
            color: Color(0xff1052CB),
          ),
        ),
      ),
    );

    if (newCheckOutDateTime != null && newCheckOutDateTime != selectedCheckOutDate)
      setState(() {
        selectedCheckOutDate = newCheckOutDateTime;
      });
  }

  //initialise mpesa payment
  Future<void> payWithMpesa({String userPhoneNo, String amount}) async {
    dynamic transactionInitialisation;
    try {
      transactionInitialisation = await MpesaFlutterPlugin.initializeMpesaSTKPush(
        businessShortCode: "174379",
        transactionType: TransactionType.CustomerPayBillOnline,
        amount: double.parse(amount),
        partyA: userPhoneNo,
        partyB: "174379",
        callBackURL: Uri.parse('https://sandbox.safaricom.co.ke/'),
        accountReference: 'rento',
        phoneNumber: userPhoneNo,
        transactionDesc: "Purchase",
        baseUri: Uri.parse('https://sandbox.safaricom.co.ke/'),
        passKey: "bfb279f9aa9bdbcf158e97dd71a467cd2e0x893059b10f7836b72ada1ed2c919",
      );
      print("Transaction Result: " + transactionInitialisation.toString());
      return transactionInitialisation;
    } catch (e) {
      print("Exception: " + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //back icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 20.0, left: 20.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 42.0,
                            height: 42.0,
                            decoration: BoxDecoration(
                              color: Color(0xff1052CB),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.chevron_left,
                              size: 26.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                //name
                Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 30.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        IcoMoonIcons.home,
                        color: Colors.blueGrey[400],
                        size: 17.0,
                      ),
                      Container(
                        height: 24.0,
                        child: FittedBox(
                          child: Text(
                            '  Astounds Apartments',
                            style: TextStyle(
                              color: Colors.grey[900],
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //dates info
                Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 10.0),
                  child: Row(
                    children: <Widget>[
                      //date icon
                      FaIcon(
                        FontAwesomeIcons.calendarAlt,
                        color: Colors.blueGrey[400],
                        size: 17.0,
                      ),
                      //from
                      Container(
                        height: 16.0,
                        child: FittedBox(
                          child: Text(
                            '   from ',
                            style: TextStyle(
                              color: Colors.blueGrey[400],
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.25,
                            ),
                          ),
                        ),
                      ),
                      //date 1
                      GestureDetector(
                        onTap: () => _selectCheckInDate(context),
                        child: Container(
                          height: 17.0,
                          child: FittedBox(
                            child: Text(
                              "${weekDaysList[selectedCheckInDate.weekday].weekDayName} ${selectedCheckInDate.day} ${monthsList[selectedCheckInDate.month.toInt()].monthName} ${selectedCheckInDate.year}  ",
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                      //to
                      Container(
                        height: 16.0,
                        child: FittedBox(
                          child: Text(
                            'to ',
                            style: TextStyle(
                              color: Colors.blueGrey[400],
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.25,
                            ),
                          ),
                        ),
                      ),
                      //date 2
                      GestureDetector(
                        onTap: () => _selectCheckOutDate(context),
                        child: Container(
                          height: 17.0,
                          child: FittedBox(
                            child: Text(
                              " ${weekDaysList[selectedCheckOutDate.weekday].weekDayName} ${selectedCheckOutDate.day} ${monthsList[selectedCheckOutDate.month.toInt()].monthName} ${selectedCheckOutDate.year}",
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //location
                Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 10.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        IcoMoonIcons.location2,
                        color: Colors.blueGrey[400],
                        size: 17.0,
                      ),
                      Container(
                        height: 16.0,
                        child: FittedBox(
                          child: Text(
                            '  Madrid Street 10',
                            style: TextStyle(
                              color: Colors.blueGrey[400],
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //check in check out
                Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 30.0),
                  child: Row(
                    children: <Widget>[
                      //check in & check out dates
                      Column(
                        children: <Widget>[
                          Container(
                            width: 90.0,
                            height: 180.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xffE2ECFD),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                //check in date picker
                                GestureDetector(
                                  onTap: () => _selectCheckInDate(context),
                                  child: Container(
                                    width: 62.5,
                                    height: 62.5,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),

                                    //date
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        //month
                                        Container(
                                          height: 16.0,
                                          child: FittedBox(
                                            child: Text(
                                              "${monthsList[selectedCheckInDate.month.toInt()].monthName}",
                                              style: TextStyle(
                                                color: Colors.blueGrey[400],
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 0.25,
                                              ),
                                            ),
                                          ),
                                        ),

                                        SizedBox(height: 3.0),

                                        //date
                                        Container(
                                          height: 17.0,
                                          child: FittedBox(
                                            child: Text(
                                              "${selectedCheckInDate.day.toInt()}",
                                              style: TextStyle(
                                                color: Colors.grey[900],
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                //check out date picker
                                GestureDetector(
                                  onTap: () {
                                    _selectCheckOutDate(context);
                                  },
                                  child: Container(
                                    width: 62.5,
                                    height: 62.5,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          height: 16.0,
                                          child: FittedBox(
                                            child: Text(
                                              "${monthsList[selectedCheckOutDate.month.toInt()].monthName}",
                                              style: TextStyle(
                                                color: Colors.blueGrey[400],
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 0.25,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 3.0),
                                        Container(
                                          height: 17.0,
                                          child: FittedBox(
                                            child: Text(
                                              "${selectedCheckOutDate.day.toInt()}",
                                              style: TextStyle(
                                                color: Colors.grey[900],
                                                fontWeight: FontWeight.w700,
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
                          )
                        ],
                      ),

                      //check in & check out times
                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Container(
                          height: 180.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              //check in
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    height: 16.0,
                                    child: FittedBox(
                                      child: Text(
                                        '${weekDaysList[selectedCheckInDate.weekday.toInt()].fullWeekDayName} check in',
                                        style: TextStyle(
                                          color: Colors.blueGrey[400],
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0.25,
                                        ),
                                      ),
                                    ),
                                  ),
                                  //check in date
                                  SizedBox(height: 8.0),
                                  Container(
                                    height: 19.0,
                                    child: FittedBox(
                                      child: Text(
                                        '1:00 PM - 7:15 PM',
                                        style: TextStyle(
                                          color: Colors.grey[900],
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              //check-out
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    height: 16.0,
                                    child: FittedBox(
                                      child: Text(
                                        '${weekDaysList[selectedCheckOutDate.weekday.toInt()].fullWeekDayName} check out',
                                        style: TextStyle(
                                          color: Colors.blueGrey[400],
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0.25,
                                        ),
                                      ),
                                    ),
                                  ),
                                  //check in date
                                  SizedBox(height: 8.0),
                                  Container(
                                    height: 19.0,
                                    child: FittedBox(
                                      child: Text(
                                        '8:30 AM - 10:45 AM',
                                        style: TextStyle(
                                          color: Colors.grey[900],
                                          fontWeight: FontWeight.w700,
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
                ),

                //fee and tax details title
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0, top: 30.0, left: 20.0),
                  child: Row(
                    children: <Widget>[
                      FaIcon(
                        FontAwesomeIcons.receipt,
                        color: Colors.blueGrey[400],
                        size: 17.0,
                      ),
                      Container(
                        height: 24.0,
                        child: FittedBox(
                          child: Text(
                            ' Fee & Tax Details',
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
                ),

                //items
                Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      //item 1
                      Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            //item
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                //price
                                Container(
                                  height: 19.0,
                                  child: FittedBox(
                                    child: Text(
                                      '\$122',
                                      style: TextStyle(
                                        color: Colors.grey[900],
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ),
                                //nights
                                Container(
                                  height: 16.0,
                                  child: FittedBox(
                                    child: Text(
                                      selectedCheckOutDate.difference(selectedCheckInDate).inDays >
                                              0
                                          ? ' x ${selectedCheckOutDate.difference(selectedCheckInDate).inDays} Nights'
                                          : ' x 0 Nights',
                                      style: TextStyle(
                                        color: Colors.blueGrey[400],
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.25,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            //total
                            Container(
                              height: 21.0,
                              child: FittedBox(
                                child: Text(
                                  selectedCheckOutDate.difference(selectedCheckInDate).inDays > 0
                                      ? '\$${selectedCheckOutDate.difference(selectedCheckInDate).inDays * 122}'
                                      : '\$0',
                                  style: TextStyle(
                                    color: Colors.grey[900],
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //item 3
                      Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            //item
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                //price
                                Container(
                                  height: 17.0,
                                  child: FittedBox(
                                    child: Text(
                                      'Services charges',
                                      style: TextStyle(
                                        color: Colors.grey[900],
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: 0.25,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            //total
                            Container(
                              height: 21.0,
                              child: FittedBox(
                                child: Text(
                                  selectedCheckOutDate.difference(selectedCheckInDate).inDays > 0
                                      ? '\$25'
                                      : '-',
                                  style: TextStyle(
                                    color: Colors.grey[900],
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //item 4
                      Padding(
                        padding: EdgeInsets.only(bottom: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            //item
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                //price
                                Container(
                                  height: 19.0,
                                  child: FittedBox(
                                    child: Text(
                                      '16\%',
                                      style: TextStyle(
                                        color: Colors.grey[900],
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ),
                                //nights
                                Container(
                                  height: 16.0,
                                  child: FittedBox(
                                    child: Text(
                                      ' x V.A.T',
                                      style: TextStyle(
                                        color: Colors.blueGrey[400],
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.25,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            //total
                            Container(
                              height: 21.0,
                              child: FittedBox(
                                child: Text(
                                  selectedCheckOutDate.difference(selectedCheckInDate).inDays > 0
                                      ? '\$80'
                                      : '-',
                                  style: TextStyle(
                                    color: Colors.grey[900],
                                    fontWeight: FontWeight.w800,
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

                //separator
                Padding(
                  padding: EdgeInsets.only(bottom: 15.0, right: 20.0, left: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FittedBox(
                        child: Container(
                          width: 374.0,
                          height: 1.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            color: Color(0xff1052CB),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //total
                Padding(
                  padding: EdgeInsets.only(bottom: 15.0, right: 20.0, left: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      //item
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          //price
                          Container(
                            height: 17.0,
                            child: FittedBox(
                              child: Text(
                                'Total',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 0.25,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      //total
                      Container(
                        height: 24.0,
                        child: FittedBox(
                          child: Text(
                            selectedCheckOutDate.difference(selectedCheckInDate).inDays > 0
                                ? '\$1436'
                                : '-',
                            style: TextStyle(
                              color: Colors.grey[900],
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),

        //next step
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: Container(
              color: Colors.white,
              alignment: Alignment.center,
              height: 64.0,
              child: FittedBox(
                child: Container(
                  height: 48.0,
                  width: 374.0,
                  child: FlatButton(
                    splashColor: Colors.transparent,
                    color: Color(0xff1052CB),
                    padding: EdgeInsets.symmetric(horizontal: 42.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(
                        style: BorderStyle.solid,
                        width: 2.0,
                        color: Color(0xff1052CB),
                      ),
                    ),

                    onPressed: () {
                      //choose payment sheet
                      selectedCheckOutDate.difference(selectedCheckInDate).inDays <= 0
                          ? showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (BuildContext dialogContext) => CustomDialog(
                                dialogHeight: 80.0,
                                dialogDescription:
                                    'Please select a valid check out date. Your check out date must be on or after ${DateFormat.yMMMd().format(selectedCheckInDate)}',
                              ),
                            )
                          : showModalBottomSheet(
                              clipBehavior: Clip.hardEdge,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24.0),
                                  topRight: Radius.circular(24.0),
                                ),
                              ),
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: 300.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 22.0, right: 22.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        //handle
                                        Padding(
                                          padding: EdgeInsets.only(top: 18.0, bottom: 16.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                width: 40.0,
                                                height: 5.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xffCBDCFB),
//                                                  color: Color(0xffA5A5A5),
                                                  borderRadius: BorderRadius.circular(100),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        //choose payment method
                                        Row(
                                          children: <Widget>[
                                            FaIcon(
                                              FontAwesomeIcons.moneyCheck,
                                              color: Colors.blueGrey[400],
                                              size: 17.0,
                                            ),
                                            Container(
                                              height: 24.0,
                                              child: FittedBox(
                                                child: Text(
                                                  ' Choose Payment Method',
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

                                        //add other payment method
                                        Padding(
                                          padding: EdgeInsets.only(top: 20.0),
                                          child: Container(
                                            height: 48.0,
                                            child: FlatButton(
                                              onPressed: () {},
                                              splashColor: Colors.transparent,
                                              highlightColor: Colors.transparent,
                                              color: Color(0xffE2ECFD),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8.0),
                                                side: BorderSide(
                                                  style: BorderStyle.solid,
                                                  width: 2.0,
                                                  color: Color(0xffE2ECFD),
                                                ),
                                              ),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.add,
                                                    size: 20.0,
                                                    color: Colors.blueGrey[400],
                                                  ),
                                                  Container(
                                                    height: 18.0,
                                                    child: FittedBox(
                                                      child: Text(
                                                        '  Add a credit card',
                                                        style: TextStyle(
                                                          color: Colors.blueGrey[400],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),

                                        //pay with lipa na Mpesa
                                        Padding(
                                          padding: EdgeInsets.only(top: 18.0),
                                          child: Container(
                                            height: 48.0,
                                            child: FlatButton(
                                              onPressed: () {
                                                payWithMpesa(
                                                  amount: '1',
                                                  userPhoneNo: '254745943954',
                                                );
                                              },
                                              splashColor: Colors.transparent,
                                              color: Color(0xff1052CB),
                                              highlightColor: Colors.transparent,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8),
                                                side: BorderSide(
                                                  style: BorderStyle.solid,
                                                  width: 2.0,
                                                  color: Color(0xff1052CB),
                                                ),
                                              ),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: <Widget>[
                                                  FaIcon(
                                                    FontAwesomeIcons.ccMastercard,
                                                    size: 20.0,
                                                    color: Colors.white,
                                                  ),
                                                  Container(
                                                    height: 18.0,
                                                    child: FittedBox(
                                                      child: Text(
                                                        '  Pay with Lipa na M-Pesa',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),

                                        //apple & google pay
                                        Padding(
                                          padding: EdgeInsets.only(top: 18.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              //apple pay
                                              Container(
                                                height: 48.0,
                                                width: 132.0,
                                                child: FlatButton(
                                                  onPressed: () {
                                                    //TODO: IMPLEMENT APPLE PAY API FOR BOTH SCREENS
                                                  },
                                                  splashColor: Colors.transparent,
                                                  highlightColor: Colors.transparent,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(100),
                                                    side: BorderSide(
                                                      style: BorderStyle.solid,
                                                      width: 2.0,
                                                      color: Colors.blueGrey[400],
                                                    ),
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      FaIcon(
                                                        FontAwesomeIcons.apple,
                                                        size: 20.0,
                                                      ),
                                                      Container(
                                                        height: 18.0,
                                                        child: FittedBox(
                                                          child: Text(
                                                            ' Pay',
                                                            style: TextStyle(
                                                              color: Colors.grey[900],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),

                                              //google pay
                                              Container(
                                                height: 48.0,
                                                width: 132.0,
                                                child: FlatButton(
                                                  onPressed: () {
                                                    //TODO: IMPLEMENT APPLE PAY API FOR BOTH SCREENS
                                                  },
                                                  splashColor: Colors.transparent,
                                                  highlightColor: Colors.transparent,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(100),
                                                    side: BorderSide(
                                                      style: BorderStyle.solid,
                                                      width: 2.0,
                                                      color: Colors.blueGrey[400],
                                                    ),
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      FaIcon(
                                                        FontAwesomeIcons.google,
                                                        size: 17.0,
                                                      ),
                                                      Container(
                                                        height: 18.0,
                                                        child: FittedBox(
                                                          child: Text(
                                                            ' Pay',
                                                            style: TextStyle(
                                                              color: Colors.grey[900],
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
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                    },

                    //next step
                    child: Container(
                      height: 16,
                      child: FittedBox(
                        child: Text(
                          'NEXT STEP',
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
            ),
          ),
        ),
      ),
    );
  }
}
