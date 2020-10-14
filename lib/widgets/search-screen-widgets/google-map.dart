import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Gmap extends StatefulWidget {
  @override
  _GmapState createState() => _GmapState();
}

class _GmapState extends State<Gmap> {
  GoogleMapController _mapController;

  //set map style
  void _setMapStyle() async {
    String style = await DefaultAssetBundle.of(context).loadString('assets/map-style.json');
    _mapController.setMapStyle(style);
  }

  //onMapCreated
  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;

    //set Map Style
    _setMapStyle();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = (screenSize.width);

    return Container(
      height: 768.0,
      width: width,
      child: GoogleMap(
        //TODO: IMPLEMENT ALL NECESSARY GOOGLE MAPS FEATURES

        onMapCreated: _onMapCreated,
        zoomControlsEnabled: false,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        initialCameraPosition: CameraPosition(
          target: LatLng(1.3992, 36.6805),
          zoom: 12.0,
        ),
      ),
    );
  }
}
