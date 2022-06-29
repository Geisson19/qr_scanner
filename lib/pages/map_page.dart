import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_pj/models/scan_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)?.settings.arguments as ScanModel;

    Completer<GoogleMapController> _controller = Completer();

    MapType _currentMapType = MapType.normal;

    CameraPosition initPos = CameraPosition(
      target: scan.latlng!,
      zoom: 14.4746,
    );

    Set<Marker> _markers = {
      Marker(
        markerId: const MarkerId('init-location'),
        position: scan.latlng!,
        icon: BitmapDescriptor.defaultMarker,
      ),
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mapa"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.my_location),
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(
                CameraUpdate.newCameraPosition(
                  initPos,
                ),
              );
            },
          )
        ],
      ),
      body: GoogleMap(
        mapType: _currentMapType,
        markers: _markers,
        initialCameraPosition: initPos,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_currentMapType == MapType.normal) {
              _currentMapType = MapType.hybrid;
            } else {
              _currentMapType = MapType.normal;
            }
            setState(() {});
          },
          child: const Icon(Icons.layers)),
    );
  }
}
