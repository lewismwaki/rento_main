import 'package:flutter/material.dart';
import 'package:rento/models/icons-model.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectedIndex = 0;

  //icons
  Widget _buildIcon(int index) {
    return FittedBox(
      child: Container(
        width: 60.0,
        decoration: BoxDecoration(
          color: selectedIndex == index ? Color(0xffFF6944) : Color(0xffF6F8FA),
          shape: BoxShape.circle,
          border: Border.all(
            width: 3.0,
            color: selectedIndex == index ? Color(0xffFFDED6) : Colors.white,
          ),
        ),
        child: FittedBox(
          child: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              setState(() {
                selectedIndex = index;
              });
            },
            icon: Icon(
              categoryIcons[index],   
              color: selectedIndex == index ? Colors.white : Colors.blueGrey[400],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: categoryIcons.asMap().entries.map((MapEntry map) => _buildIcon(map.key)).toList(),
      ),
    );
  }
}

//
//-------------
//if ListView is used instead of Row on line 549, it should be wrapped in a container specifying its height in order for it to be visible
