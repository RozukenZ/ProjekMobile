import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class CurrentLocationMap extends StatefulWidget {
  @override
  _CurrentLocationMapState createState() => _CurrentLocationMapState();
}

class _CurrentLocationMapState extends State<CurrentLocationMap> {
  Position? currentPosition;
  bool isLoading = true;
  final mapController = MapController();

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        setState(() {
          isLoading = false;
        });
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high
      );

      setState(() {
        currentPosition = position;
        isLoading = false;
      });

    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error getting location: $e');
    }
  }

  Future<void> _openInGoogleMaps() async {
    if (currentPosition == null) return;

    final url = 'https://www.google.com/maps/search/?api=1&query=${currentPosition!.latitude},${currentPosition!.longitude}';

    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Container(
        height: 200,
        color: Colors.grey[200],
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (currentPosition == null) {
      return Container(
        height: 200,
        color: Colors.grey[200],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_off, size: 40),
              const SizedBox(height: 8),
              const Text('Tidak dapat mengakses lokasi'),
              TextButton(
                onPressed: _getCurrentLocation,
                child: const Text('Coba Lagi'),
              ),
            ],
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: _openInGoogleMaps,
      child: SizedBox(
        height: 200,
        child: FlutterMap(
          options: MapOptions(
            initialCenter: LatLng(currentPosition!.latitude, currentPosition!.longitude),
            initialZoom: 15,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.anvayarencang.app',
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: LatLng(currentPosition!.latitude, currentPosition!.longitude),
                  child: const Icon(
                    Icons.location_pin,
                    color: Colors.red,
                    size: 40,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}