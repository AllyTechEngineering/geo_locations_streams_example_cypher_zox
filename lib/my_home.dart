import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StreamController<double> streamController = StreamController<double>(
    onPause: () => print('SteamController: Paused'),
    onResume: () => print('SteamController: Resumed'),
    onCancel: () => print('SteamController: Cancelled'),
    onListen: () => print('SteamController: Listens'),
  );
  late Color textColor = Colors.blue;
  startLocation() {
    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.best,
    );
    Geolocator.getPositionStream(locationSettings: locationSettings).listen((position) {
      double speedInMps = position.speed;
      double headingValue = position.heading;
      double latitudeValue = position.latitude;
      double longitudeValue = position.longitude;

      // _speedAndHeadingStream.sink.add(speedInMps);
      // _speedAndHeadingStream.sink.add(headingValue);
      streamController.sink.add(position.latitude);
      // _speedAndHeadingStream.sink.add(longitudeValue);
      // print('This is the speed in mps: $speedInMps');
      // print('This is the latitude: $latitudeValue');
      // print('This is the longitude: $longitudeValue');
    });
  } //startLocation

  @override
  void initState() {
    super.initState();
    GeolocatorPlatform.instance.requestPermission();
    startLocation();
  }

  @override
  void dispose() {
    streamController.close();
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
          child: StreamBuilder(
            stream: streamController.stream,
            builder: (context, snapshot) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('This is the data:'),
                ),
                getDataFromStream(snapshot),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Center getDataFromStream(AsyncSnapshot<double> snapshot) {
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
} //class
