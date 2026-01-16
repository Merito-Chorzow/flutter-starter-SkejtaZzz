import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/entry.dart';

class ApiService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Entry>> fetchEntries() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) {
          return Entry(
            id: json['id'].toString(),
            title: json['title'] ?? 'Brak tytułu',
            description: json['body'] ?? 'Brak opisu',
            latitude: 52.2297, // Domyślna lokalizacja dla przykładu (Warszawa)
            longitude: 21.0122,
            createdAt: DateTime.now(),
          );
        }).toList();
      } else {
        throw Exception('Błąd pobierania wpisów: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Błąd połączenia z API: $e');
    }
  }

  Future<Entry> createEntry(Entry entry) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        body: jsonEncode({
          'title': entry.title,
          'body': entry.description,
          'userId': 1,
        }),
        headers: {'Content-type': 'application/json; charset=UTF-8'},
      );
      if (response.statusCode == 201) {
        final responseData = json.decode(response.body);
        return Entry(
          id: responseData['id'].toString(),
          title: entry.title,
          description: entry.description,
          latitude: entry.latitude,
          longitude: entry.longitude,
          createdAt: entry.createdAt,
        );
      } else {
        throw Exception('Błąd zapisywania wpisu: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Błąd połączenia z API: $e');
    }
  }
}
