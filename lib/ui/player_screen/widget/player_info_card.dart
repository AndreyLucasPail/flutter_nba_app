import 'package:flutter/material.dart';

class PlayerInfoCard extends StatelessWidget {
  const PlayerInfoCard({
    super.key,
    this.infoType,
    this.playerInfo,
  });

  final String? infoType;
  final String? playerInfo;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(infoType!),
          Text(playerInfo!),
        ],
      ),
    );
  }
}
