import 'package:flutter/material.dart';
import 'package:rento/widgets/home-screen-widgets/sections/perfect-section/perfect-section-columns.dart';

import 'perfect-section-carousel.dart';

class PerfectSectionToggler extends StatefulWidget {
  @override
  _PerfectSectionTogglerState createState() => _PerfectSectionTogglerState();
}

class _PerfectSectionTogglerState extends State<PerfectSectionToggler> {
  bool showCarousel = true;
  void toggleViewStyle() {
    setState(() {
      return showCarousel = !showCarousel;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    if (showCarousel) {
      return PerfectSectionCarousel(toggleViewStyle: toggleViewStyle);
    } else {
      return PerfectSectionColumns(toggleViewStyle: toggleViewStyle);
    }
  }
}
