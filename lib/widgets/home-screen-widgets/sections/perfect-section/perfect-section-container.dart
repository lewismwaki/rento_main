import 'package:flutter/material.dart';
import 'package:rento/widgets/home-screen-widgets/sections/perfect-section/perfect-section-toggler.dart';

class PerfectSectionContainer extends StatefulWidget {
  @override
  _PerfectSectionContainerState createState() => _PerfectSectionContainerState();
}

class _PerfectSectionContainerState extends State<PerfectSectionContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Color(0xffF1F1F3)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.repeated,
        ),
      ),
      child: PerfectSectionToggler(),
    );
  }
}
