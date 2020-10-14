import 'package:flutter/material.dart';

class CustomDialog extends StatefulWidget {
  //dialog contents
  final String dialogTitle, dialogDescription, buttonText;
  final Icon icon;
  final double dialogHeight;
  CustomDialog(
      {this.buttonText, this.icon, this.dialogTitle, this.dialogDescription, this.dialogHeight});

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0.0,
      backgroundColor: Color(0xffE2ECFD).withAlpha(230),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.hardEdge,
      child: dialogContent(context),
    );
  }

  dialogContent(context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Container(
        height: widget.dialogHeight,
        width: 180.0,
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //dialog description
            Text(
              widget.dialogDescription,
              style: TextStyle(
                color: Colors.grey[900],
                fontWeight: FontWeight.w600,
              ),
            ),
            //close button
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 23.0,
                width: 23.0,
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(
                      color: Color(0xff1052CB),
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
