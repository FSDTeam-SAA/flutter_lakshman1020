import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class LocationPickerScreen extends StatefulWidget {
  final LatLng? initialLocation;

  const LocationPickerScreen({super.key, this.initialLocation});

  @override
  State<LocationPickerScreen> createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  late LatLng _picked;
  late MapController _mapController;
  String _address = "Tap on map to select a location";
  double _zoom = 13.0;
  bool _isLoadingLocation = false;

  @override
  void initState() {
    super.initState();
    _picked = widget.initialLocation ?? LatLng(23.8103, 90.4125); // Dhaka center
    _mapController = MapController();
    _getCurrentLocation(); // fetch current location on start
  }

  // --- Get Current GPS Location
  Future<void> _getCurrentLocation() async {
    setState(() => _isLoadingLocation = true);
    bool serviceEnabled;
    LocationPermission permission;

    // check permissions
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() => _isLoadingLocation = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Location services are disabled')),
      );
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() => _isLoadingLocation = false);
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() => _isLoadingLocation = false);
      return;
    }

    // get location
    final pos = await Geolocator.getCurrentPosition();
    setState(() {
      _picked = LatLng(pos.latitude, pos.longitude);
      _mapController.move(_picked, _zoom);
      _isLoadingLocation = false;
    });
    _updateAddress();
  }

  // --- Reverse Geocode (LatLng → Address)
  Future<void> _updateAddress() async {
    try {
      List<Placemark> placemarks =
      await placemarkFromCoordinates(_picked.latitude, _picked.longitude);
      if (placemarks.isNotEmpty) {
        final p = placemarks.first;
        setState(() {
          _address =
          "${p.name ?? ''}, ${p.subLocality ?? ''}, ${p.locality ?? ''}";
        });
      }
    } catch (e) {
      setState(() {
        _address = "Unknown location";
      });
    }
  }

  // --- Search Address Manually
  Future<void> _searchAddress(String query) async {
    try {
      final locations = await locationFromAddress(query);
      if (locations.isNotEmpty) {
        final loc = locations.first;
        setState(() {
          _picked = LatLng(loc.latitude, loc.longitude);
          _mapController.move(_picked, 15);
        });
        _updateAddress();
      }
    } catch (_) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("No location found")));
    }
  }

  // --- Suggested Locations
  final List<Map<String, dynamic>> _suggestions = [
    {"label": "Home", "lat": 23.777176, "lng": 90.399452},
    {"label": "Office", "lat": 23.796084, "lng": 90.414456},
    {"label": "Airport", "lat": 23.8467, "lng": 90.4000},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick location'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(_picked);
            },
            child: const Text('Select', style: TextStyle(color: Colors.white)),
          ),

        ],

      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: _picked,
              initialZoom: _zoom,
              onTap: (tapPosition, latlng) {
                setState(() {
                  _picked = latlng;
                });
                _updateAddress();
              },
            ),
            children: [
              TileLayer(
                urlTemplate:
                'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: _picked,
                    width: 50,
                    height: 50,
                    child: const Icon(Icons.location_on,
                        color: Colors.red, size: 50),
                  ),
                ],
              ),
            ],
          ),

          // --- Zoom Buttons
          Positioned(
            right: 10,
            bottom: 130,
            child: Column(
              children: [
                FloatingActionButton.small(
                  heroTag: "zoomIn",
                  onPressed: () {
                    _zoom += 1;
                    _mapController.move(_picked, _zoom);
                  },
                  child: const Icon(Icons.add),
                ),
                const SizedBox(height: 10),
                FloatingActionButton.small(
                  heroTag: "zoomOut",
                  onPressed: () {
                    _zoom -= 1;
                    _mapController.move(_picked, _zoom);
                  },
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(height: 10),
                FloatingActionButton.small(
                  heroTag: "locate",
                  onPressed: _getCurrentLocation,
                  child: const Icon(Icons.my_location),
                ),
              ],
            ),
          ),

          // --- Address Info Box
          Positioned(
            left: 16,
            right: 16,
            bottom: 20,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(color: Colors.black26, blurRadius: 4)
                ],
              ),
              child: Text(
                _isLoadingLocation
                    ? "Detecting current location..."
                    : _address,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ),

          // --- Search Bar
          Positioned(
            left: 12,
            right: 12,
            top: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(color: Colors.black26, blurRadius: 4),
                ],
              ),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "Search location...",
                  border: InputBorder.none,
                  icon: Icon(Icons.search),
                ),
                onSubmitted: _searchAddress,
              ),
            ),
          ),

          // --- Suggested Locations
          Positioned(
            top: 70,
            left: 12,
            right: 12,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _suggestions.map((s) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: ActionChip(
                      label: Text(s["label"]),
                      onPressed: () {
                        setState(() {
                          _picked = LatLng(s["lat"], s["lng"]);
                          _mapController.move(_picked, 15);
                        });
                        _updateAddress();
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
