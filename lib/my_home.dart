import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geo_locations_streams_example_cypher_zox/utilities/constants.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:developer' as developer;

// class ScreenOne extends StatefulWidget {
//   const ScreenOne({Key? key}) : super(key: key);
//
//   @override
//   State<ScreenOne> createState() => _ScreenOneState();
// }
//
// class _ScreenOneState extends State<ScreenOne> {
//   StreamController<double> streamControllerOne = StreamController<double>(
//     onPause: () => print('streamControllerOne: Paused'),
//     onResume: () => print('streamControllerOne: Resumed'),
//     onCancel: () => print('streamControllerOne: Cancelled'),
//     onListen: () => print('streamControllerOne: Listens'),
//   );
//   StreamController<double> streamControllerTwo = StreamController<double>(
//     onPause: () => print('streamControllerTwo: Paused'),
//     onResume: () => print('streamControllerTwo: Resumed'),
//     onCancel: () => print('streamControllerTwo: Cancelled'),
//     onListen: () => print('streamControllerTwo: Listens'),
//   );
//   StreamController<double> streamControllerThree = StreamController<double>(
//     onPause: () => print('streamControllerThree: Paused'),
//     onResume: () => print('streamControllerThree: Resumed'),
//     onCancel: () => print('streamControllerThree: Cancelled'),
//     onListen: () => print('streamControllerThree: Listens'),
//   );
//   StreamController<double> streamControllerFour = StreamController<double>(
//     onPause: () => print('streamControllerFour: Paused'),
//     onResume: () => print('streamControllerFour: Resumed'),
//     onCancel: () => print('streamControllerFour: Cancelled'),
//     onListen: () => print('streamControllerFour: Listens'),
//   );
//
//   startLocation() {
//     const LocationSettings locationSettings = LocationSettings(
//       accuracy: LocationAccuracy.best,
//     );
//     Geolocator.getPositionStream(locationSettings: locationSettings).listen((position) {
//       double speedValueRounded = 0.0;
//       double positionLatitudeValue = position.latitude;
//       positionLatitudeValue = (positionLatitudeValue).roundToDouble();
//       double positionLongitudeValue = position.longitude;
//       positionLongitudeValue = (positionLongitudeValue).roundToDouble();
//       double headingValueRounded = position.heading;
//       headingValueRounded = (headingValueRounded).roundToDouble();
//       int speedSelectionChoice = 2; //0 is m/s, 1 is k/h, 2 is mph and 3 is knots
//       switch (speedSelectionChoice) {
//         case 0:
//           {
//             double speedMeterPerSecondRounded = position.speed;
//             speedValueRounded = speedMeterPerSecondRounded = (speedMeterPerSecondRounded).roundToDouble();
//           }
//           break;
//         case 1:
//           {
//             double speedKilometerPerHourRounded = position.speed;
//             speedKilometerPerHourRounded = speedKilometerPerHourRounded * 3.6;
//             speedValueRounded = (speedKilometerPerHourRounded).roundToDouble();
//           }
//           break;
//         case 2:
//           {
//             double speedMilesPerHourRounded = position.speed;
//             speedMilesPerHourRounded = speedMilesPerHourRounded * 2.23694;
//             speedValueRounded = (speedMilesPerHourRounded).roundToDouble();
//           }
//           break;
//         case 3:
//           {
//             double speedKnotsPerHourRounded = position.speed;
//             speedKnotsPerHourRounded = speedKnotsPerHourRounded * 1.94384;
//             speedValueRounded = (speedKnotsPerHourRounded).roundToDouble();
//           }
//           break;
//         default:
//           {
//             speedValueRounded = 0.0;
//           }
//           break;
//       } //switch
//
//       streamControllerOne.sink.add(position.latitude);
//       streamControllerTwo.sink.add(position.longitude);
//       streamControllerThree.sink.add(headingValueRounded);
//       streamControllerFour.add(speedValueRounded);
//     });
//   } //startLocation
//
//   Center getDataFromStream(AsyncSnapshot<double> snapshot) {
//     var snapShotValue = snapshot.data;
//     // print('This is the snapshot data value: $snapShotValue');
//     developer.log('This is the developer log showing the snapshot data value: $snapShotValue');
//     return Center(
//       child: Text(
//         snapshot.data == null
//             ? 'No data:'
//             : snapshot.connectionState == ConnectionState.waiting
//                 ? 'Waiting on data'
//                 : snapshot.connectionState == ConnectionState.done
//                     ? 'Has this data'
//                     : snapshot.data.toString(),
//         style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
//       ),
//     );
//   } //Widget
//
//   @override
//   void initState() {
//     super.initState();
//     GeolocatorPlatform.instance.requestPermission();
//     startLocation();
//   }
//
//   @override
//   void dispose() {
//     streamControllerOne.close();
//     // locationSubscription.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     pauseLocation() async {
//       // locationSubscription.pause();
//     }
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(kDarkestBlue),
//         title: const FittedBox(
//           fit: BoxFit.scaleDown,
//           child: Text(
//             'Sailboat Racing Computer',
//             style: TextStyle(
//               fontFamily: kFontTypeForApp,
//               color: Color(kFontColor),
//               fontSize: kAppBarFontHeight,
//               fontWeight: FontWeight.bold,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//         ),
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('images/OceanBackgroundWithOutBackgroundImage.png'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 10.0),
//           child: ListView(
//             children: <Widget>[
//               Container(
//                 decoration: kStyleBoxDecoration,
//                 height: 100,
//                 child: StreamBuilder(
//                   stream: streamControllerOne.stream,
//                   builder: (context, snapshot) => Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           'This is the latitude:',
//                           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
//                         ),
//                       ),
//                       getDataFromStream(snapshot),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20.0,
//               ),
//               Container(
//                 decoration: kStyleBoxDecoration,
//                 height: 100,
//                 child: StreamBuilder(
//                   stream: streamControllerTwo.stream,
//                   builder: (context, snapshot) => Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           'This is the longitude:',
//                           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
//                         ),
//                       ),
//                       getDataFromStream(snapshot),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20.0,
//               ),
//               Container(
//                 decoration: kStyleBoxDecoration,
//                 height: 100,
//                 child: StreamBuilder(
//                   stream: streamControllerThree.stream,
//                   builder: (context, snapshot) => Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           'This is the heading:',
//                           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
//                         ),
//                       ),
//                       getDataFromStream(snapshot),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20.0,
//               ),
//               Container(
//                 decoration: kStyleBoxDecoration,
//                 height: 100,
//                 child: StreamBuilder(
//                   stream: streamControllerFour.stream,
//                   builder: (context, snapshot) => Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           'This is the speed:',
//                           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
//                         ),
//                       ),
//                       getDataFromStream(snapshot),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   } //Widget
// } //class
