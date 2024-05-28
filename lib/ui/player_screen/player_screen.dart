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
        body: body(),
      ),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          PlayerInfoCard(
            infoType: "Nome:",
          ),
          PlayerInfoCard(
            playerInfo: player!.firstName,
          )
        ],
      ),
    );
  }
}
