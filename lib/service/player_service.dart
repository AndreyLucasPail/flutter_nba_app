import 'package:nba_app_flutter/models/player_model.dart';
import 'package:nba_app_flutter/service/api/api_service.dart';

class PlayerService {
  static final PlayerService _instance = PlayerService.internal();

  factory PlayerService() => _instance;

  PlayerService.internal();

  final ApiService _apiService = ApiService();

  Future<List<PlayerModel>> getPlayers() async {
    final response = await _apiService.request(search: "player");

    List data = response["data"];

    if (response.containsKey(["data"])) {
      return data.map((json) => PlayerModel.fromJson(json)).toList();
    } else {
      throw Exception('No data found');
    }
  }
}
