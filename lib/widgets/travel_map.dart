import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tabipura/models/travel_plan.dart';

class TravelMap extends StatefulWidget {
  final List<Activity> activities; // Pass activities

  const TravelMap({super.key, required this.activities});

  @override
  State<TravelMap> createState() => _TravelMapState();
}

class _TravelMapState extends State<TravelMap> {
  late GoogleMapController mapController;
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
    _updateCameraPosition();
  }

  void _updateCameraPosition() {
    List<LatLng> positions = widget.activities
        .where((activity) => activity.coordinates != null)
        .map((activity) => activity.coordinates!)
        .toList();

    if (positions.isEmpty && currentPosition == null) {
      return;
    }

    if (currentPosition != null) {
      positions.add(currentPosition!);
    }

    LatLngBounds bounds = _createBounds(positions);

    CameraUpdate cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 50);
    mapController.animateCamera(cameraUpdate);
  }

  LatLngBounds _createBounds(List<LatLng> positions) {
    assert(positions.isNotEmpty);
    double south = positions.first.latitude;
    double north = positions.first.latitude;
    double west = positions.first.longitude;
    double east = positions.first.longitude;

    for (LatLng position in positions) {
      if (position.latitude < south) south = position.latitude;
      if (position.latitude > north) north = position.latitude;
      if (position.longitude < west) west = position.longitude;
      if (position.longitude > east) east = position.longitude;
    }

    return LatLngBounds(
      southwest: LatLng(south, west),
      northeast: LatLng(north, east),
    );
  }

  @override
  void dispose() {
    super.dispose();
    mapController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Set<Marker> markers = widget.activities
        .where((activity) => activity.coordinates != null)
        .map((activity) => Marker(
              markerId: MarkerId(activity.place),
              position: activity.coordinates!,
              infoWindow: InfoWindow(
                title: activity.place,
                snippet: activity.description,
              ),
              icon: BitmapDescriptor.defaultMarker,
              
            ))
        .toSet();

    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: (currentPosition != null)
            ? currentPosition!
            : const LatLng(35.6895, 139.6917), // Example coordinates (Shinjuku)
        zoom: 13,
      ),
      mapType: MapType.normal,
      onMapCreated: _onMapCreated,
      markers: markers,
    );
  }
}
