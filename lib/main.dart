import 'package:flutter/material.dart';
import 'screens/entries_list_screen.dart';
import 'screens/add_entry_screen.dart';
import 'screens/entry_detail_screen.dart';
import 'screens/entries_map_screen.dart';
import 'models/entry.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geo Journal',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const EntriesListScreen(),
        '/add': (context) => const AddEntryScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/detail') {
          final entry = settings.arguments as Entry;
          return MaterialPageRoute(
            builder: (context) => EntryDetailScreen(entry: entry),
          );
        }
        if (settings.name == '/map') {
          final entries = settings.arguments as List<Entry>;
          return MaterialPageRoute(
            builder: (context) => EntriesMapScreen(entries: entries),
          );
        }
        return null;
      },
    );
  }
}
