import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StreamController<double> streamControllerOne = StreamController<double>(
    onPause: () => print('streamControllerOne: Paused'),
    onResume: () => print('streamControllerOne: Resumed'),
    onCancel: () => print('streamControllerOne: Cancelled'),
    onListen: () => print('streamControllerOne: Listens'),
  );
  StreamController<double> streamControllerTwo = StreamController<double>(
    onPause: () => print('streamControllerTwo: Paused'),
    onResume: () => print('streamControllerTwo: Resumed'),
    onCancel: () => print('streamControllerTwo: Cancelled'),
    onListen: () => print('streamControllerTwo: Listens'),
  );
  StreamController<double> streamControllerThree = StreamController<double>(
    onPause: () => print('streamControllerThree: Paused'),
    onResume: () => print('streamControllerThree: Resumed'),
    onCancel: () => print('streamControllerThree: Cancelled'),
    onListen: () => print('streamControllerThree: Listens'),
  );
  StreamController<double> streamControllerFour = StreamController<double>(
    onPause: () => print('streamControllerFour: Paused'),
    onResume: () => print('streamControllerFour: Resumed'),
    onCancel: () => print('streamControllerFour: Cancelled'),
    onListen: () => print('streamControllerFour: Listens'),
  );

  startLocation() {
    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.best,
    );
    Geolocator.getPositionStream(locationSettings: locationSettings).listen((position) {
      double speedValueRounded = 0.0;
      double positionLatitudeValue = position.latitude;
      positionLatitudeValue = (positionLatitudeValue).roundToDouble();
      double positionLongitudeValue = position.longitude;
      positionLongitudeValue = (positionLongitudeValue).roundToDouble();
      double headingValueRounded = position.heading;
      headingValueRounded = (headingValueRounded).roundToDouble();
      int speedSelectionChoice = 2; //0 is m/s, 1 is k/h, 2 is mph and 3 is knots
      switch (speedSelectionChoice) {
        case 0:
          {
            double speedMeterPerSecondRounded = position.speed;
            speedValueRounded = speedMeterPerSecondRounded = (speedMeterPerSecondRounded).roundToDouble();
          }
          break;
        case 1:
          {
            double speedKilometerPerHourRounded = position.speed;
            speedKilometerPerHourRounded = speedKilometerPerHourRounded * 3.6;
            speedValueRounded = (speedKilometerPerHourRounded).roundToDouble();
          }
          break;
        case 2:
          {
            double speedMilesPerHourRounded = position.speed;
            speedMilesPerHourRounded = speedMilesPerHourRounded * 2.23694;
            speedValueRounded = (speedMilesPerHourRounded).roundToDouble();
          }
          break;
        case 3:
          {
            double speedKnotsPerHourRounded = position.speed;
            speedKnotsPerHourRounded = speedKnotsPerHourRounded * 1.94384;
            speedValueRounded = (speedKnotsPerHourRounded).roundToDouble();
          }
          break;
        default:
          {
            speedValueRounded = 0.0;
          }
          break;
      } //switch

      streamControllerOne.sink.add(position.latitude);
      streamControllerTwo.sink.add(position.longitude);
      streamControllerThree.sink.add(headingValueRounded);
      streamControllerFour.add(speedValueRounded);
    });
  } //startLocation

  Center getDataFromStream(AsyncSnapshot<double> snapshot) {
    var snapShotValue = snapshot.data;
    print('This is the snapshot data value: $snapShotValue');
    return Center(
      child: Text(
        snapshot.data == null
            ? 'No data:'
            : snapshot.connectionState == ConnectionState.waiting
                ? 'Waiting on data'
                : snapshot.connectionState == ConnectionState.done
                    ? 'Has this data'
                    : snapshot.data.toString(),
        style: TextStyle(color: Colors.black, fontSize: 18),
      ),
    );
  } //Widget

  @override
  void initState() {
    super.initState();
    GeolocatorPlatform.instance.requestPermission();
    startLocation();
  }

  @override
  void dispose() {
    streamControllerOne.close();
    // locationSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    pauseLocation() async {
      // locationSubscription.pause();
    }

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
          child: Column(
            children: [
              StreamBuilder(
                stream: streamControllerOne.stream,
                builder: (context, snapshot) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'This is the latitude:',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    getDataFromStream(snapshot),
                  ],
                ),
              ),
              StreamBuilder(
                stream: streamControllerTwo.stream,
                builder: (context, snapshot) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'This is the longitude:',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    getDataFromStream(snapshot),
                  ],
                ),
              ),
              StreamBuilder(
                stream: streamControllerThree.stream,
                builder: (context, snapshot) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'This is the heading:',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    getDataFromStream(snapshot),
                  ],
                ),
              ),
              StreamBuilder(
                stream: streamControllerFour.stream,
                builder: (context, snapshot) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'This is the speed:',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    getDataFromStream(snapshot),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  } //Widget
} //class
