import 'package:flutter/material.dart';
import 'package:nba_app_flutter/models/player_model.dart';
import 'package:nba_app_flutter/service/player_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const tag = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PlayerService _playerService = PlayerService();
  List<PlayerModel> playerList = [];

  @override
  void initState() {
    super.initState();

    fetchPlayers();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: body(),
      ),
    );
  }

  Widget body() {
    return playerList.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: playerList.length,
            itemBuilder: (context, index) {
              final player = playerList[index];
              return ListTile(
                title: Text(
                  player.firstName!,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                subtitle: Text(
                  player.lastName!,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              );
            },
          );
  }

  Future<void> fetchPlayers() async {
    final players = await _playerService.getPlayers();

    setState(() {
      playerList = players;
    });
  }
}
