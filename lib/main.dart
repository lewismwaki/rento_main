import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:mpesa_flutter_plugin/initializer.dart';
import 'package:rento/screens/authenticate/authenticate.dart';
import 'package:rento/screens/loading.dart';
import 'package:rento/screens/onboarding.dart';
import 'package:rento/screens/pages-container.dart';
import 'package:rento/screens/payment/summary.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

void main() {
  //mpesa
  MpesaFlutterPlugin.setConsumerKey('ZHAnjgrNxK1sGAEdl8c3ZfmADTevYGNP');
  MpesaFlutterPlugin.setConsumerSecret('WXCxL1GC6p3BN9Yw');
  //run app
  runApp(
    DevicePreview(
      enabled: false,
      builder: (BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          builder: (context, widget) => ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(context, widget),
            minWidth: 320,
            maxWidth: 2000,
            breakpoints: [
              ResponsiveBreakpoint.resize(320, name: 'SmallM'),
              ResponsiveBreakpoint.resize(384, name: 'MediumM'),
              ResponsiveBreakpoint.autoScale(414, name: MOBILE),
              ResponsiveBreakpoint.autoScale(512, scaleFactor: 1.15, name: 'LargeM'),
              ResponsiveBreakpoint.autoScale(640, name: TABLET),
              ResponsiveBreakpoint.autoScale(800, scaleFactor: 1.25, name: TABLET),
            ],
          ),
          initialRoute: '/Authenticate',
          routes: {
            '/Loading': (context) => Loading(),
            '/OnBoarding': (context) => OnBoarding(),
            '/Authenticate': (context) => Authenticate(),
            '/PagesContainer': (context) => PagesContainer(),
            '/Summary': (context) => Summary(),
          }, //
        );
      },
    ),
  );
}

/// Widths
///
/// 320 SmallM
/// 384 MediumM
/// 414 MOBILE
/// 512 LargeM
/// 640 TABLET
///
