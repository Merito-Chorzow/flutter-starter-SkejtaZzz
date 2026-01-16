import 'package:flutter/material.dart';
import '../models/entry.dart';

class EntryDetailScreen extends StatelessWidget {
  final Entry entry;

  const EntryDetailScreen({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Szczegóły wpisu')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tytuł: ${entry.title}', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 10),
            Text('Opis: ${entry.description}'),
            const SizedBox(height: 10),
            if (entry.latitude != null && entry.longitude != null) ...[
              Text('Szerokość geograficzna: ${entry.latitude}'),
              Text('Długość geograficzna: ${entry.longitude}'),
            ],
            const SizedBox(height: 10),
            Text('Data utworzenia: ${entry.createdAt}'),
          ],
        ),
      ),
    );
  }
}
