import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/entry.dart';

class EntriesMapScreen extends StatefulWidget {
  final List<Entry> entries;

  const EntriesMapScreen({super.key, required this.entries});

  @override
  State<EntriesMapScreen> createState() => _EntriesMapScreenState();
}

class _EntriesMapScreenState extends State<EntriesMapScreen> {
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    final entriesWithLocation = widget.entries.where((entry) =>
      entry.latitude != null && entry.longitude != null
    ).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Mapa wpisów')),
      body: entriesWithLocation.isEmpty
          ? const Center(child: Text('Brak wpisów z lokalizacją.'))
          : GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
              initialCameraPosition: const CameraPosition(
                target: LatLng(52.2297, 21.0122), // Warszawa
                zoom: 10,
              ),
              markers: entriesWithLocation.map((entry) {
                return Marker(
                  markerId: MarkerId(entry.id),
                  position: LatLng(entry.latitude!, entry.longitude!),
                  infoWindow: InfoWindow(title: entry.title, snippet: entry.description),
                );
              }).toSet(),
            ),
    );
  }
}
