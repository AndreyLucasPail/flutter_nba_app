import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  static final ApiService _instance = ApiService.internal();

  factory ApiService() => _instance;

  ApiService.internal();

  final String apiKey = dotenv.env["API_KEY"]!;

  final Dio _dio = Dio();

  Future<Map<String, dynamic>> request({required String query}) async {
    String url = "${dotenv.env["BASE_URL"]}$query";

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
