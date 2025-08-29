import "package:http/http.dart" as http;

class HttpService {
  static final serverIP = "192.168.114.196";
  static final scheme = "http";

  HttpService._();

  static Future<void> sendRequest(commandKey) async {
    final url = Uri.parse("$scheme://$serverIP/command?key=$commandKey");
    print("Calling: $url");
    await http.get(url);
  }
}
