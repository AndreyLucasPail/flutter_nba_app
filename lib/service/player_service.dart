import 'package:nba_app_flutter/models/player_model.dart';
import 'package:nba_app_flutter/service/api/api_service.dart';

class PlayerService {
  static final PlayerService _instance = PlayerService.internal();

  factory PlayerService() => _instance;

  PlayerService.internal();

  final ApiService _apiService = ApiService();

  Future<List<PlayerModel>> getPlayers() async {
    final response = await _apiService.request(query: "players/?per_page=100");

    List data = response["data"];

    print("API response: ${data}");

    return data.map((json) => PlayerModel.fromJson(json)).toList();
  }

  Future<List<PlayerModel>> searchPlayer({required String search}) async {
    final reponse = await _apiService.request(query: "players/?search=$search");

    List data = reponse["data"];

    return data.map((json) => PlayerModel.fromJson(json)).toList();
  }
}
