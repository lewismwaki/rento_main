import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  //text field state
  String searchTerm = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
      child: Row(
        children: <Widget>[
          //filter
          Container(
            height: 42.0,
            width: 42.0,
            child: FlatButton(
              padding: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(),
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: () {},
              child: Container(
                height: 42.0,
                width: 42.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff1052CB),
                ),
                child: Icon(
                  Icons.filter_list,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          //search box
          Container(
            margin: EdgeInsets.only(left: 15.0),
            height: 42.0,
            width: 317.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Color(0xffE2ECFD),
            ),
            child: TextFormField(
              maxLines: 1,
              minLines: 1,
              cursorWidth: 2.0,
              obscureText: false,
              textAlign: TextAlign.left,
              cursorColor: Color(0xff1052CB),
              autofocus: false,
              enableInteractiveSelection: true,
              onChanged: (val) {
                setState(() => searchTerm = val);
              },
              textInputAction: TextInputAction.done,
              textAlignVertical: TextAlignVertical(y: 0.0),
              style: TextStyle(
                letterSpacing: 0.25,
                color: Color(0xff1052CB),
              ),
              decoration: InputDecoration(
                enabled: true,
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
                hintText: 'Search for Rentos',
                hintStyle: TextStyle(
                  color: Colors.blueGrey[400],
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                prefixIcon: Container(
                  height: 22.0,
                  width: 22.0,
                  child: FlatButton(
                    padding: EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(),
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onPressed: () {},
                    child: Container(
                      height: 22.0,
                      width: 22.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                      ),
                      child: Icon(
                        Icons.search,
                        color: Colors.blueGrey[400],
                        size: 26.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
