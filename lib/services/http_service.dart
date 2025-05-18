import "package:http/http.dart" as http;

class HttpService {
  HttpService._();

  static void sendRequest(url) async {
    final parsedUrl = Uri.parse(url);
    final response = await http.get(parsedUrl);

    if(response.statusCode == 200) {
      print("Response body: ${response.body}");
    } else {
      print("Request failed with status: ${response.statusCode}");
    }
  }
}
