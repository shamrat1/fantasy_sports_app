import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class Match {
  Match({
    this.teamOne,
    this.teamTwo,
    this.teamOneIcon,
    this.teamTwoIcon,
    this.timeRemaining,
    this.category,
    this.winnersCount,
    this.matchTime,
  });

  String? timeRemaining;
  String? category;
  Icon? teamOneIcon;
  Icon? teamTwoIcon;
  String? teamTwo;
  String? teamOne;
  String? winnersCount;
  Jiffy? matchTime;
}

Icon getIcon(dynamic data) {
  return Icon(
    data,
    size: 50,
  );
}

enum Schedule {
  upcoming,
  live,
  results,
}

List<Match> upcomings = [
  Match(
    teamOne: "Kolkata Knight Riders",
    teamTwo: "Chennai Super Kings",
    teamOneIcon: getIcon(Icons.bathroom),
    teamTwoIcon: getIcon(Icons.watch),
    category: "Cricket",
    timeRemaining: "10h 13m",
    winnersCount: "15",
    matchTime: Jiffy("2022/05/24 10:20 PM", "yyyy/MM/dd hh:mm aa"),
  ),
  Match(
    teamOne: "Bangladesh",
    teamTwo: "Sri Lanka",
    teamOneIcon: getIcon(Icons.shield),
    teamTwoIcon: getIcon(Icons.tiktok),
    category: "Cricket",
    timeRemaining: "12h",
    matchTime: Jiffy("2022/05/24 11:20 PM", "yyyy/MM/dd hh:mm aa"),
    winnersCount: "5",
  ),
  Match(
      teamOne: "Barcalona",
      teamTwo: "Real Madrid",
      teamOneIcon: getIcon(Icons.back_hand),
      teamTwoIcon: getIcon(Icons.bolt),
      category: "Football",
      timeRemaining: "Tomorrow",
      matchTime: Jiffy("2022/05/25 10:20 AM", "yyyy/MM/dd hh:mm aa"),
      winnersCount: "25"),
  Match(
      teamOne: "Inter Millan",
      teamTwo: "Arsenal",
      teamOneIcon: getIcon(Icons.icecream),
      teamTwoIcon: getIcon(Icons.ice_skating_rounded),
      matchTime: Jiffy("2022/05/25 11:20 AM", "yyyy/MM/dd hh:mm aa"),
      category: "Football",
      timeRemaining: "Tomorrow",
      winnersCount: "10"),
  Match(
      teamOne: "Delhi Capitals",
      teamTwo: "Punjab Kings",
      teamOneIcon: getIcon(Icons.icecream),
      teamTwoIcon: getIcon(Icons.ice_skating_rounded),
      category: "Football",
      matchTime: Jiffy("2022/05/25 00:00 AM", "yyyy/MM/dd hh:mm aa"),
      timeRemaining: "Tomorrow",
      winnersCount: "10"),
];

List<Match> live = [
  Match(
      teamOne: "Australia",
      teamTwo: "South Africa",
      teamOneIcon: getIcon(Icons.audiotrack),
      teamTwoIcon: getIcon(Icons.sanitizer),
      category: "Cricket",
      timeRemaining: "Live",
      matchTime: Jiffy("2022/05/24 05:20 PM", "yyyy/MM/dd hh:mm aa"),
      winnersCount: "7"),
  Match(
      teamOne: "NY Gaints",
      teamTwo: "Chicago Bulls",
      teamOneIcon: getIcon(Icons.shield),
      teamTwoIcon: getIcon(Icons.tiktok),
      category: "Basket Ball",
      timeRemaining: "Live",
      matchTime: Jiffy("2022/05/24 10:00 AM", "yyyy/MM/dd hh:mm aa"),
      winnersCount: "5"),
  Match(
      teamOne: "Baryen Munich",
      teamTwo: "Real Sodedad",
      teamOneIcon: getIcon(Icons.backup),
      teamTwoIcon: getIcon(Icons.real_estate_agent_outlined),
      category: "Football",
      timeRemaining: "Live",
      matchTime: Jiffy("2022/05/24 01:20 PM", "yyyy/MM/dd hh:mm aa"),
      winnersCount: "11"),
];

List<Match> results = [
  Match(
      teamOne: "Australia",
      teamTwo: "South Africa",
      teamOneIcon: getIcon(Icons.audiotrack),
      teamTwoIcon: getIcon(Icons.sanitizer),
      category: "Cricket",
      matchTime: Jiffy("2022/05/23 05:20 PM", "yyyy/MM/dd hh:mm aa"),
      winnersCount: "7"),
  Match(
      teamOne: "NY Gaints",
      teamTwo: "Chicago Bulls",
      teamOneIcon: getIcon(Icons.shield),
      teamTwoIcon: getIcon(Icons.tiktok),
      category: "Basket Ball",
      matchTime: Jiffy("2022/05/22 05:20 PM", "yyyy/MM/dd hh:mm aa"),
      winnersCount: "5"),
  Match(
      teamOne: "Baryen Munich",
      teamTwo: "Real Sodedad",
      teamOneIcon: getIcon(Icons.backup),
      teamTwoIcon: getIcon(Icons.real_estate_agent_outlined),
      category: "Football",
      matchTime: Jiffy("2022/05/21 05:20 PM", "yyyy/MM/dd hh:mm aa"),
      winnersCount: "11"),
  Match(
      teamOne: "Kolkata Knight Riders",
      teamTwo: "Chennai Super Kings",
      teamOneIcon: getIcon(Icons.bathroom),
      teamTwoIcon: getIcon(Icons.watch),
      matchTime: Jiffy("2022/05/20 05:20 PM", "yyyy/MM/dd hh:mm aa"),
      category: "Cricket",
      winnersCount: "15"),
  Match(
      teamOne: "Bangladesh",
      teamTwo: "Sri Lanka",
      teamOneIcon: getIcon(Icons.shield),
      teamTwoIcon: getIcon(Icons.tiktok),
      matchTime: Jiffy("2022/05/19 05:20 PM", "yyyy/MM/dd hh:mm aa"),
      category: "Cricket",
      winnersCount: "5"),
  Match(
      teamOne: "Barcalona",
      teamTwo: "Real Madrid",
      teamOneIcon: getIcon(Icons.back_hand),
      teamTwoIcon: getIcon(Icons.bolt),
      category: "Football",
      matchTime: Jiffy("2022/05/10 05:20 PM", "yyyy/MM/dd hh:mm aa"),
      winnersCount: "25"),
  Match(
      teamOne: "Inter Millan",
      teamTwo: "Arsenal",
      teamOneIcon: getIcon(Icons.icecream),
      teamTwoIcon: getIcon(Icons.ice_skating_rounded),
      category: "Football",
      matchTime: Jiffy("2022/05/10 04:20 PM", "yyyy/MM/dd hh:mm aa"),
      winnersCount: "10"),
  Match(
      teamOne: "Delhi Capitals",
      teamTwo: "Punjab Kings",
      teamOneIcon: getIcon(Icons.icecream),
      teamTwoIcon: getIcon(Icons.ice_skating_rounded),
      category: "Football",
      matchTime: Jiffy("2022/05/05 05:20 PM", "yyyy/MM/dd hh:mm aa"),
      winnersCount: "10"),
];
