// ignore_for_file: lines_longer_than_80_chars

import "../../titles/domain/player_title.dart";

class TitlesRepository {
  static const List<PlayerTitle> playerTitles = <PlayerTitle>[
    PlayerTitle(
      title: "Cadet",
      source: "The default title for all Helldivers",
      level: 1,
    ),
    PlayerTitle(title: "Space Cadet", source: "Reach level 5", level: 5),
    PlayerTitle(title: "Sergeant", source: "Reach level 10", level: 10),
    PlayerTitle(title: "Master Sergeant", source: "Reach level 15", level: 15),
    PlayerTitle(title: "Chief", source: "Reach level 20", level: 20),
    PlayerTitle(
      title: "Space Chief Prime",
      source: "Reach level 25",
      level: 25,
    ),
    PlayerTitle(title: "Death Captain", source: "Reach level 30", level: 30),
    PlayerTitle(title: "Marshall", source: "Reach level 35", level: 35),
    PlayerTitle(title: "Star Marshall", source: "Reach level 40", level: 40),
    PlayerTitle(title: "Admiral", source: "Reach level 45", level: 45),
    PlayerTitle(title: "Skull Admiral", source: "Reach level 50", level: 50),
    PlayerTitle(title: "Fleet Admiral", source: "Reach level 60", level: 60),
    PlayerTitle(
      title: "Admirable Admiral",
      source: "Reach level 70",
      level: 70,
    ),
    PlayerTitle(title: "Commander", source: "Reach level 80", level: 80),
    PlayerTitle(
      title: "Galactic Commander",
      source: "Reach level 90",
      level: 90,
    ),
    PlayerTitle(title: "Hell Commander", source: "Reach level 100", level: 100),
    PlayerTitle(title: "General", source: "Reach level 110", level: 110),
    PlayerTitle(title: "5-Star General", source: "Reach level 120", level: 120),
    PlayerTitle(
      title: "10-Star General",
      source: "Reach level 130",
      level: 130,
    ),
    PlayerTitle(title: "Private", source: "Reach level 140", level: 140),
    PlayerTitle(title: "Super Private", source: "Reach level 150", level: 150),
    PlayerTitle(
      title: "Super Citizen",
      source:
          "Buy the Super Citizen edition of Helldivers 2 or the Super Citizen upgrade pack if you already own the game.",
      buyable: true,
    ),
    PlayerTitle(
      title: "Viper Commando",
      source:
          "Buy it from the Helldivers 2 Viper Commandos Warbond using Medals",
      buyable: true,
    ),
    PlayerTitle(
      title: "Fire Safety Officer",
      source:
          "Buy it from the Helldivers 2 Freedom’s Flame Warbond using Medals",
      buyable: true,
    ),
    PlayerTitle(
      title: "Expert Exterminator",
      source:
          "Buy it from the Helldivers 2 Chemical Agents Warbond using Medals",
      buyable: true,
    ),
  ];
}
