import 'package:flutter/material.dart';
import '../models/entry.dart';
import '../services/location_service.dart';

class AddEntryScreen extends StatefulWidget {
  const AddEntryScreen({super.key});

  @override
  State<AddEntryScreen> createState() => _AddEntryScreenState();
}

class _AddEntryScreenState extends State<AddEntryScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  double? _latitude;
  double? _longitude;

  Future<void> _getCurrentLocation() async {
    try {
      final position = await LocationService().getCurrentLocation();
      setState(() {
        _latitude = position.latitude;
        _longitude = position.longitude;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lokalizacja pobrana: ${position.latitude}, ${position.longitude}')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Błąd: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dodaj wpis')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Tytuł'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Podaj tytuł';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Opis'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Podaj opis';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              if (_latitude != null && _longitude != null)
                Text('Lokalizacja: $_latitude, $_longitude'),
              ElevatedButton(
                onPressed: _getCurrentLocation,
                child: const Text('Pobierz lokalizację'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newEntry = Entry(
                      id: DateTime.now().toString(),
                      title: _titleController.text,
                      description: _descriptionController.text,
                      latitude: _latitude,
                      longitude: _longitude,
                      createdAt: DateTime.now(),
                    );
                    Navigator.pop(context, newEntry);
                  }
                },
                child: const Text('Dodaj wpis'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
