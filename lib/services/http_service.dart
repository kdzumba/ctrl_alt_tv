import "package:http/http.dart" as http;

class HttpService {
  static final serverIP = "192.168.1.70";
  static final scheme = "http";

  HttpService._();

  static Future<void> sendRequest(commandKey) async {
    final url = Uri.parse("$scheme://$serverIP/command?key=$commandKey");
    print("[CTRL_ALT_TV]: Calling: $url");
    await http.get(url);
  }
}
