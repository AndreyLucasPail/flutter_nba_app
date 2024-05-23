class PlayerModel {
  const PlayerModel({
    this.id,
    this.firstName,
    this.lastName,
    this.position,
    this.heigth,
    this.weight,
    this.jerseyNumber,
    this.college,
    this.country,
    this.draftYear,
    this.draftRound,
    this.draftPosition,
    this.team,
  });

  final int? id;
  final String? firstName;
  final String? lastName;
  final String? position;
  final String? heigth;
  final String? weight;
  final String? jerseyNumber;
  final String? college;
  final String? country;
  final int? draftYear;
  final int? draftRound;
  final int? draftPosition;
  final Map<String, dynamic>? team;

  factory PlayerModel.fromJson(Map<String, dynamic> json) => PlayerModel(
        id: json["id"] ?? 0,
        firstName: json["first_name"] ?? "",
        lastName: json["last_name"] ?? "",
        position: json["position"] ?? "",
        heigth: json["height"] ?? "",
        weight: json["weight"] ?? "",
        jerseyNumber: json["jersey_number"] ?? "",
        college: json["college"] ?? "",
        country: json["country"] ?? "",
        draftYear: json["draft_year"] ?? 0,
        draftRound: json["draft_round"] ?? 0,
        draftPosition: json["draft_number"] ?? 0,
        team: json["team"] ?? {},
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "position": position,
        "height": heigth,
        "weight": weight,
        "jersey_number": jerseyNumber,
        "college": college,
        "country": country,
        "draft_year": draftYear,
        "draft_round": draftRound,
        "draft_number": draftPosition,
        "team": team,
      };
}
