import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/entry.dart';

class EntryService {
  static const _storageKey = 'entries';

  static Future<List<Entry>> getEntries() async {
    final prefs = await SharedPreferences.getInstance();
    final entriesJson = prefs.getStringList(_storageKey) ?? [];
    return entriesJson.map((entryJson) => Entry.fromJson(json.decode(entryJson))).toList();
  }

  static Future<void> saveEntries(List<Entry> entries) async {
    final prefs = await SharedPreferences.getInstance();
    final entriesJson = entries.map((entry) => json.encode(entry.toJson())).toList();
    await prefs.setStringList(_storageKey, entriesJson);
  }
}
