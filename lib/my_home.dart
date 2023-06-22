import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StreamController<double> _speedAndHeadingStream = StreamController();
  late StreamSubscription<double> locationSubscription;
  late Color textColor = Colors.blue;

  @override
  void initState() {
    super.initState();
    GeolocatorPlatform.instance.requestPermission();
    startLocation();
  }

  @override
  void dispose() {
    _speedAndHeadingStream.close();
    locationSubscription.cancel();
    super.dispose();
  }

  startLocation() {
    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.best,
    );
    Geolocator.getPositionStream(locationSettings: locationSettings).listen((position) {
      double speedInMps = position.speed;
      double headingValue = position.heading;
      // double latitudeValue = position.latitude;
      // double longitudeValue = position.longitude;

      // _speedAndHeadingStream.sink.add(speedInMps);
      // _speedAndHeadingStream.sink.add(headingValue);
      _speedAndHeadingStream.sink.add(position.speed);
      // _speedAndHeadingStream.sink.add(longitudeValue);
      // print('This is the speed in mps: $speedInMps');
      // print('This is the latitude: $latitudeValue');
      // print('This is the longitude: $longitudeValue');
    });

    // final positionStream = Geolocator.getPositionStream().handleError((error) {
    // });
    // locationSubscription = positionStream.listen((Position position) {
    //   _speedAndHeadingStream.sink.add(position);
    //
    //   if (textColor == Colors.blue) {
    //     textColor = Colors.red;
    //   } else {
    //     textColor = Colors.blue;
    //   }
    // });
  } //startLocation

  @override
  Widget build(BuildContext context) {
    pauseLocation() async {
      locationSubscription.pause();
    }

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
          child: StreamBuilder(
            stream: _speedAndHeadingStream.stream,
            builder: (context, snapshot) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MaterialButton(
                  color: Colors.pink.withOpacity(0.3),
                  onPressed: () {
                    startLocation();
                  },
                  child: const Text("press here to know where I'm right now!"),
                ),
                const Spacer(),
                const Text(
                  'Current Location: ',
                  style: TextStyle(
                    fontSize: 21,
                  ),
                  textAlign: TextAlign.center,
                ),
                Center(
                  child: Text(
                    snapshot.data == null
                        ? 'No data:'
                        : snapshot.connectionState == ConnectionState.waiting
                            ? 'Waiting on data'
                            : snapshot.data.toString(),
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
                  onPressed: () {
                    pauseLocation();
                  },
                  child: const Text(
                    'Okay stop watching my location!',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
