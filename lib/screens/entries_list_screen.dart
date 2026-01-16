import 'package:flutter/material.dart';
import '../models/entry.dart';
import '../services/entry_service.dart';

class EntriesListScreen extends StatefulWidget {
  const EntriesListScreen({super.key});

  @override
  State<EntriesListScreen> createState() => _EntriesListScreenState();
}

class _EntriesListScreenState extends State<EntriesListScreen> {
  List<Entry> _entries = [];

  @override
  void initState() {
    super.initState();
    _loadEntries();
  }

  Future<void> _loadEntries() async {
    final entries = await EntryService.getEntries();
    setState(() {
      _entries = entries;
    });
  }

  Future<void> _saveEntries() async {
    await EntryService.saveEntries(_entries);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Geo Journal')),
      body: _entries.isEmpty
          ? const Center(child: Text('Brak wpisów. Dodaj pierwszy wpis!'))
          : ListView.builder(
              itemCount: _entries.length,
              itemBuilder: (context, index) {
                final entry = _entries[index];
                return Dismissible(
                  key: Key(entry.id),
                  background: Container(color: Colors.red),
                  onDismissed: (direction) {
                    setState(() {
                      _entries.removeAt(index);
                    });
                    _saveEntries();
                  },
                  child: Card(
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(entry.title),
                      subtitle: Text(entry.description),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/detail',
                          arguments: entry,
                        );
                      },
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () async {
              final newEntry = await Navigator.pushNamed(context, '/add') as Entry?;
              if (newEntry != null) {
                setState(() {
                  _entries.add(newEntry);
                });
                await _saveEntries();
              }
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/map',
                arguments: _entries,
              );
            },
            child: const Icon(Icons.map),
          ),
        ],
      ),
    );
  }
}
