import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:permission_handler/permission_handler.dart';

class UserLocationMap extends StatefulWidget {
  @override
  _UserLocationMapState createState() => _UserLocationMapState();
}

class _UserLocationMapState extends State<UserLocationMap> {
  late MapController _mapController;

  @override
  void initState() {
    super.initState();
    _mapController = MapController(
      initMapWithUserPosition: const UserTrackingOption(
        enableTracking: true,
      ),
    );
    _initializeMap();
  }

  Future<void> _initializeMap() async {
    var permissionStatus = await Permission.location.request();

    if (permissionStatus.isGranted) {
      await _trackUserLocation();
    } else {
      print("Permissão de localização negada.");
    }
  }

  Future<void> _trackUserLocation() async {
    try {
      await _mapController.enableTracking(enableStopFollow: false);

      GeoPoint userLocation = await _mapController.myLocation();

      await _mapController.addMarker(
        userLocation,
        markerIcon: const MarkerIcon(
          icon: Icon(
            Icons.star,
            color: Colors.amber,
            size: 48,
          ),
        ),
      );

      await _mapController.goToLocation(userLocation);
    } catch (e) {
      print("Erro ao rastrear a localização do usuário: $e");
    }
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OSMFlutter(
        controller: _mapController,
        osmOption: const OSMOption(
          showZoomController: true,
          zoomOption: ZoomOption(
            initZoom: 17,
            maxZoomLevel: 19,
          ),
        ),
      ),
    );
  }
}
