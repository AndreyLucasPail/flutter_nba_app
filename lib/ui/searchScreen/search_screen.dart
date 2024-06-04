import 'package:flutter/material.dart';
import 'package:nba_app_flutter/models/player_model.dart';
import 'package:nba_app_flutter/service/player_service.dart';
import 'package:nba_app_flutter/ui/home/widget/player_card.dart';

class SearchScreenArgs {
  SearchScreenArgs({this.queryArgs});

  String? queryArgs;
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  static const tag = "/searchScreen";

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<PlayerModel> playersList = [];
  String? query;
  final PlayerService _playerService = PlayerService();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)!.settings.arguments as SearchScreenArgs;

    setState(() {
      query = args.queryArgs;
      fechtPlayers(query!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.grey[100],
          elevation: 0,
        ),
        backgroundColor: Colors.grey[100],
        body: body(),
      ),
    );
  }

  Future<void> fechtPlayers(String query) async {
    final players = await _playerService.searchPlayer(search: query);

    setState(() {
      playersList = players;
    });
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: playersList.isEmpty
          ? const Center(
              child: Text(
                "Nenhum Jogador foi encontrado.",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            )
          : playerListCard(),
    );
  }

  Widget playerListCard() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:
            playersList.map((player) => PlayerCard(player: player)).toList(),
      ),
    );
  }
}
