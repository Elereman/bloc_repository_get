import 'package:http/http.dart' as http;

abstract class Gateway {
  http.Response makeRequest();
}
