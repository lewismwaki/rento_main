import 'package:flutter/material.dart';
import 'package:rento/widgets/home-screen-widgets/sections/private-section/private-section-toggler.dart';

class PrivateSectionContainer extends StatefulWidget {
  @override
  _PrivateSectionContainerState createState() => _PrivateSectionContainerState();
}

class _PrivateSectionContainerState extends State<PrivateSectionContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffF1F1F3),
      ),
      child: PrivateSectionToggler(),
    );
  }
}
