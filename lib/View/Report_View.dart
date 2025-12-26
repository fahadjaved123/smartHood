import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_neighbourhood/res/Components/Drawer_menu_widget.dart';
import 'package:smart_neighbourhood/res/Components/Home_widget.dart';
import 'package:smart_neighbourhood/res/Constants/App_colors.dart';
import 'package:smart_neighbourhood/res/Constants/App_textStyle.dart';

class ReportView extends StatefulWidget {
  final VoidCallback opendrawer;
  final bool isopen;
  const ReportView({super.key, required this.isopen, required this.opendrawer});

  @override
  State<ReportView> createState() => _HomeState();
}

class _HomeState extends State<ReportView> {
  GoogleMapController? Controller;
  bool isloca = false;
  bool isMapReady = false;
  Set<Polyline> _polyline = {};
  void _onMapCreated(GoogleMapController controller) {
    Controller = controller;
    setState(() {
      isMapReady = true;
    });
    print('Map is ready');
  }

  TextEditingController searchcontroller = TextEditingController();
  List<LatLng> polylineCoordinates = [];
  static const CameraPosition cameraPosition =
      CameraPosition(target: LatLng(31.4273, 73.1166), zoom: 14.5);
  Set<Marker> _markers = {
    Marker(markerId: MarkerId(""), position: LatLng(31.4273, 73.1166)),
  };

  Future<Position> getUserCurrent() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stack) {
      print(error.toString());
    });
    return Geolocator.getCurrentPosition();
  }

  bool isloading = false;
  String? searchedLocationText;
  double? searchedLat;
  double? searchedLng;

  @override
  Widget build(BuildContext context) {
    Future<void> searchLocation(String query) async {
      if (!isMapReady || Controller == null) {
        print("Map is not ready yet.");
        return;
      }

      try {
        List<Location> locations = await locationFromAddress(query);

        if (locations.isNotEmpty) {
          double lat = locations[0].latitude;
          double lng = locations[0].longitude;
          searchedLocationText = query;
          searchedLat = lat;
          searchedLng = lng;
          print(searchedLocationText);
          print(searchedLng);
          LatLng searchedLatLng = LatLng(lat, lng);

          setState(() {
            _markers = {
              Marker(
                markerId: MarkerId("searchedLocation"),
                position: searchedLatLng,
                infoWindow: InfoWindow(title: query),
              ),
            };
          });

          Controller!.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: searchedLatLng,
                zoom: 14,
              ),
            ),
          );
        } else {
          print("No location found.");
        }
      } catch (e) {
        print("Error: $e");
      }
    }

    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(color: Appcolors.primaryColor),
          ),
          leading: DrawerMenuWidget(
            isdraweropen: widget.isopen,
            onPressed: widget.opendrawer,
          ),
          title: Text(
            "Reports",
            style: AppTextStyle.heading(25, fontWeight: FontWeight.w900),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              children: [
                Expanded(
                  child: GridView.count(
                    padding: const EdgeInsets.all(20),
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: [
                      HomeWidget(
                          image: "assets/Images/fire (1).png",
                          title: "Fire",
                          color: Colors.red,
                          onTap: () {}),
                      HomeWidget(
                          image: "assets/Images/law.png",
                          title: "Crime",
                          color: Colors.red,
                          onTap: () {}),
                      HomeWidget(
                          image: "assets/Images/patient.png",
                          title: "Accident",
                          color: Colors.red,
                          onTap: () {}),
                      HomeWidget(
                          image: "assets/Images/amplitude.png",
                          title: "EarthQuake",
                          color: Colors.red,
                          onTap: () {}),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Row(
                      children: [
                        /// TEXT FIELD
                        Expanded(
                          child: TextField(
                            controller: searchcontroller,
                            onSubmitted: (value) async {
                              searchedLocationText = value;
                              await searchLocation(value);
                            },
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.location_add),
                              border: InputBorder.none,
                              labelText: "Where is the Emergency?",
                            ),
                          ),
                        ),

                        const SizedBox(width: 8),

                        /// BUTTON
                        SizedBox(
                            height: 45,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red),
                              onPressed: () async {
                                try {
                                  final position = await getUserCurrent();

                                  _markers.add(
                                    Marker(
                                      markerId:
                                          const MarkerId("current_location"),
                                      position: LatLng(position.latitude,
                                          position.longitude),
                                      infoWindow: const InfoWindow(
                                        title: "My current position",
                                      ),
                                    ),
                                  );

                                  final cameraPosition = CameraPosition(
                                    target: LatLng(
                                        position.latitude, position.longitude),
                                    zoom: 14.4,
                                  );

                                  Controller!.animateCamera(
                                    CameraUpdate.newCameraPosition(
                                        cameraPosition),
                                  );

                                  setState(() {});
                                } catch (e) {
                                  debugPrint("Location error: $e");
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Iconsax.gps,
                                      color: Colors.white, size: 18),
                                  SizedBox(width: 6),
                                  Text(
                                    "My Location",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 250,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GoogleMap(
                        gestureRecognizers: <Factory<
                            OneSequenceGestureRecognizer>>{
                          Factory<OneSequenceGestureRecognizer>(
                            () => EagerGestureRecognizer(),
                          ),
                        },
                        mapType: MapType.normal,
                        rotateGesturesEnabled: true,
                        zoomGesturesEnabled: true,
                        trafficEnabled: false,
                        tiltGesturesEnabled: false,
                        scrollGesturesEnabled: true,
                        compassEnabled: true,
                        myLocationButtonEnabled: true,
                        zoomControlsEnabled: false,
                        mapToolbarEnabled: false,
                        markers: _markers,
                        polylines: _polyline,
                        initialCameraPosition: cameraPosition,
                        onMapCreated: _onMapCreated,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ));
  }
}
