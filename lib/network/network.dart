import 'package:reader_tracker/models/book.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  static const _baseUrl = 'https://www.googleapis.com/books/v1/volumes';
  Future<List<Book>> searchBooks(String query) async {
    var url = Uri.parse("$_baseUrl?q=$query");
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data['items'] != null && data['items'] is List) {
        List<Book> books =
            (data['items'] as List<dynamic>)
                .map((book) => Book.fromJson(book as Map<String, dynamic>))
                .toList();
        return books;
      } else {
        return [];
      }
      // print(data['totalItems']);
    } else {
      throw Exception('Failed To Load');
    }
  }
}
