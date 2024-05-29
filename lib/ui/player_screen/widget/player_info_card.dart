import 'package:auto_size_text/auto_size_text.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                infoType!,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              AutoSizeText(
                playerInfo!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
