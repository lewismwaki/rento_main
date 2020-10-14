import 'package:flutter/material.dart';
import 'package:rento/widgets/home-screen-widgets/sections/private-section/private-section-columns.dart';

import 'private-section-carousel.dart';

class PrivateSectionToggler extends StatefulWidget {
  @override
  _PrivateSectionTogglerState createState() => _PrivateSectionTogglerState();
}

class _PrivateSectionTogglerState extends State<PrivateSectionToggler> {
  bool showCarousel = true;
  void toggleViewStyle() {
    setState(() {
      return showCarousel = !showCarousel;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showCarousel) {
      return PrivateSectionCarousel(toggleViewStyle: toggleViewStyle);
    } else {
      return PrivateSectionColumns(toggleViewStyle: toggleViewStyle);
    }
  }
}
