import 'package:flutter/material.dart';
import 'package:nba_app_flutter/models/player_model.dart';
import 'package:nba_app_flutter/ui/player_screen/widget/player_info_card.dart';

class PlayerScreenArgs {
  PlayerScreenArgs({this.player});

  PlayerModel? player;
}

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key, this.player});

  static const tag = "/playerScreen";

  final PlayerModel? player;

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  PlayerModel? player;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)!.settings.arguments as PlayerScreenArgs;

    setState(() {
      player = args.player;
    });
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
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child: Column(
          children: [
            appBar(),
            const SizedBox(height: 25),
            playerAvatar(),
            const SizedBox(height: 20),
            playerCardOrder(),
          ],
        ),
      ),
    );
  }

  Widget appBar() {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        const Text(
          "Informaçôes do Jogador",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ],
    );
  }

  Widget playerAvatar() {
    return const CircleAvatar(
      radius: 50,
    );
  }

  Widget playerCardOrder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PlayerInfoCard(
          infoType: "Nome:",
          playerInfo: "${player!.firstName} ${player!.lastName}",
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: PlayerInfoCard(
                infoType: "Posiçâo:",
                playerInfo: player!.position,
              ),
            ),
            Expanded(
              child: PlayerInfoCard(
                infoType: "Jersey Number:",
                playerInfo: player!.jerseyNumber,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: PlayerInfoCard(
                infoType: "Altura:",
                playerInfo: "${player!.heigth} ft",
              ),
            ),
            Expanded(
              child: PlayerInfoCard(
                infoType: "Peso:",
                playerInfo: "${player!.weight} lb",
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: PlayerInfoCard(
                infoType: "País:",
                playerInfo: player!.country,
              ),
            ),
            Expanded(
              child: PlayerInfoCard(
                infoType: "Universidade:",
                playerInfo: player!.college,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: PlayerInfoCard(
                infoType: "Time:",
                playerInfo: player!.team!["full_name"],
              ),
            ),
            Expanded(
              child: PlayerInfoCard(
                infoType: "Conferência:",
                playerInfo: player!.team!["conference"],
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: PlayerInfoCard(
                infoType: "draft:",
                playerInfo: "${player!.draftYear}",
              ),
            ),
            Expanded(
              child: PlayerInfoCard(
                infoType: "Posição:",
                playerInfo: "${player!.draftPosition}",
              ),
            ),
            Expanded(
              child: PlayerInfoCard(
                infoType: "Round:",
                playerInfo: "${player!.draftRound}",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
