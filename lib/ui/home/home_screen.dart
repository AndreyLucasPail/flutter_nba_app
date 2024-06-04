import 'package:flutter/material.dart';
import 'package:nba_app_flutter/models/player_model.dart';
import 'package:nba_app_flutter/service/player_service.dart';
import 'package:nba_app_flutter/ui/home/widget/player_card.dart';
import 'package:nba_app_flutter/ui/searchScreen/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const tag = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PlayerService _playerService = PlayerService();
  List<PlayerModel> playerList = [];
  bool showSearchButton = false;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    fetchPlayers();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: body(),
      ),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              child: showSearchButton ? search() : searchIcon(),
            ),
            const SizedBox(height: 20),
            playerList.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : playerListCard(),
          ],
        ),
      ),
    );
  }

  Future<void> fetchPlayers() async {
    final players = await _playerService.getPlayers();

    setState(() {
      playerList = players;
    });
  }

  Widget playerListCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: playerList.map((player) => PlayerCard(player: player)).toList(),
    );
  }

  Widget search() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      key: const ValueKey("search"),
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: TextFormField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: "Search Player...",
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    showSearchButton = !showSearchButton;
                    searchController.clear();
                  });
                },
                icon: const Icon(Icons.close),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(32),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(32),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                SearchScreen.tag,
                arguments: SearchScreenArgs(queryArgs: searchController.text),
              );
            },
            icon: const Icon(
              Icons.search_sharp,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget searchIcon() {
    return AnimatedContainer(
      key: const ValueKey("searchIcon"),
      duration: const Duration(seconds: 1),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(32),
      ),
      child: IconButton(
        onPressed: () {
          setState(() {
            showSearchButton = !showSearchButton;
          });
        },
        icon: const Icon(
          Icons.search,
          color: Colors.white,
        ),
      ),
    );
  }
}
