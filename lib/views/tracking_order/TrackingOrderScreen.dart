import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_fd/constants.dart';
import 'package:project_fd/views/tracking_order/MapUtils.dart';
import 'package:project_fd/views/tracking_order/TrackingDetail.dart';

class TrackingOrderScreen extends StatefulWidget {
  TrackingOrderScreen(
      {super.key, this.orderId, this.myAddress, this.estimatedMinute = 20});

  final String? myAddress;
  final int? orderId;
  final int? estimatedMinute;

  @override
  State<TrackingOrderScreen> createState() => TrackingOrderScreenState();
}

class TrackingOrderScreenState extends State<TrackingOrderScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: MapUtils.getCurrentPosition(),
            builder: (context, result) {
              if (result.data != null) {
                LatLng location = LatLng(result.data?.latitude ?? 0.0,
                    result.data?.longitude ?? 0.0);
                CameraPosition position = CameraPosition(
                  target: location,
                  zoom: 16,
                );
                return GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: position,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                    Future.delayed(Duration(milliseconds: 300), () {
                      _zoomToSeeBothMarker();
                    });
                  },
                  zoomControlsEnabled: false,
                  markers: {
                    Marker(
                      markerId: MarkerId('Driver'),
                      position: LatLng(
                          location.latitude + .01, location.longitude + .01),
                      onTap: () {
                        _goToLocation(LatLng(
                            location.latitude + .01, location.longitude + .01));
                      },
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueGreen),
                    ),
                    Marker(
                      markerId: MarkerId('Current'),
                      position: location,
                      onTap: () {
                        _goToLocation(location);
                      },
                    ),
                  },
                );
              } else {
                return Container();
              }
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: FloatingActionButton(
                      shape: CircleBorder(),
                      backgroundColor: green,
                      foregroundColor: white,
                      onPressed: () {
                        _zoomToSeeBothMarker();
                      },
                      child: Icon(Icons.delivery_dining_outlined),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: FloatingActionButton(
                      shape: CircleBorder(),
                      backgroundColor: green,
                      foregroundColor: white,
                      onPressed: () {
                        MapUtils.getCurrentPosition().then((value) {
                          LatLng location =
                              LatLng(value.latitude, value.longitude);
                          _goToLocation(location);
                        });
                      },
                      child: Icon(Icons.location_pin),
                    ),
                  ),
                  TrackingDetailContainer(
                    orderId: widget.orderId,
                    myAddress: widget.myAddress,
                    estimatedMinute: widget.estimatedMinute,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
            child: FloatingActionButton(
              shape: CircleBorder(),
              backgroundColor: white,
              foregroundColor: green,
              onPressed: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _goToLocation(LatLng location) async {
    final GoogleMapController controller = await _controller.future;
    CameraPosition position = CameraPosition(target: location, zoom: 16);
    await controller.animateCamera(CameraUpdate.newCameraPosition(position));
  }

  Future<void> _zoomToSeeBothMarker() async {
    var value = await MapUtils.getCurrentPosition();
    var location = LatLng(value.latitude, value.longitude);
    List<LatLng> _markers = [
      location,
      LatLng(location.latitude + 0.01, location.longitude + 0.01),
    ];
    var bound = MapUtils.boundsFromLatLngList(_markers);
    var controller = await _controller.future;
    return controller.animateCamera(CameraUpdate.newLatLngBounds(bound, 50));
  }
}
