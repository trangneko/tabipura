import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TravelMap extends StatefulWidget {
  const TravelMap({super.key});

  @override
  State<TravelMap> createState() => _TravelMapState();
}

class _TravelMapState extends State<TravelMap> {
  late GoogleMapController mapController;
  final gyoEn = LatLng(35.68541074171516, 139.7100546033002);
  LatLng? currentPosition;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, don't continue accessing the position
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try asking for permissions again
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can continue accessing the position
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      currentPosition = LatLng(position.latitude, position.longitude);
    });

    // Update the map's camera position to the current location
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: currentPosition!,
          zoom: 14.0,
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void dispose() {
    super.dispose();
    mapController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: const CameraPosition(
        target: LatLng(35.6895, 139.6917), // Example coordinates (Tokyo)
        zoom: 14,
      ),
      mapType: MapType.normal,
      onMapCreated: _onMapCreated,
      markers: {
        Marker(
            markerId: MarkerId("sourceLocation"),
            icon: BitmapDescriptor.defaultMarker,
            position: gyoEn),
        if (currentPosition != null)
          Marker(
            markerId: MarkerId("currentLocation"),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueAzure),
            position: currentPosition!,
          ),
      },
    );
  }
}
