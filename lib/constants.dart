import 'package:dream11/player_model.dart';
import 'package:flutter/material.dart';

class Constants {
  static Color tileBgColor = Colors.grey.shade200;
  static String currency = "BDT";

  static getPlayerRoleText(PLAYERROLE role) {
    switch (role) {
      case PLAYERROLE.AllROUNDER:
        return "Allrounder";
      case PLAYERROLE.BATSMAN:
        return "Batsman";
      case PLAYERROLE.BOWLER:
        return "Bowler";
      case PLAYERROLE.WICKETKEEPER:
        return "WicketKeeper";
      default:
        return "Player";
    }
  }
}
