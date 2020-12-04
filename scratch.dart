import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  final response = await http.get(
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=7962813510be466b82511b87e57c4574');

  if (response.statusCode == 200) {
    Map<String, dynamic> decodedData = json.decode(response.body);
    print(decodedData);
  }
}
