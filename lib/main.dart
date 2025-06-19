import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main() async {
  final siteurl = "amitsingh1130.github.io";
  final suburl = "/myjsonfiles/data.json";
  final url = Uri.https(siteurl, suburl, {});

  try {
    final response = await http.get(url);
    //     print(response);
    //     print(response.body);
    print(response.statusCode);
    var data = convert.jsonDecode(response.body);
    print(data);
  } catch (e) {
    print(e);
  }
}
