import 'package:flutter/material.dart';
import 'package:nba_app_flutter/models/player_model.dart';
import 'package:nba_app_flutter/service/player_service.dart';
import 'package:nba_app_flutter/ui/home/widget/player_card.dart';

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
            padding: const EdgeInsets.all(16.0),
            itemCount: playerList.length,
            itemBuilder: (context, index) {
              return PlayerCard(player: playerList[index]);
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
