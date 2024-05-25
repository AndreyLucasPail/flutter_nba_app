import 'package:dio/dio.dart';

class ApiService {
  static final ApiService _instance = ApiService.internal();

  factory ApiService() => _instance;

  ApiService.internal();

  final String apiKey = "d6cdad22-826f-4c38-b2cb-2b443a55f67c";

  final Dio _dio = Dio();

  Future<Map<String, dynamic>> request({required String search}) async {
    String url = "https://api.balldontlie.io/v1/$search/?per_page=100";

    try {
      //_dio.options.headers["authorization"] = apiKey;

      final response = await _dio.get(
        url,
        options: Options(
          headers: {"authorization": apiKey},
        ),
      );
      //print(response.data.toString());

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("Error: $e");
      return {};
    }
  }
}
