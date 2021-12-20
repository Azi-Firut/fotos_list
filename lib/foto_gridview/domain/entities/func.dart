import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import '../../data/data_sources/item_data.dart';
import 'package:http/http.dart' as http;

void timer() {
  const Duration(seconds: 3);
  log('timer');
}

Future<List<FotoData>> getFoto() async {
  final response = await http.get(
    Uri.parse('https://608bd4239f42b20017c3cee6.mockapi.io/photos'),
  );

  if (response.statusCode == 200) {
    Iterable list = json.decode(response.body);
    var items = list.map((item) => FotoData.fromMap(item)).toList();
    log("statusCode == 200");
    log("$items");
    return items;
  } else {
    throw Exception('Failed to load');
  }
}
